/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sharepointapp;

import com.vmware.vim25.CustomFieldDef;
import com.vmware.vim25.CustomFieldStringValue;
import com.vmware.vim25.CustomFieldValue;
import java.net.URL;
import java.util.TreeMap;
import com.vmware.vim25.GuestDiskInfo;
import com.vmware.vim25.GuestInfo;
import com.vmware.vim25.VirtualMachineConfigSummary;
import com.vmware.vim25.VirtualMachinePowerState;
import com.vmware.vim25.VirtualMachineRuntimeInfo;
import com.vmware.vim25.mo.Folder;
import com.vmware.vim25.mo.InventoryNavigator;
import com.vmware.vim25.mo.ManagedEntity;
import com.vmware.vim25.mo.ServiceInstance;
import com.vmware.vim25.mo.VirtualMachine;
import com.vmware.vim25.mo.util.CommandLineParser;
import com.vmware.vim25.mo.util.OptionSpec;
import com.vmware.vim25.GuestNicInfo;
import com.vmware.vim25.mo.CustomFieldsManager;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import xmldoc.TestDOM;
import sharepointvm.SharepointVM;
import java.util.Map;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import com.microsoft.schemas.sharepoint.soap.UpdateListItems;
import com.microsoft.schemas.sharepoint.soap.UpdateListItemsResponse.UpdateListItemsResult;
import com.sun.org.apache.xerces.internal.dom.ElementNSImpl;
import java.util.ArrayList;
import com.microsoft.schemas.sharepoint.soap.ListsSoap;
import com.microsoft.schemas.sharepoint.soap.UpdateListItems.Updates;
import com.vmware.vim25.Event;
import com.vmware.vim25.EventFilterSpec;
import com.vmware.vim25.EventFilterSpecByEntity;
import com.vmware.vim25.EventFilterSpecRecursionOption;
import com.vmware.vim25.InvalidState;
import com.vmware.vim25.RuntimeFault;
import com.vmware.vim25.mo.EventHistoryCollector;
import com.vmware.vim25.mo.EventManager;
import java.io.FileInputStream;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.Properties;
import java.util.Random;
import javax.naming.directory.Attributes;
import ldapconn.LDAPTest.LDAP;
import org.w3c.dom.*;

/**
 *
 * @author hildebj
 */
public class Main {

   //constants
   private static final String propertiesFile = "sharepointapp.properties";
   private static final long BYTES_TO_GIGABYTES = 1073741824L;
   private static final String VIRTUAL = "Virtual";
   
   //global variables
   static SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'");
   static SimpleDateFormat spDf = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
   static SimpleDateFormat retSpDf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
   static ListsSoap port = null;
   
   private static Document rootDocument;
   private static Element rootDocContent;
   private static Integer itemId = 1;

