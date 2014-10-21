/**
 *   Copyright (c) David Dudok de Wit 2010
 *   This program is free software: you can redistribute it and/or modify
 *   it under the terms of the GNU General Public License as published by
 *   the Free Software Foundation, either version 3 of the License, or
 *   (at your option) any later version.
 *
 *   This program is distributed in the hope that it will be useful,
 *   but WITHOUT ANY WARRANTY; without even the implied warranty of
 *   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *   GNU General Public License for more details.
 *
 *   You should have received a copy of the GNU General Public License
 *   along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *   @author David Dudok de Wit
 *   @version 3 Feb. 2010
 */
package sharepointapp;

import com.microsoft.schemas.sharepoint.soap.GetListItems;
import com.microsoft.schemas.sharepoint.soap.GetListItemsResponse;
import com.microsoft.schemas.sharepoint.soap.UpdateListItems;
import com.microsoft.schemas.sharepoint.soap.UpdateListItemsResponse.UpdateListItemsResult;
import com.sun.org.apache.xerces.internal.dom.ElementNSImpl;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.stream.StreamResult;
import javax.xml.ws.BindingProvider;
import com.microsoft.schemas.sharepoint.soap.ListsSoap;
import com.microsoft.schemas.sharepoint.soap.Lists;
import com.microsoft.schemas.sharepoint.soap.UpdateListItems.Updates;
import java.net.Authenticator;
import java.util.HashMap;
import javax.xml.transform.dom.*;
import org.w3c.dom.*;

/**
 * This program was made with the intention to link it with the SharePoint Lists
 * Web Services. It is a proof of concept that can read and manipulate SharePoint
 * lists. It has been successfully tested with SharePoint Online (late 2009
 * version).
 * Copyright (c) David Dudok de Wit 2010
 * @author David Dudok de Wit
 */
public class Manager {

    /**
     * Creates a port connected to the SharePoint Web Service given.
     * Authentication is done here. It also prints the authentication details
     * in the console.
     * @param userName SharePoint username
     * @param password SharePoint password
     * @param sharePointWebServiceUrl
     * @return port ListsSoap port, connected with SharePoint
     * @throws Exception in case of invalid parameters or connection error.
     */


   public static ListsSoap sharePointListsAuth(String userName, String password, 
         String sharePointWebServiceUrl) throws Exception {
     ListsSoap port = null;
     if (userName != null && password != null && sharePointWebServiceUrl != null) {
         try {
             Lists service = new Lists();
             port = service.getListsSoap();
             System.out.println("Web Service Auth Username: " + userName);
             System.out.println("Web Service URL: " + sharePointWebServiceUrl);
             NtlmAuthenticator authenticator = new NtlmAuthenticator(userName, password);
             Authenticator.setDefault(authenticator);

             ((BindingProvider) port).getRequestContext()
                     .put(BindingProvider.USERNAME_PROPERTY, authenticator
                     .getPasswordAuthentication().getUserName());
             ((BindingProvider) port).getRequestContext()
                     .put(BindingProvider.PASSWORD_PROPERTY, authenticator
                     .getPasswordAuthentication().getPassword().toString());
             ((BindingProvider) port).getRequestContext().put(BindingProvider
                     .ENDPOINT_ADDRESS_PROPERTY, sharePointWebServiceUrl);
         } catch (Exception e) {
             throw new Exception("Error: " + e.toString());
         }
     } else {
         throw new Exception("Couldn't authenticate: Invalid connection details given.");
     }
     return port;
   }

