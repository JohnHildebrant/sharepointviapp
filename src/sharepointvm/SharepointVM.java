/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package sharepointvm;

/**
 *
 * @author hildebj
 */
public class SharepointVM {

   public SharepointVM(String id, String hostName, String status, String os, 
           String primaryIp, String allIp, String procSpec, String memSpec, 
           String driveSpec, String createdBy, String createdOn, 
           String isRunning, String vmId) {
      this.id = id;
      this.hostName = hostName == null ? "" : hostName;
      this.status = status == null ? "" : status;
      this.os = os == null ? "" : os;
      this.primaryIp = primaryIp == null ? "" : primaryIp;
      this.allIp = allIp == null ? "" : allIp;
      this.procSpec = procSpec == null ? "" : procSpec;
      this.memSpec = memSpec == null ? "" : memSpec;
      this.driveSpec = driveSpec == null ? "" : driveSpec;
      this.createdBy = createdBy == null ? "" : createdBy;
      this.createdOn = createdOn == null ? "" : createdOn;
      this.isRunning = isRunning == null ? "" : isRunning;
      this.vmId = vmId == null ? "" : vmId;
   }

   @Override
   public boolean equals(Object obj) {
      if (obj == null) {
         return false;
      }
      if (getClass() != obj.getClass()) {
         return false;
      }
      final SharepointVM other = (SharepointVM) obj;
      if ((this.hostName == null) ? (other.hostName != null) : !this.hostName
              .toLowerCase().equals(other.hostName.toLowerCase())) {
         return false;
      }      
      if ((this.status == null) ? (other.status != null) : !this.status
              .equals(other.status)) {
        return false;
      }
      if ((this.os == null) ? (other.os != null) : !this.os.equals(other.os)) {
         return false;
      }
      if ((this.primaryIp == null) ? (other.primaryIp != null) : !this.primaryIp
              .equals(other.primaryIp)) {
         return false;
      }
      if ((this.allIp == null) ? (other.allIp != null) : !this.allIp
              .equals(other.allIp)) {
         return false;
      }
      if ((this.procSpec == null) ? (other.procSpec != null) : !this.procSpec
              .equals(other.procSpec)) {
         return false;
      }
      if ((this.memSpec == null) ? (other.memSpec != null) : !this.memSpec
              .equals(other.memSpec)) {
         return false;
      }
      if ((this.driveSpec == null) ? (other.driveSpec != null) : !this.driveSpec
              .equals(other.driveSpec)) {
         return false;
      }
      if ((this.createdOn == null) ? (other.createdOn != null) : !this.createdOn
              .equals(other.createdOn)) {
         return false;
      }
      if ((this.createdBy == null) ? (other.createdBy != null) : !this.createdBy
              .equals(other.createdBy)) {
         return false;
      }
      if ((this.isRunning == null) ? (other.isRunning != null) : !this.isRunning
              .equals(other.isRunning)) {
         return false;
      }
      if ((this.vmId == null) ? (other.vmId != null) : !this.vmId
              .equals(other.vmId)) {
         return false;
      }
      return true;
   }

   @Override
   public int hashCode() {
      int hash = 5;
      hash = 29 * hash + (this.hostName.toLowerCase() != null ? 
              this.hostName.toLowerCase().hashCode() : 0);
      hash = 29 * hash + (this.status != null ? this.status.hashCode() : 0);
      hash = 29 * hash + (this.os != null ? this.os.hashCode() : 0);
      hash = 29 * hash + (this.primaryIp != null ? this.primaryIp.hashCode() : 0);
      hash = 29 * hash + (this.allIp != null ? this.allIp.hashCode() : 0);
      hash = 29 * hash + (this.procSpec != null ? this.procSpec.hashCode() : 0);
      hash = 29 * hash + (this.memSpec != null ? this.memSpec.hashCode() : 0);
      hash = 29 * hash + (this.driveSpec != null ? this.driveSpec.hashCode() : 0);
      hash = 29 * hash + (this.createdOn != null ? this.createdOn.hashCode() : 0);
      hash = 29 * hash + (this.createdBy != null ? this.createdBy.hashCode() : 0);
      hash = 29 * hash + (this.isRunning != null ? this.isRunning.hashCode() : 0);
      hash = 29 * hash + (this.vmId != null ? this.vmId.hashCode() : 0);
      return hash;
   }

   public String getAllIp() {
      return allIp;
   }

   public void setAllIp(String allIp) {
      this.allIp = allIp;
   }

   public String getDriveSpec() {
      return driveSpec;
   }

   public void setDriveSpec(String driveSpec) {
      this.driveSpec = driveSpec;
   }

   public String getHostName() {
      return hostName;
   }

   public void setHostName(String hostName) {
      this.hostName = hostName;
   }
   
   public String getStatus() {
      return status;
   }
   
   public void setStatus(String status) {
      this.status = status;
   }
   
   public String getMemSpec() {
      return memSpec;
   }

   public void setMemSpec(String memSpec) {
      this.memSpec = memSpec;
   }

   public String getPrimaryIp() {
      return primaryIp;
   }

   public void setPrimaryIp(String primaryIp) {
      this.primaryIp = primaryIp;
   }

   public String getProcSpec() {
      return procSpec;
   }

   public void setProcSpec(String procSpec) {
      this.procSpec = procSpec;
   }
   
   @Override
   public String toString() {
      StringBuilder sb = new StringBuilder();
      sb.append(id).append("\r\n")
         .append(hostName).append("\r\n").append(os).append("\r\n")
         .append(primaryIp).append("\r\n").append(allIp).append("\r\n")
         .append(procSpec).append("\r\n").append(memSpec).append("\r\n")
         .append(driveSpec).append("\r\n").append(createdOn)
         .append("\r\n").append(createdBy);
      
      return sb.toString();
   }

   public String getCreatedBy() {
      return createdBy;
   }

   public void setCreatedBy(String createdBy) {
      this.createdBy = createdBy;
   }

   public String getCreatedOn() {
      return createdOn;
   }

   public void setCreatedOn(String createdOn) {
      this.createdOn = createdOn;
   }

   public String getOs() {
      return os;
   }

   public void setOs(String os) {
      this.os = os;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }
   
   public String getIsRunning() {
      return isRunning;
   }

   public void setIsRunning(String isRunning) {
      this.isRunning = isRunning;
   }
   
   public String getVmId() {
      return vmId;
   }
   
   public void setVmId(String vmId) {
      this.vmId = vmId;
   }
   
   private String id;
   private String hostName;
   private String status;
   private String os;
   private String primaryIp;
   private String allIp;
   private String procSpec;
   private String memSpec;
   private String driveSpec;
   private String createdOn;
   private String createdBy;
   private String isRunning;
   private String vmId;
}