   public static void main(String[] args) throws Exception, 
           javax.xml.parsers.ParserConfigurationException,
           javax.xml.transform.TransformerException,
           javax.xml.transform.TransformerConfigurationException {
      
      String listName = null;
      FileInputStream inputStream = null;
      String VM_INITIAL_STATUS = null;
      Properties props = new Properties();
      try {
         inputStream = new FileInputStream(propertiesFile);
         props.load(inputStream);        
         listName = props.getProperty("listName");
         VM_INITIAL_STATUS = props.getProperty("VM_INITIAL_STATUS");
      } catch (java.io.FileNotFoundException fe) {
         System.err.println("File not found: " + propertiesFile);
         throw fe;
      } finally {
         inputStream.close();
      }
      
      //create a TreeMap of Sharepoint items for quick lookup stored by name
      Map<String, SharepointVM> spVmMap = new TreeMap<String, SharepointVM>();
      
      //create a TreeMap of vSphere items for quick lookup stored by name
      Map<String, SharepointVM> viVmMap = new TreeMap<String, SharepointVM>();
      
      buildSpTree(args, spVmMap);

      buildViTree(args, viVmMap);
      
      //create another two TreeMaps for matching on VM_ID
      //case where VM name is changed.
      
      Map<String, SharepointVM> vmIdSpVmMap = new TreeMap<String, SharepointVM>();
      Map<String, SharepointVM> vmIdViVmMap = new TreeMap<String, SharepointVM>();
      
      for (Map.Entry<String, SharepointVM> entry : viVmMap.entrySet()) {
         vmIdViVmMap.put(entry.getValue().getVmId(), entry.getValue());
      }
      
      Random generator = new Random( 19580427 );
      
      for (Map.Entry<String, SharepointVM> entry : spVmMap.entrySet()) {
         //if VM_ID is null or blank then we should use the ID from Virtual Center
         //if the VM is in Virtual Center
         String vmId = entry.getValue().getVmId();
         if (vmId == null || vmId.equals("")) {
           SharepointVM spVm = viVmMap.get(entry.getKey());
           if (spVm != null) {
             vmId = spVm.getVmId();
           } else {
             // orphaned VM with no VM_ID, use Random to create a VM_ID
             vmId = Integer.toString(generator.nextInt());
           }
         }
         vmIdSpVmMap.put(vmId, entry.getValue());
      }
      
      //loop through viTree looking for items in SP tree. If found then
      //update the id to match SP. If not found then insert into SP tree.
      
      for(Map.Entry<String, SharepointVM> entry : viVmMap.entrySet()) {
         SharepointVM spVm = spVmMap.get(entry.getKey());
         if (spVm != null) {
            entry.getValue().setId(spVm.getId());
         } else {
            //case when VM name is changed, we would have a match on VM_ID
            //and VM name would not be found
            //case when VM is new, VM_ID and VM name would not be found in Sharepoint
            String viVmId = entry.getValue().getVmId();
            SharepointVM oldVm = vmIdSpVmMap.get(viVmId);
            if (oldVm != null) {
               String oldVmName = oldVm.getHostName();
               String oldId = oldVm.getId();
               //update the name of VM in Sharepoint
               String newVmName = vmIdViVmMap.get(viVmId).getHostName();
               //remove old key
               spVmMap.remove(oldVmName.toLowerCase());
               //add new entry
               oldVm.setHostName(newVmName);
               entry.getValue().setId(oldId);
               spVmMap.put(newVmName.toLowerCase(), oldVm);
               // to pass the not equal test, the names shouldn't match
               oldVm.setHostName(oldVmName);
            } else {
               //case where VM is new, put it in spVmMap and vmIdSpVmMap
               spVmMap.put(entry.getKey(), entry.getValue());
               vmIdSpVmMap.put(entry.getValue().getVmId(), entry.getValue());
            }
         }
      }
      
      //build an XML document for the batch to UpdateListItems
      Element rootElement = null;
      DocumentBuilder docBuilder = null;
      DocumentBuilderFactory dbfac = 
            DocumentBuilderFactory.newInstance();
      docBuilder = dbfac.newDocumentBuilder();
      rootDocument = docBuilder.newDocument();

      //Creates the root element
      rootElement = rootDocument.createElement("Batch");
      rootDocument.appendChild(rootElement);

      //Creates the batch attributes
      rootElement.setAttribute("ListVersion", "1");
      rootElement.setAttribute("OnError", "Continue");
      
      //iterate through sp tree and match with vi tree
      for (Map.Entry<String, SharepointVM> entry : vmIdSpVmMap.entrySet()) {
         //batching every 100 updates so start new rootDocument at 101
         if (itemId == 101) {
            System.out.println("REQUEST:"
               + Manager.xmlToString(rootDocument));

            //initializing the Web Service operation here
            Updates updates = new UpdateListItems.Updates();

            //Preparing the request for the update
            Object docObj = (Object) rootDocument.getDocumentElement();
            updates.getContent().add(0, docObj);

            //Sending the insert request to the Lists.UpdateListItems Web Service
            UpdateListItemsResult result = port
                 .updateListItems(listName, updates);

            /*
            *Printing the response in the console.
            *If successful, the inserted item will be returned
            */
            System.out.println("RESPONSE : "
                 + Manager.xmlToString((org.w3c.dom.Document) 
                 (((ElementNSImpl) result.getContent().get(0))
                 .getOwnerDocument())));
            
            dbfac = DocumentBuilderFactory.newInstance();
            docBuilder = dbfac.newDocumentBuilder();
            rootDocument = docBuilder.newDocument();

            //Creates the root element
            rootElement = rootDocument.createElement("Batch");
            rootDocument.appendChild(rootElement);

            //Creates the batch attributes
            rootElement.setAttribute("ListVersion", "1");
            rootElement.setAttribute("OnError", "Continue");
            
            //reset batch starting at 1
            itemId =1;
         }
         
         SharepointVM spVm = vmIdViVmMap.get(entry.getKey());
         if (spVm == null) {
            //item not found so set running to false if not already false
            if (entry.getValue().getIsRunning().equals("1")) {
               HashMap<String, String> item = new HashMap<String, String>();
               item.put("Running_x0020_VM_x0020_in_x0020_", "0");
               item.put("ID", entry.getValue().getId());
               rootDocContent = rootDocument.createElement("Method");
               rootDocContent.setAttribute("ID", itemId.toString());
               rootDocContent.setAttribute("Cmd", "Update");
               rootDocument.getElementsByTagName("Batch").item(0)
                     .appendChild(rootDocContent);

               Element createdElement = null;
              //Adds attribute by attribute to fields
              for (Map.Entry<String, String> aField : item.entrySet()) {
                  createdElement = rootDocument.createElement("Field");
                  createdElement.setAttribute("Name", aField.getKey());
                  Text attributeValue = rootDocument
                          .createTextNode("" + aField.getValue());
                  createdElement.appendChild(attributeValue);
                  rootDocContent.appendChild(createdElement);
              }

               itemId++;
            }

         } else if (spVm.getId() == null || (spVm.getId()).isEmpty()) {
            //if there is no itemId in the vi tree then it is new, so insert
            HashMap<String, String> item = new HashMap<String, String>();
            if (spVm.getHostName().isEmpty() || spVm.getHostName() == null) {
               System.out.println("hostName cannot be null");
               return;
            }
            item.put("Title", spVm.getHostName());
            if (spVm.getStatus() != null)
              item.put("Status", spVm.getStatus());
            if (spVm.getOs() != null)
               item.put("Operating_x0020_System", spVm.getOs());
            if (spVm.getPrimaryIp() != null)
               item.put("IP_x0020_Address_x0028_es_x0029_", spVm.getPrimaryIp());
            if (spVm.getAllIp() != null)
               item.put("Additional_x0020_IP_x0020_Addres", spVm.getAllIp());
            if (spVm.getProcSpec() != null)
               item.put("Processor_x0020_spec", spVm.getProcSpec());
            if (spVm.getMemSpec() != null)
               item.put("Memory_x0020_spec", spVm.getMemSpec());
            if (spVm.getDriveSpec() != null)
               item.put("Drive_x0020_spec", spVm.getDriveSpec());
            item.put("Physical_x0020_or_x0020_Virtual", VIRTUAL);
            if (spVm.getCreatedBy() != null)
               item.put("VM_x0020_CreatedBy", spVm.getCreatedBy());
            
            Date d = null;
            if (spVm.getCreatedOn() != null) {
               try {
                  d = spDf.parse(spVm.getCreatedOn());
               } catch (ParseException pe) {
                  item.put("VM_x0020_CreatedOn", "01/01/1900T00:00:00Z");
               }
            }
            
            item.put("VM_x0020_CreatedOn", d == null ?
                    "1900-01-01T00:00:00Z" : df.format(d));
            item.put("Running_x0020_VM_x0020_in_x0020_", "1");
            item.put("VM_ID", spVm.getVmId());
            
            rootDocContent = rootDocument.createElement("Method");
            rootDocContent.setAttribute("ID", itemId.toString());
            rootDocContent.setAttribute("Cmd", "New");
            rootDocument.getElementsByTagName("Batch").item(0)
                  .appendChild(rootDocContent);
                       
            Element createdElement = null;
           //Adds attribute by attribute to fields
           for (Map.Entry<String, String> aField : item.entrySet()) {
               createdElement = rootDocument.createElement("Field");
               createdElement.setAttribute("Name", aField.getKey());
               Text attributeValue = rootDocument
                       .createTextNode("" + aField.getValue());
               createdElement.appendChild(attributeValue);
               rootDocContent.appendChild(createdElement);
           }
           itemId++;
         } else if (entry.getValue().equals(spVm)) {
            //no change so do nothing
         } else {
            //VM found but attributes changed
            //only update when status is "Live - Operational"
            if (entry.getValue().getStatus().equals(VM_INITIAL_STATUS)) {
              HashMap<String, String> item = new HashMap<String, String>();
              item.put("ID", spVm.getId());
              item.put("Title", spVm.getHostName());
              if (spVm.getOs() != null)
                 item.put("Operating_x0020_System", spVm.getOs());
              if (spVm.getPrimaryIp() != null)
                 item.put("IP_x0020_Address_x0028_es_x0029_", spVm.getPrimaryIp());
              if (spVm.getAllIp() != null)
                 item.put("Additional_x0020_IP_x0020_Addres", spVm.getAllIp());
              if (spVm.getProcSpec() != null)
                 item.put("Processor_x0020_spec", spVm.getProcSpec());
              if (spVm.getMemSpec() != null)
                 item.put("Memory_x0020_spec", spVm.getMemSpec());
              if (spVm.getDriveSpec() != null)
                 item.put("Drive_x0020_spec", spVm.getDriveSpec());
              if (spVm.getCreatedBy() != null)
                 item.put("VM_x0020_CreatedBy", spVm.getCreatedBy());

              Date d = null;
              if (spVm.getCreatedOn() != null) {
                 try {
                    d = spDf.parse(spVm.getCreatedOn());
                 } catch (ParseException pe) {
                    item.put("VM_x0020_CreatedOn", "01/01/1900T00:00:00Z");
                 }
              }

              item.put("VM_x0020_CreatedOn", d == null ?
                      "1900-01-01T00:00:00Z" : df.format(d));
              item.put("Running_x0020_VM_x0020_in_x0020_", "1");
              item.put("VM_ID", spVm.getVmId());
              item.put("Status", spVm.getStatus());

              rootDocContent = rootDocument.createElement("Method");
              rootDocContent.setAttribute("ID", itemId.toString());
              rootDocContent.setAttribute("Cmd", "Update");
              rootDocument.getElementsByTagName("Batch").item(0)
                    .appendChild(rootDocContent);

             Element createdElement = null;
             //Adds attribute by attribute to fields
             for (Map.Entry<String, String> aField : item.entrySet()) {
                 createdElement = rootDocument.createElement("Field");
                 createdElement.setAttribute("Name", aField.getKey());
                 Text attributeValue = rootDocument
                         .createTextNode("" + aField.getValue());
                 createdElement.appendChild(attributeValue);
                 rootDocContent.appendChild(createdElement);
             }
         itemId++;
         }
            else {
               System.out.println(spVm.getHostName() + " has status of " +
                      spVm.getStatus());
            }
         }
      }
      
      System.out.println("REQUEST:"
        + Manager.xmlToString(rootDocument));
      
      //only send updates if there are any
      
      if (rootElement.hasChildNodes()) {

         //initializing the Web Service operation here
         Updates updates = new UpdateListItems.Updates();

         //Preparing the request for the update
         Object docObj = (Object) rootDocument.getDocumentElement();
         updates.getContent().add(0, docObj);

         //Sending the insert request to the Lists.UpdateListItems Web Service
         UpdateListItemsResult result = port
                 .updateListItems(listName, updates);

         /*
          *Printing the response in the console.
          *If successful, the inserted item will be returned
          */
         System.out.println("RESPONSE : "
                 + Manager.xmlToString((org.w3c.dom.Document) 
                 (((ElementNSImpl) result.getContent().get(0))
                 .getOwnerDocument())));
       }
   }