   /**
   * Connects to a SharePoint Lists Web Service through the given open port,
   * and reads all the elements of the given list. Only the ID and the given
   * attributes (column names) are displayed, as well as a dump of the SOAP
   * response from the Web Service (for debugging purposes).
   * @param port an already authenticated SharePoint Online SOAP port
   * @param listName original name of the Sharepoint list that is going to be read
   * @param listColumnNames arraylist containing the various names of the Columns
   * of the SharePoint list that are going to be read. If the column name isn't
   * found, then an exception will be thrown
   * @param rowLimit limits the number of rows (list items) that are going to
   * be returned
   * @throws Exception
   */
   public static void displaySharePointList(ListsSoap port, String listName, 
         ArrayList<String> listColumnNames, String rowLimit) throws Exception {
     if (port != null && listName != null && listColumnNames != null && 
             rowLimit != null) {
         try {

             //Here are additional parameters that may be set
             String viewName = "";
             GetListItems.ViewFields viewFields = null;
             GetListItems.Query query = null;
             GetListItems.QueryOptions queryOptions = null;
             String webID = "";

             //Calling the List Web Service
             GetListItemsResponse.GetListItemsResult result = port
                     .getListItems(listName, viewName, query, viewFields, 
                     rowLimit, queryOptions, webID);
             Object listResult = result.getContent().get(0);
             if ((listResult != null) && (listResult instanceof ElementNSImpl)) {
                 ElementNSImpl node = (ElementNSImpl) listResult;

                 //Dumps the retrieved info in the console
   //                    Document document = node.getOwnerDocument();
   //                    System.out.println("SharePoint Online Lists Web Service Response:" 
   //                            + Manager.xmlToString(document));

                 //selects a list of nodes which have <z:row/ (...)> elements
                 NodeList list = node.getElementsByTagName("z:row");
   //                    System.out.println("=> " + list.getLength() 
   //                            + " results from SharePoint Online");

                 //Displaying every result received from SharePoint, with its ID
                 for (int i = 0; i < list.getLength(); i++) {

                     //Gets the attributes of the current row/element
                     NamedNodeMap attributes = list.item(i).getAttributes();
                     System.out.println("******** Item ID: " + attributes
                             .getNamedItem("ows_ID").getNodeValue()+" ********");

                     //Displays all the attributes of the list item that 
                     //correspond to the column names given
                     for (String columnName : listColumnNames) {
                         String internalColumnName = "ows_" + columnName;
                         if (attributes.getNamedItem(internalColumnName) != null) {
                             System.out.println(columnName + ": " + attributes
                                     .getNamedItem(internalColumnName).getNodeValue());
                         } else {
   //                                throw new Exception("Couldn't find the '" + 
   //                                        columnName + "' column in the '" + 
   //                                        listName + "' list in SharePoint.\n");
                         }
                     }
                 }
             } else {
                 throw new Exception(listName + 
                         " list response from SharePoint is either null or corrupt\n");
             }
         } catch (Exception ex) {
             throw new Exception("Exception. See stacktrace." + ex.toString() + "\n");
         }
     }
   }
    
        /**
     * Connects to a SharePoint Lists Web Service through the given open port,
     * and reads all the elements of the given list. Only the ID and the given
     * attributes (column names) are displayed, as well as a dump of the SOAP
     * response from the Web Service (for debugging purposes).
     * @param port an already authenticated SharePoint Online SOAP port
     * @param listName original name of the Sharepoint list that is going to be read
     * @param listColumnNames arraylist containing the various names of the Columns
     * of the SharePoint list that are going to be read. If the column name isn't
     * found, then an exception will be thrown
     * @param rowLimit limits the number of rows (list items) that are going to
     * be returned
     * @throws Exception
     */
   public static void displaySharePointList(ListsSoap port, String listName, 
         ArrayList<String> listColumnNames, Document doc, 
         String rowLimit) throws Exception {
     if (port != null && listName != null && listName != null 
             && listColumnNames != null && doc != null) {
         try {

             //Here are additional parameters that may be set
             String viewName = "";
             GetListItems.ViewFields viewFields = null;
             GetListItems.Query query = new GetListItems.Query();
             query.getContent().add(doc.getDocumentElement());
             GetListItems.QueryOptions queryOptions = null;
             String webID = "";

             //Calling the List Web Service
             GetListItemsResponse.GetListItemsResult result = port
                     .getListItems(listName, viewName, query, viewFields, 
                     rowLimit, queryOptions, webID);
             Object listResult = result.getContent().get(0);
             if ((listResult != null) && (listResult instanceof ElementNSImpl)) {
                 ElementNSImpl node = (ElementNSImpl) listResult;

                 //Dumps the retrieved info in the console
   //                    Document document = node.getOwnerDocument();
   //                    System.out.println("SharePoint Online Lists Web Service Response:" 
   //                            + Manager.xmlToString(document));

                 //selects a list of nodes which have <z:row/ (...)> elements
                 NodeList list = node.getElementsByTagName("z:row");
   //                    System.out.println("=> " + list.getLength() 
   //                            + " results from SharePoint Online");

                 //Displaying every result received from SharePoint, with its ID
                 for (int i = 0; i < list.getLength(); i++) {

                     //Gets the attributes of the current row/element
                     NamedNodeMap attributes = list.item(i).getAttributes();
                     System.out.println("******** Item ID: " + attributes
                             .getNamedItem("ows_ID").getNodeValue()+" ********");

                     //Displays all the attributes of the list item that 
                     //correspond to the column names given
                     for (String columnName : listColumnNames) {
                         String internalColumnName = "ows_" + columnName;
                         if (attributes.getNamedItem(internalColumnName) != null) {
                             System.out.println(columnName + ": " + attributes
                                     .getNamedItem(internalColumnName).getNodeValue());
                         } else {
   //                                throw new Exception("Couldn't find the '" + 
   //                                        columnName + "' column in the '" + 
   //                                        listName + "' list in SharePoint.\n");
                         }
                     }
                 }
             } else {
                 throw new Exception(listName + 
                         " list response from SharePoint is either null or corrupt\n");
             }
         } catch (Exception ex) {
             throw new Exception("Exception. See stacktrace." + ex.toString() + "\n");
         }
     }
   }