   private static void buildViTree(String[] args, Map<String, 
           SharepointVM> viVmMap) throws Exception {
      ServiceInstance si = null;
      String CREATED_BY = null;
      String CREATED_ON = null;
      String VM_INITIAL_STATUS = null;
      String ldapServer = null;
      String domain = null;
      String searchBase = null;
      String excludeFolder = null;
      FileInputStream inputStream = null;
      Properties props = new Properties();
      try {
         inputStream = new FileInputStream(propertiesFile);
         props.load(inputStream);
         excludeFolder = props.getProperty("excludeFolder");
         CREATED_BY = props.getProperty("CREATED_BY");
         CREATED_ON = props.getProperty("CREATED_ON");
         VM_INITIAL_STATUS = props.getProperty("VM_INITIAL_STATUS");
      } catch (java.io.FileNotFoundException fe) {
         System.err.println("File not found: " + propertiesFile);
         throw fe;
      } finally {
         inputStream.close();
      }
      try {
         CommandLineParser clp = new CommandLineParser(
            new OptionSpec[]{}, args);
         String urlStr = clp.get_option("url");
         String username = clp.get_option("username");
         String password = clp.get_option("password");
         si = new ServiceInstance(new URL(urlStr), 
            username, password, true);
         Folder rootFolder = si.getRootFolder();
         ManagedEntity[] mes = new InventoryNavigator(rootFolder)
            .searchManagedEntities("VirtualMachine");
         if (mes == null || mes.length == 0) {
            si.getServerConnection().logout();
            return;
         }
         Folder labFolder = (Folder) new InventoryNavigator(rootFolder)
            .searchManagedEntity("Folder", excludeFolder);
         //filter for lab machines
         ManagedEntity[] mesFilter = new InventoryNavigator(labFolder)
            .searchManagedEntities("VirtualMachine");
         //create a TreeMap for quick lookup stored by name
         Map<String, ManagedEntity> meMap = new TreeMap<String, ManagedEntity>();
         //populate TreeMap
         for (ManagedEntity me : mes) {
            meMap.put(me.getName().toLowerCase(), me);
         }
         //remove filtered objects
         for (ManagedEntity me : mesFilter) {
            meMap.remove(me.getName().toLowerCase());
         }
         CustomFieldsManager cfm = si.getCustomFieldsManager();
         int CREATEDBY_KEY = -1;
         int CREATEDON_KEY = -1;
         for (Map.Entry<String, ManagedEntity> entry : meMap.entrySet()) {
            String id = null;
            String hostName = null;
            String status = VM_INITIAL_STATUS;
            String os = null;
            String primaryIp = null;
            String allIp = null;
            String procSpec = null;
            String memSpec = null;
            String driveSpec = null;
            String createdBy = null;
            String createdOn = null;
            String vmId = null;
            
            VirtualMachine vm = (VirtualMachine) entry.getValue();
            VirtualMachineRuntimeInfo vmri = vm.getRuntime();
            if (vmri.getPowerState() == VirtualMachinePowerState.poweredOn) {
               GuestInfo gi = vm.getGuest();
               if (gi.guestState.equals("running")) {
                  VirtualMachineConfigSummary vcs = vm.getSummary().getConfig();
                  GuestDiskInfo[] gdi = gi.getDisk();

                  hostName = gi.hostName;
                  os = gi.guestFullName;
                  primaryIp = gi.ipAddress;
                  vmId = vm.getMOR().get_value();

                  CustomFieldDef[] defs = vm.getAvailableField();

                  for (int i = 0; defs != null && i < defs.length; i++) {
                     if (CREATED_BY.equals(defs[i].getName())) {
                        CREATEDBY_KEY = defs[i].getKey();
                     }
                     else if (CREATED_ON.equals(defs[i].getName())) {
                        CREATEDON_KEY = defs[i].getKey();
                     }
                  }

                  if (CREATEDBY_KEY == -1) {
                     CREATEDBY_KEY = cfm.addCustomFieldDef(CREATED_BY,
                             "VirtualMachine", null, null).getKey();
                  }
                  if (CREATEDON_KEY == -1) {
                     CREATEDON_KEY = cfm.addCustomFieldDef(CREATED_ON,
                             "VirtualMachine", null, null).getKey();
                  }

                  CustomFieldValue[] values = vm.getCustomValue();

                  int key1 = getIndex(values, CREATEDBY_KEY);
                  int key2 = getIndex(values, CREATEDON_KEY);

                  if (key1 != -1 && key2 != -1) {
                     createdBy = ((CustomFieldStringValue)values[key1])
                             .getValue();
                     createdOn = ((CustomFieldStringValue)values[key2])
                             .getValue();
                  } else {
                     //create custom attributes for vm
                     String user = "Unknown";
                     String time = "01/01/1900 00:00:00";

                     EventManager em = si.getEventManager();

                     Event event = findVmCreationEvent(em, vm);

                     if (event!= null) {
                        user = !event.getUserName().isEmpty() ? event.getUserName()
                               : user;
                        time = spDf.format(event.getCreatedTime().getTime());
                     }

                     LDAP ldap = new LDAP();
                     Attributes att = null;

                     if (user.indexOf("\\") != -1) {
                      try {
                        inputStream = new FileInputStream(propertiesFile);
                        props.load(inputStream);
                        String[] parts = user.split("\\\\");
                        String userDomain = parts[0];
                        user = parts[1];
                        if (userDomain.equalsIgnoreCase("ONLINEGAMING")) {
                          searchBase = props.getProperty("searchBaseOG");
                          ldapServer = props.getProperty("ldapServerOG");
                          domain = props.getProperty("domainOG");
                        }
                        if (userDomain.equalsIgnoreCase("WZ")) {
                          searchBase = props.getProperty("searchBaseWZ");
                          ldapServer = props.getProperty("ldapServerWZ");
                          domain = props.getProperty("domainWZ");
                        }
         
                      } catch (java.io.FileNotFoundException fe) {
                         System.err.println("File not found: " + propertiesFile);
                         throw fe;
                      } finally {
                         inputStream.close();
                      }
                        
                      String[] parts = username.split("\\\\");
                      String identity = parts[1];
                        
                      att = ldap.getDisplayName(identity, password, domain, 
                              ldapServer, searchBase, user);
                     }

                     if (att != null) {

                        String displayName = att.get("name").get().toString();

                        if (!(displayName.isEmpty() || displayName == null)) {
                           user = displayName;
                        }
                     }

                     //adding attributes to new vm and returning values
                     vm.setCustomValue(CREATED_BY, user);
                     vm.setCustomValue(CREATED_ON, time);
                     createdBy = user;
                     createdOn = time;
                  }

                  GuestNicInfo[] gni = gi.getNet();
                  if (gni != null) {
                     for (GuestNicInfo gn : gni) {
                        String[] ipColl = gn.getIpAddress();
                        if (ipColl == null) allIp = null;
                        else {
                           StringBuilder sbIp = new StringBuilder();
                           String ip = null;
                           for (int i = 0; i < ipColl.length; i++) {
                              ip = ipColl[i];
                              if (ip != null)
                                 sbIp.append(ip);
                              if (i != ipColl.length -1) sbIp.append("\r\n");
                           }
                           allIp = sbIp.toString().trim();
                           if (allIp.isEmpty())
                              allIp = null;
                        }
                     }
                  }

                  procSpec = vcs.numCpu.toString();
                  if (vcs.memorySizeMB == null) 
                     memSpec = null;
                  else {
                     if (vcs.memorySizeMB < 1024) 
                        memSpec = vcs.memorySizeMB + " MB";
                     else memSpec = vcs.memorySizeMB / 1024 + " GB";
                  }
                  if (gdi != null) {
                     StringBuilder sbDisk = new StringBuilder();
                     for (int j = 0; j < gdi.length; j++) {
                        float fdiskSize = (float)gdi[j].getCapacity()
                                / BYTES_TO_GIGABYTES;
                        if (fdiskSize < 1) {
                           int diskSize = Math.round(fdiskSize * 1024);
                           sbDisk.append("Disk ").append(j + 1).append(": ")
                                .append(diskSize).append(" MB");
                        }
                        else {
                           int diskSize = Math.round(fdiskSize);
                           sbDisk.append("Disk ").append(j + 1).append(": ")
                                .append(diskSize).append(" GB");
                        }
                        if (j != gdi.length - 1) sbDisk.append("\r\n");
                     }
                     driveSpec = sbDisk.toString();
                  }

                  if (hostName == null || hostName.isEmpty()) {
                     hostName = vm.getName();
                  }
                  String isRunning = "1";
                  SharepointVM spVm = new SharepointVM(id, hostName, status, os, primaryIp,
                       allIp, procSpec, memSpec, driveSpec, createdBy, createdOn,
                       isRunning, vmId);

                  viVmMap.put(hostName.toLowerCase(), spVm);
               }
            }
         }
      } catch (Exception ex) {
         throw (ex);
      } finally {
         if (si != null) si.getServerConnection().logout();
      }
   }