   public static String[][] getSharePointList(ListsSoap port, String listName, 
        ArrayList<String> listColumnNames, String rowLimit) throws Exception {

      String[][] strResult = null;
        if (port != null && listName != null && listColumnNames != null && 
                rowLimit != null) {
            try {

                //Here are additional parameters that may be set
                String viewName = "";
                GetListItems.ViewFields viewFields = null;
                GetListItems.Query query = null;
                GetListItems.QueryOptions queryOptions = null;
                String webID = "";

                //Calling the List Web Service
                GetListItemsResponse.GetListItemsResult result = port
                        .getListItems(listName, viewName, query, viewFields, 
                        rowLimit, queryOptions, webID);
                Object listResult = result.getContent().get(0);
                if ((listResult != null) && (listResult instanceof ElementNSImpl)) {
                    ElementNSImpl node = (ElementNSImpl) listResult;

                    //Dumps the retrieved info in the console
   //                    Document document = node.getOwnerDocument();
   //                    System.out.println("SharePoint Online Lists Web Service Response:" 
   //                            + Manager.xmlToString(document));

                    //selects a list of nodes which have <z:row/ (...)> elements
                    NodeList list = node.getElementsByTagName("z:row");
   //                    System.out.println("=> " + list.getLength() 
   //                            + " results from SharePoint Online");

                    //Create String array to be returned to client
                    //System.out.println(list.getLength());
                    strResult = new String[list.getLength()][listColumnNames.size()];

                    //Displaying every result received from SharePoint, with its ID
                    for (int i = 0; i < list.getLength(); i++) {

                        //Gets the attributes of the current row/element
                        NamedNodeMap attributes = list.item(i).getAttributes();
   //                        System.out.println("******** Item ID: " + attributes
   //                                .getNamedItem("ows_ID").getNodeValue()+" ********");

                        //Displays all the attributes of the list item that 
                        //correspond to the column names given
                        for (int j = 0; j < listColumnNames.size(); j++) {
                            String internalColumnName = "ows_" + 
                                    listColumnNames.get(j);
                            if (attributes.getNamedItem(internalColumnName) != null) {
   //                                System.out.println(columnName + ": " + attributes
   //                                        .getNamedItem(internalColumnName).getNodeValue());
                               strResult[i][j] = attributes.getNamedItem(internalColumnName)
                                       .getNodeValue();
                            } else {
   //                                throw new Exception("Couldn't find the '" + 
   //                                        columnName + "' column in the '" + 
   //                                        listName + "' list in SharePoint.\n");
                            }
                        }
                    }
                } else {
                    throw new Exception(listName + 
                            " list response from SharePoint is either null or corrupt\n");
                }
            } catch (Exception ex) {
                throw new Exception("Exception. See stacktrace." + ex.toString() + "\n");
            }
        }
        return strResult;
   }

   public static String[][] getSharePointList(ListsSoap port, String listName, 
        ArrayList<String> listColumnNames, Document doc, String rowLimit) 
              throws Exception {

      String[][] strResult = null;
        if (port != null && listName != null && listColumnNames != null && 
                doc != null & rowLimit != null) {
            try {

                //Here are additional parameters that may be set
                String viewName = "";
                GetListItems.ViewFields viewFields = null;
                GetListItems.Query query = new GetListItems.Query();
                query.getContent().add(doc.getDocumentElement());
                GetListItems.QueryOptions queryOptions = null;
                String webID = "";

                //Calling the List Web Service
                GetListItemsResponse.GetListItemsResult result = port
                        .getListItems(listName, viewName, query, viewFields, 
                        rowLimit, queryOptions, webID);
                Object listResult = result.getContent().get(0);
                if ((listResult != null) && (listResult instanceof ElementNSImpl)) {
                    ElementNSImpl node = (ElementNSImpl) listResult;

                    //Dumps the retrieved info in the console
   //                    Document document = node.getOwnerDocument();
   //                    System.out.println("SharePoint Online Lists Web Service Response:" 
   //                            + Manager.xmlToString(document));

                    //selects a list of nodes which have <z:row/ (...)> elements
                    NodeList list = node.getElementsByTagName("z:row");
   //                    System.out.println("=> " + list.getLength() 
   //                            + " results from SharePoint Online");

                    //Create String array to be returned to client
                    //System.out.println(list.getLength());
                    strResult = new String[list.getLength()][listColumnNames.size()];

                    //Displaying every result received from SharePoint, with its ID
                    for (int i = 0; i < list.getLength(); i++) {

                        //Gets the attributes of the current row/element
                        NamedNodeMap attributes = list.item(i).getAttributes();
   //                        System.out.println("******** Item ID: " + attributes
   //                                .getNamedItem("ows_ID").getNodeValue()+" ********");

                        //Displays all the attributes of the list item that 
                        //correspond to the column names given
                        for (int j = 0; j < listColumnNames.size(); j++) {
                            String internalColumnName = "ows_" + 
                                    listColumnNames.get(j);
                            if (attributes.getNamedItem(internalColumnName) != null) {
   //                                System.out.println(columnName + ": " + attributes
   //                                        .getNamedItem(internalColumnName).getNodeValue());
                               strResult[i][j] = attributes.getNamedItem(internalColumnName)
                                       .getNodeValue();
                            } else {
   //                                throw new Exception("Couldn't find the '" + 
   //                                        columnName + "' column in the '" + 
   //                                        listName + "' list in SharePoint.\n");
                            }
                        }
                    }
                } else {
                    throw new Exception(listName + 
                            " list response from SharePoint is either null or corrupt\n");
                }
            } catch (Exception ex) {
                throw new Exception("Exception. See stacktrace." + ex.toString() + "\n");
            }
        }
        return strResult;
   }
   
   
   /**
    * This function will insert the given item in the SharePoint that corresponds
    * to the list name given (or list GUID).
    * @param port an already authenticated SharePoint SOAP port
    * @param listName SharePoint list name or list GUID (guid must be enclosed in braces)
    * @param itemAttributes This represents the content of the item that need to be inserted.
    * The key represents the type of attribute (SharePoint column name) and the
    * value corresponds to the item attribute value.
    */
   public static void insertListItem(ListsSoap port, String listName, 
      HashMap<String, String> itemAttributes) throws Exception {

       //Parameters validity check
       if (port != null && listName != null && itemAttributes != null 
               && !itemAttributes.isEmpty()) {
           try {

               //Building the CAML query with one item to add, and printing request
               ListsRequest newCompanyRequest = new ListsRequest("New");
               newCompanyRequest.createListItem(itemAttributes);
               System.out.println("REQUEST:"
                       + xmlToString(newCompanyRequest.getRootDocument()));

               //initializing the Web Service operation here
               Updates updates = new UpdateListItems.Updates();

               //Preparing the request for the update
               Object docObj = (Object) newCompanyRequest.getRootDocument()
                       .getDocumentElement();
               updates.getContent().add(0, docObj);

               //Sending the insert request to the Lists.UpdateListItems Web Service
               UpdateListItemsResult result = port
                       .updateListItems(listName, updates);

               /*
                *Printing the response in the console.
                *If successful, the inserted item will be returned
                */
               System.out.println("RESPONSE : "
                       + xmlToString((org.w3c.dom.Document) 
                       (((ElementNSImpl) result.getContent().get(0))
                       .getOwnerDocument())));
           } catch (Exception e) {
              throw e;
           }
        }
    }