   private static void buildSpTree(String[] args, 
           Map<String, SharepointVM> spVmMap) {
      try {
         //Authentication parameters
         CommandLineParser clp = new CommandLineParser(
            new OptionSpec[]{}, args);
         String username = clp.get_option("username");
         String password = clp.get_option("password");
         String sharePointWebServiceUrl = null;
         String listName = null;
         FileInputStream inputStream = null;
         Properties props = new Properties();
         try {
            inputStream = new FileInputStream(propertiesFile);
            props.load(inputStream);        
            sharePointWebServiceUrl = props.getProperty("sharePointWebServiceUrl");
            listName = props.getProperty("listName");
         } catch (java.io.FileNotFoundException fe) {
            System.err.println("File not found: " + propertiesFile);
            throw fe;
         } finally {
            inputStream.close();
         }

         //Opening the SOAP port of the Lists Web Service
         port = Manager.sharePointListsAuth(username, password,
            sharePointWebServiceUrl);

         /*
          * Lists Web service parameters
          * The list names below must be the *original* names of the list.
          * if a list or column was renamed from SharePoint afterwards,
          * these parameters don't change.
          */
         
         String rowLimit = "10000";
         ArrayList<String> listColumnNames = new ArrayList<String>();
         listColumnNames.add("ID");
         listColumnNames.add("Title");
         listColumnNames.add("Status");
         listColumnNames.add("Operating_x0020_System");
         listColumnNames.add("IP_x0020_Address_x0028_es_x0029_");
         listColumnNames.add("Additional_x0020_IP_x0020_Addres"); 
         listColumnNames.add("Processor_x0020_spec");
         listColumnNames.add("Memory_x0020_spec");
         listColumnNames.add("Drive_x0020_spec");
         listColumnNames.add("VM_x0020_CreatedBy");
         listColumnNames.add("VM_x0020_CreatedOn");
         listColumnNames.add("Running_x0020_VM_x0020_in_x0020_");
         listColumnNames.add("VM_ID");
         listColumnNames.trimToSize();
         
         Document doc = new TestDOM().doit();  
         
         //Retrieve string array for all columns
         
         String[][] listItems = Manager.getSharePointList(port, listName, 
                 listColumnNames, doc, rowLimit);
         int rows = listItems.length;
         for (int i = 0; i < rows; i++) {
            String id = null;
            String hostName = null;
            String status = null;
            String os = null;
            String primaryIp = null;
            String allIp = null;
            String procSpec = null;
            String memSpec = null;
            String driveSpec = null;
            String createdBy = null;
            String createdOn = null;
            String isRunning = null;
            String vmId = null;
            
            for (int j = 0; j < listColumnNames.size(); j++) {
               switch (j) {
                  case 0: id = listItems[i][j]; break;
                  case 1: hostName = listItems[i][j]; break;
                  case 2: status = listItems[i][j]; break;
                  case 3: os = listItems[i][j]; break;
                  case 4: primaryIp = listItems[i][j]; break;
                  case 5: allIp = listItems[i][j]; break;
                  case 6: procSpec = listItems[i][j]; break;
                  case 7: memSpec = listItems[i][j]; break;
                  case 8: driveSpec = listItems[i][j]; break;
                  case 9: createdBy = listItems[i][j]; break;
                  case 10: createdOn = listItems[i][j]; break;
                  case 11: isRunning = listItems[i][j]; break;
                  case 12: vmId = listItems[i][j]; break;
               }
            }
            Date d = null;
            if (createdOn != null) {
               try {
                  d = retSpDf.parse(createdOn);
               } catch (ParseException pe) {
                  createdOn = "1900-01-01 00:00:00";
               }
            }
            
            createdOn = d == null ?
                    "01/01/1900 00:00:00" : spDf.format(d);
            SharepointVM vm = new SharepointVM(id, hostName, status, os, primaryIp, allIp,
               procSpec, memSpec, driveSpec, createdBy, createdOn, isRunning,
                    vmId);
            spVmMap.put(hostName.toLowerCase(), vm);
         }
      } catch (Exception ex) {
         System.err.println(ex);
      }
   }
   
   private static int getIndex (CustomFieldValue[] values, int key) {
      for (int i = 0; values != null && i < values.length; i++) {
         if (values[i].getKey() == key) {
            String sVal = ((CustomFieldStringValue)values[i]).getValue();
            if (sVal != null && ! sVal.isEmpty())
               return i;
         }
      }
      return -1;
   }
   
   public static Event findVmCreationEvent(EventManager em, ManagedEntity vm)
           throws InvalidState, RuntimeFault, RemoteException {
      EventFilterSpec filter = new EventFilterSpec();
      filter.setType(new String[] {"VmBeingDeployedEvent", "VmCreatedEvent",
         "VmRegisteredEvent", "VmClonedEvent"});
      EventFilterSpecByEntity entSpec = new EventFilterSpecByEntity();
      entSpec.setEntity(vm.getMOR());
      entSpec.setRecursion(EventFilterSpecRecursionOption.self);
      filter.setEntity(entSpec);
      EventHistoryCollector ehc = em.createCollectorForEvents(filter);
      Event[] es = ehc.getLatestPage();
      ehc.destroyCollector();
      
      if(es != null && es.length > 0) {
         return es[0];
      }
      return null;
   }
}