   public static void updateListItem(ListsSoap port, String listName, 
      HashMap<String, String> itemAttributes) throws Exception {

    //Parameters validity check
    if (port != null && listName != null && itemAttributes != null 
            && !itemAttributes.isEmpty()) {
        try {

            //Building the CAML query with one item to add, and printing request
            ListsRequest newCompanyRequest = new ListsRequest("Update");
            newCompanyRequest.createListItem(itemAttributes);
            System.out.println("REQUEST:"
                    + xmlToString(newCompanyRequest.getRootDocument()));

            //initializing the Web Service operation here
            Updates updates = new UpdateListItems.Updates();

            //Preparing the request for the update
            Object docObj = (Object) newCompanyRequest.getRootDocument()
                    .getDocumentElement();
            updates.getContent().add(0, docObj);

            //Sending the insert request to the Lists.UpdateListItems Web Service
            UpdateListItemsResult result = port
                    .updateListItems(listName, updates);

            /*
             *Printing the response in the console.
             *If successful, the inserted item will be returned
             */
            System.out.println("RESPONSE : "
                    + xmlToString((org.w3c.dom.Document) 
                    (((ElementNSImpl) result.getContent().get(0))
                    .getOwnerDocument())));
         } catch (Exception e) {
           throw e;
         }
      }
   }
      
   public static void deleteListItem(ListsSoap port, String listName, 
      HashMap<String, String> itemAttributes) throws Exception {

   //Parameters validity check
   if (port != null && listName != null && itemAttributes != null 
         && !itemAttributes.isEmpty()) {
     try {

         //Building the CAML query with one item to add, and printing request
         ListsRequest newCompanyRequest = new ListsRequest("Delete");
         newCompanyRequest.createListItem(itemAttributes);
         System.out.println("REQUEST:"
                 + xmlToString(newCompanyRequest.getRootDocument()));

         //initializing the Web Service operation here
         Updates updates = new UpdateListItems.Updates();

         //Preparing the request for the update
         Object docObj = (Object) newCompanyRequest.getRootDocument()
                 .getDocumentElement();
         updates.getContent().add(0, docObj);

         //Sending the insert request to the Lists.UpdateListItems Web Service
         UpdateListItemsResult result = port
                 .updateListItems(listName, updates);

         /*
          *Printing the response in the console.
          *If successful, the inserted item will be returned
          */
         System.out.println("RESPONSE : "
                 + xmlToString((org.w3c.dom.Document) 
                 (((ElementNSImpl) result.getContent().get(0))
                 .getOwnerDocument())));
     } catch (Exception e) {
        throw e;
     }
   }
   }


    /**
     * Creates a string from an XML file with start and end indicators
     * @param docToString document to convert
     * @return string of the xml document
     */
    public static String xmlToString(Document docToString) {
        String returnString = "\n-------------- XML START --------------\n";
        try {
            //create string from xml tree
            //Output the XML
            //set up a transformer
            TransformerFactory transfac = TransformerFactory.newInstance();
            Transformer trans;
            trans = transfac.newTransformer();
            trans.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "yes");
            trans.setOutputProperty(OutputKeys.INDENT, "yes");
            StringWriter sw = new StringWriter();
            StreamResult streamResult = new StreamResult(sw);
            DOMSource source = new DOMSource(docToString);
            trans.transform(source, streamResult);
            String xmlString = sw.toString();
            //print the XML
            returnString = returnString + xmlString;
        } catch (TransformerException ex) {
            Logger.getLogger(Manager.class.getName()).log(Level.SEVERE, null, ex);
        }
        returnString = returnString + "-------------- XML END --------------";
        return returnString;
    }
}
