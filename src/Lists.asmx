<wsdl:definitions xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/" xmlns:tm="http://microsoft.com/wsdl/mime/textMatching/" xmlns:soapenc="http://schemas.xmlsoap.org/soap/encoding/" xmlns:mime="http://schemas.xmlsoap.org/wsdl/mime/" xmlns:tns="http://schemas.microsoft.com/sharepoint/soap/" xmlns:s1="http://microsoft.com/wsdl/types/" xmlns:s="http://www.w3.org/2001/XMLSchema" xmlns:soap12="http://schemas.xmlsoap.org/wsdl/soap12/" xmlns:http="http://schemas.xmlsoap.org/wsdl/http/" targetNamespace="http://schemas.microsoft.com/sharepoint/soap/" xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/">
  <wsdl:types>
    <s:schema elementFormDefault="qualified" targetNamespace="http://schemas.microsoft.com/sharepoint/soap/">
      <s:import namespace="http://www.w3.org/2001/XMLSchema"/>
      <s:import namespace="http://microsoft.com/wsdl/types/"/>
      <s:element name="GetList">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetListResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListAndView">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="viewName" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListAndViewResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetListAndViewResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="DeleteList">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="DeleteListResponse">
        <s:complexType/>
      </s:element>
      <s:element name="AddList">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="description" type="s:string"/>
            <s:element minOccurs="1" maxOccurs="1" name="templateID" type="s:int"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddListResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AddListResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddListFromFeature">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="description" type="s:string"/>
            <s:element minOccurs="1" maxOccurs="1" name="featureID" type="s1:guid"/>
            <s:element minOccurs="1" maxOccurs="1" name="templateID" type="s:int"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddListFromFeatureResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AddListFromFeatureResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateList">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="listProperties">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="newFields">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="updateFields">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="deleteFields">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="listVersion" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateListResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="UpdateListResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListCollection">
        <s:complexType/>
      </s:element>
      <s:element name="GetListCollectionResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetListCollectionResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListItems">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="viewName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="query">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="viewFields">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="rowLimit" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="queryOptions">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="webID" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListItemsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetListItemsResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListItemChanges">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="viewFields">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="since" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="contains">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListItemChangesResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetListItemChangesResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListItemChangesSinceToken">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="viewName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="query">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="viewFields">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="rowLimit" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="queryOptions">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="changeToken" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="contains">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListItemChangesSinceTokenResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetListItemChangesSinceTokenResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateListItems">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="updates">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateListItemsResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="UpdateListItemsResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddDiscussionBoardItem">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="message" type="s:base64Binary"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddDiscussionBoardItemResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AddDiscussionBoardItemResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetVersionCollection">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="strlistID" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="strlistItemID" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="strFieldName" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetVersionCollectionResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetVersionCollectionResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddAttachment">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="listItemID" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="fileName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="attachment" type="s:base64Binary"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="AddAttachmentResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="AddAttachmentResult" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAttachmentCollection">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="listItemID" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetAttachmentCollectionResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetAttachmentCollectionResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="DeleteAttachment">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="listItemID" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="url" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="DeleteAttachmentResponse">
        <s:complexType/>
      </s:element>
      <s:element name="CheckOutFile">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="pageUrl" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="checkoutToLocal" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="lastmodified" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="CheckOutFileResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="CheckOutFileResult" type="s:boolean"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UndoCheckOut">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="pageUrl" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UndoCheckOutResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="UndoCheckOutResult" type="s:boolean"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="CheckInFile">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="pageUrl" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="comment" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="CheckinType" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="CheckInFileResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="1" maxOccurs="1" name="CheckInFileResult" type="s:boolean"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListContentTypes">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="contentTypeId" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListContentTypesResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetListContentTypesResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListContentType">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="contentTypeId" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="GetListContentTypeResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="GetListContentTypeResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="CreateContentType">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="displayName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="parentType" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="fields">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="contentTypeProperties">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="addToView" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="CreateContentTypeResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="CreateContentTypeResult" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateContentType">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="contentTypeId" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="contentTypeProperties">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="newFields">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="updateFields">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="deleteFields">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
            <s:element minOccurs="0" maxOccurs="1" name="addToView" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateContentTypeResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="UpdateContentTypeResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="DeleteContentType">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="contentTypeId" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="DeleteContentTypeResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="DeleteContentTypeResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateContentTypeXmlDocument">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="contentTypeId" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="newDocument">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateContentTypeXmlDocumentResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="UpdateContentTypeXmlDocumentResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateContentTypesXmlDocument">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="newDocument">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="UpdateContentTypesXmlDocumentResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="UpdateContentTypesXmlDocumentResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="DeleteContentTypeXmlDocument">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="contentTypeId" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="documentUri" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="DeleteContentTypeXmlDocumentResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="DeleteContentTypeXmlDocumentResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ApplyContentTypeToList">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="webUrl" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="contentTypeId" type="s:string"/>
            <s:element minOccurs="0" maxOccurs="1" name="listName" type="s:string"/>
          </s:sequence>
        </s:complexType>
      </s:element>
      <s:element name="ApplyContentTypeToListResponse">
        <s:complexType>
          <s:sequence>
            <s:element minOccurs="0" maxOccurs="1" name="ApplyContentTypeToListResult">
              <s:complexType mixed="true">
                <s:sequence>
                  <s:any/>
                </s:sequence>
              </s:complexType>
            </s:element>
          </s:sequence>
        </s:complexType>
      </s:element>
    </s:schema>
    <s:schema elementFormDefault="qualified" targetNamespace="http://microsoft.com/wsdl/types/">
      <s:simpleType name="guid">
        <s:restriction base="s:string">
          <s:pattern value="[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}"/>
        </s:restriction>
      </s:simpleType>
    </s:schema>
  </wsdl:types>
  <wsdl:message name="GetListSoapIn">
    <wsdl:part name="parameters" element="tns:GetList"/>
  </wsdl:message>
  <wsdl:message name="GetListSoapOut">
    <wsdl:part name="parameters" element="tns:GetListResponse"/>
  </wsdl:message>
  <wsdl:message name="GetListAndViewSoapIn">
    <wsdl:part name="parameters" element="tns:GetListAndView"/>
  </wsdl:message>
  <wsdl:message name="GetListAndViewSoapOut">
    <wsdl:part name="parameters" element="tns:GetListAndViewResponse"/>
  </wsdl:message>
  <wsdl:message name="DeleteListSoapIn">
    <wsdl:part name="parameters" element="tns:DeleteList"/>
  </wsdl:message>
  <wsdl:message name="DeleteListSoapOut">
    <wsdl:part name="parameters" element="tns:DeleteListResponse"/>
  </wsdl:message>
  <wsdl:message name="AddListSoapIn">
    <wsdl:part name="parameters" element="tns:AddList"/>
  </wsdl:message>
  <wsdl:message name="AddListSoapOut">
    <wsdl:part name="parameters" element="tns:AddListResponse"/>
  </wsdl:message>
  <wsdl:message name="AddListFromFeatureSoapIn">
    <wsdl:part name="parameters" element="tns:AddListFromFeature"/>
  </wsdl:message>
  <wsdl:message name="AddListFromFeatureSoapOut">
    <wsdl:part name="parameters" element="tns:AddListFromFeatureResponse"/>
  </wsdl:message>
  <wsdl:message name="UpdateListSoapIn">
    <wsdl:part name="parameters" element="tns:UpdateList"/>
  </wsdl:message>
  <wsdl:message name="UpdateListSoapOut">
    <wsdl:part name="parameters" element="tns:UpdateListResponse"/>
  </wsdl:message>
  <wsdl:message name="GetListCollectionSoapIn">
    <wsdl:part name="parameters" element="tns:GetListCollection"/>
  </wsdl:message>
  <wsdl:message name="GetListCollectionSoapOut">
    <wsdl:part name="parameters" element="tns:GetListCollectionResponse"/>
  </wsdl:message>
  <wsdl:message name="GetListItemsSoapIn">
    <wsdl:part name="parameters" element="tns:GetListItems"/>
  </wsdl:message>
  <wsdl:message name="GetListItemsSoapOut">
    <wsdl:part name="parameters" element="tns:GetListItemsResponse"/>
  </wsdl:message>
  <wsdl:message name="GetListItemChangesSoapIn">
    <wsdl:part name="parameters" element="tns:GetListItemChanges"/>
  </wsdl:message>
  <wsdl:message name="GetListItemChangesSoapOut">
    <wsdl:part name="parameters" element="tns:GetListItemChangesResponse"/>
  </wsdl:message>
  <wsdl:message name="GetListItemChangesSinceTokenSoapIn">
    <wsdl:part name="parameters" element="tns:GetListItemChangesSinceToken"/>
  </wsdl:message>
  <wsdl:message name="GetListItemChangesSinceTokenSoapOut">
    <wsdl:part name="parameters" element="tns:GetListItemChangesSinceTokenResponse"/>
  </wsdl:message>
  <wsdl:message name="UpdateListItemsSoapIn">
    <wsdl:part name="parameters" element="tns:UpdateListItems"/>
  </wsdl:message>
  <wsdl:message name="UpdateListItemsSoapOut">
    <wsdl:part name="parameters" element="tns:UpdateListItemsResponse"/>
  </wsdl:message>
  <wsdl:message name="AddDiscussionBoardItemSoapIn">
    <wsdl:part name="parameters" element="tns:AddDiscussionBoardItem"/>
  </wsdl:message>
  <wsdl:message name="AddDiscussionBoardItemSoapOut">
    <wsdl:part name="parameters" element="tns:AddDiscussionBoardItemResponse"/>
  </wsdl:message>
  <wsdl:message name="GetVersionCollectionSoapIn">
    <wsdl:part name="parameters" element="tns:GetVersionCollection"/>
  </wsdl:message>
  <wsdl:message name="GetVersionCollectionSoapOut">
    <wsdl:part name="parameters" element="tns:GetVersionCollectionResponse"/>
  </wsdl:message>
  <wsdl:message name="AddAttachmentSoapIn">
    <wsdl:part name="parameters" element="tns:AddAttachment"/>
  </wsdl:message>
  <wsdl:message name="AddAttachmentSoapOut">
    <wsdl:part name="parameters" element="tns:AddAttachmentResponse"/>
  </wsdl:message>
  <wsdl:message name="GetAttachmentCollectionSoapIn">
    <wsdl:part name="parameters" element="tns:GetAttachmentCollection"/>
  </wsdl:message>
  <wsdl:message name="GetAttachmentCollectionSoapOut">
    <wsdl:part name="parameters" element="tns:GetAttachmentCollectionResponse"/>
  </wsdl:message>
  <wsdl:message name="DeleteAttachmentSoapIn">
    <wsdl:part name="parameters" element="tns:DeleteAttachment"/>
  </wsdl:message>
  <wsdl:message name="DeleteAttachmentSoapOut">
    <wsdl:part name="parameters" element="tns:DeleteAttachmentResponse"/>
  </wsdl:message>
  <wsdl:message name="CheckOutFileSoapIn">
    <wsdl:part name="parameters" element="tns:CheckOutFile"/>
  </wsdl:message>
  <wsdl:message name="CheckOutFileSoapOut">
    <wsdl:part name="parameters" element="tns:CheckOutFileResponse"/>
  </wsdl:message>
  <wsdl:message name="UndoCheckOutSoapIn">
    <wsdl:part name="parameters" element="tns:UndoCheckOut"/>
  </wsdl:message>
  <wsdl:message name="UndoCheckOutSoapOut">
    <wsdl:part name="parameters" element="tns:UndoCheckOutResponse"/>
  </wsdl:message>
  <wsdl:message name="CheckInFileSoapIn">
    <wsdl:part name="parameters" element="tns:CheckInFile"/>
  </wsdl:message>
  <wsdl:message name="CheckInFileSoapOut">
    <wsdl:part name="parameters" element="tns:CheckInFileResponse"/>
  </wsdl:message>
  <wsdl:message name="GetListContentTypesSoapIn">
    <wsdl:part name="parameters" element="tns:GetListContentTypes"/>
  </wsdl:message>
  <wsdl:message name="GetListContentTypesSoapOut">
    <wsdl:part name="parameters" element="tns:GetListContentTypesResponse"/>
  </wsdl:message>
  <wsdl:message name="GetListContentTypeSoapIn">
    <wsdl:part name="parameters" element="tns:GetListContentType"/>
  </wsdl:message>
  <wsdl:message name="GetListContentTypeSoapOut">
    <wsdl:part name="parameters" element="tns:GetListContentTypeResponse"/>
  </wsdl:message>
  <wsdl:message name="CreateContentTypeSoapIn">
    <wsdl:part name="parameters" element="tns:CreateContentType"/>
  </wsdl:message>
  <wsdl:message name="CreateContentTypeSoapOut">
    <wsdl:part name="parameters" element="tns:CreateContentTypeResponse"/>
  </wsdl:message>
  <wsdl:message name="UpdateContentTypeSoapIn">
    <wsdl:part name="parameters" element="tns:UpdateContentType"/>
  </wsdl:message>
  <wsdl:message name="UpdateContentTypeSoapOut">
    <wsdl:part name="parameters" element="tns:UpdateContentTypeResponse"/>
  </wsdl:message>
  <wsdl:message name="DeleteContentTypeSoapIn">
    <wsdl:part name="parameters" element="tns:DeleteContentType"/>
  </wsdl:message>
  <wsdl:message name="DeleteContentTypeSoapOut">
    <wsdl:part name="parameters" element="tns:DeleteContentTypeResponse"/>
  </wsdl:message>
  <wsdl:message name="UpdateContentTypeXmlDocumentSoapIn">
    <wsdl:part name="parameters" element="tns:UpdateContentTypeXmlDocument"/>
  </wsdl:message>
  <wsdl:message name="UpdateContentTypeXmlDocumentSoapOut">
    <wsdl:part name="parameters" element="tns:UpdateContentTypeXmlDocumentResponse"/>
  </wsdl:message>
  <wsdl:message name="UpdateContentTypesXmlDocumentSoapIn">
    <wsdl:part name="parameters" element="tns:UpdateContentTypesXmlDocument"/>
  </wsdl:message>
  <wsdl:message name="UpdateContentTypesXmlDocumentSoapOut">
    <wsdl:part name="parameters" element="tns:UpdateContentTypesXmlDocumentResponse"/>
  </wsdl:message>
  <wsdl:message name="DeleteContentTypeXmlDocumentSoapIn">
    <wsdl:part name="parameters" element="tns:DeleteContentTypeXmlDocument"/>
  </wsdl:message>
  <wsdl:message name="DeleteContentTypeXmlDocumentSoapOut">
    <wsdl:part name="parameters" element="tns:DeleteContentTypeXmlDocumentResponse"/>
  </wsdl:message>
  <wsdl:message name="ApplyContentTypeToListSoapIn">
    <wsdl:part name="parameters" element="tns:ApplyContentTypeToList"/>
  </wsdl:message>
  <wsdl:message name="ApplyContentTypeToListSoapOut">
    <wsdl:part name="parameters" element="tns:ApplyContentTypeToListResponse"/>
  </wsdl:message>
  <wsdl:portType name="ListsSoap">
    <wsdl:operation name="GetList">
      <wsdl:input message="tns:GetListSoapIn"/>
      <wsdl:output message="tns:GetListSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="GetListAndView">
      <wsdl:input message="tns:GetListAndViewSoapIn"/>
      <wsdl:output message="tns:GetListAndViewSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="DeleteList">
      <wsdl:input message="tns:DeleteListSoapIn"/>
      <wsdl:output message="tns:DeleteListSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="AddList">
      <wsdl:input message="tns:AddListSoapIn"/>
      <wsdl:output message="tns:AddListSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="AddListFromFeature">
      <wsdl:input message="tns:AddListFromFeatureSoapIn"/>
      <wsdl:output message="tns:AddListFromFeatureSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="UpdateList">
      <wsdl:input message="tns:UpdateListSoapIn"/>
      <wsdl:output message="tns:UpdateListSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="GetListCollection">
      <wsdl:input message="tns:GetListCollectionSoapIn"/>
      <wsdl:output message="tns:GetListCollectionSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="GetListItems">
      <wsdl:input message="tns:GetListItemsSoapIn"/>
      <wsdl:output message="tns:GetListItemsSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="GetListItemChanges">
      <wsdl:input message="tns:GetListItemChangesSoapIn"/>
      <wsdl:output message="tns:GetListItemChangesSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="GetListItemChangesSinceToken">
      <wsdl:input message="tns:GetListItemChangesSinceTokenSoapIn"/>
      <wsdl:output message="tns:GetListItemChangesSinceTokenSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="UpdateListItems">
      <wsdl:input message="tns:UpdateListItemsSoapIn"/>
      <wsdl:output message="tns:UpdateListItemsSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="AddDiscussionBoardItem">
      <wsdl:input message="tns:AddDiscussionBoardItemSoapIn"/>
      <wsdl:output message="tns:AddDiscussionBoardItemSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="GetVersionCollection">
      <wsdl:input message="tns:GetVersionCollectionSoapIn"/>
      <wsdl:output message="tns:GetVersionCollectionSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="AddAttachment">
      <wsdl:input message="tns:AddAttachmentSoapIn"/>
      <wsdl:output message="tns:AddAttachmentSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="GetAttachmentCollection">
      <wsdl:input message="tns:GetAttachmentCollectionSoapIn"/>
      <wsdl:output message="tns:GetAttachmentCollectionSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="DeleteAttachment">
      <wsdl:input message="tns:DeleteAttachmentSoapIn"/>
      <wsdl:output message="tns:DeleteAttachmentSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="CheckOutFile">
      <wsdl:input message="tns:CheckOutFileSoapIn"/>
      <wsdl:output message="tns:CheckOutFileSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="UndoCheckOut">
      <wsdl:input message="tns:UndoCheckOutSoapIn"/>
      <wsdl:output message="tns:UndoCheckOutSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="CheckInFile">
      <wsdl:input message="tns:CheckInFileSoapIn"/>
      <wsdl:output message="tns:CheckInFileSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="GetListContentTypes">
      <wsdl:input message="tns:GetListContentTypesSoapIn"/>
      <wsdl:output message="tns:GetListContentTypesSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="GetListContentType">
      <wsdl:input message="tns:GetListContentTypeSoapIn"/>
      <wsdl:output message="tns:GetListContentTypeSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="CreateContentType">
      <wsdl:input message="tns:CreateContentTypeSoapIn"/>
      <wsdl:output message="tns:CreateContentTypeSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="UpdateContentType">
      <wsdl:input message="tns:UpdateContentTypeSoapIn"/>
      <wsdl:output message="tns:UpdateContentTypeSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="DeleteContentType">
      <wsdl:input message="tns:DeleteContentTypeSoapIn"/>
      <wsdl:output message="tns:DeleteContentTypeSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="UpdateContentTypeXmlDocument">
      <wsdl:input message="tns:UpdateContentTypeXmlDocumentSoapIn"/>
      <wsdl:output message="tns:UpdateContentTypeXmlDocumentSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="UpdateContentTypesXmlDocument">
      <wsdl:input message="tns:UpdateContentTypesXmlDocumentSoapIn"/>
      <wsdl:output message="tns:UpdateContentTypesXmlDocumentSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="DeleteContentTypeXmlDocument">
      <wsdl:input message="tns:DeleteContentTypeXmlDocumentSoapIn"/>
      <wsdl:output message="tns:DeleteContentTypeXmlDocumentSoapOut"/>
    </wsdl:operation>
    <wsdl:operation name="ApplyContentTypeToList">
      <wsdl:input message="tns:ApplyContentTypeToListSoapIn"/>
      <wsdl:output message="tns:ApplyContentTypeToListSoapOut"/>
    </wsdl:operation>
  </wsdl:portType>
  <wsdl:binding name="ListsSoap" type="tns:ListsSoap">
    <soap:binding transport="http://schemas.xmlsoap.org/soap/http"/>
    <wsdl:operation name="GetList">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetList" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListAndView">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListAndView" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="DeleteList">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/DeleteList" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddList">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/AddList" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddListFromFeature">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/AddListFromFeature" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateList">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UpdateList" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListCollection">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListCollection" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListItems">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListItems" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListItemChanges">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListItemChanges" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListItemChangesSinceToken">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListItemChangesSinceToken" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateListItems">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UpdateListItems" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddDiscussionBoardItem">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/AddDiscussionBoardItem" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetVersionCollection">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetVersionCollection" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddAttachment">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/AddAttachment" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAttachmentCollection">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetAttachmentCollection" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="DeleteAttachment">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/DeleteAttachment" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="CheckOutFile">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/CheckOutFile" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UndoCheckOut">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UndoCheckOut" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="CheckInFile">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/CheckInFile" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListContentTypes">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListContentTypes" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListContentType">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListContentType" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="CreateContentType">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/CreateContentType" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateContentType">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UpdateContentType" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="DeleteContentType">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/DeleteContentType" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateContentTypeXmlDocument">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UpdateContentTypeXmlDocument" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateContentTypesXmlDocument">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UpdateContentTypesXmlDocument" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="DeleteContentTypeXmlDocument">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/DeleteContentTypeXmlDocument" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ApplyContentTypeToList">
      <soap:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/ApplyContentTypeToList" style="document"/>
      <wsdl:input>
        <soap:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:binding name="ListsSoap12" type="tns:ListsSoap">
    <soap12:binding transport="http://schemas.xmlsoap.org/soap/http"/>
    <wsdl:operation name="GetList">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetList" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListAndView">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListAndView" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="DeleteList">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/DeleteList" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddList">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/AddList" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddListFromFeature">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/AddListFromFeature" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateList">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UpdateList" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListCollection">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListCollection" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListItems">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListItems" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListItemChanges">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListItemChanges" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListItemChangesSinceToken">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListItemChangesSinceToken" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateListItems">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UpdateListItems" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddDiscussionBoardItem">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/AddDiscussionBoardItem" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetVersionCollection">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetVersionCollection" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="AddAttachment">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/AddAttachment" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetAttachmentCollection">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetAttachmentCollection" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="DeleteAttachment">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/DeleteAttachment" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="CheckOutFile">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/CheckOutFile" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UndoCheckOut">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UndoCheckOut" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="CheckInFile">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/CheckInFile" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListContentTypes">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListContentTypes" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="GetListContentType">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/GetListContentType" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="CreateContentType">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/CreateContentType" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateContentType">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UpdateContentType" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="DeleteContentType">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/DeleteContentType" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateContentTypeXmlDocument">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UpdateContentTypeXmlDocument" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="UpdateContentTypesXmlDocument">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/UpdateContentTypesXmlDocument" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="DeleteContentTypeXmlDocument">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/DeleteContentTypeXmlDocument" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
    <wsdl:operation name="ApplyContentTypeToList">
      <soap12:operation soapAction="http://schemas.microsoft.com/sharepoint/soap/ApplyContentTypeToList" style="document"/>
      <wsdl:input>
        <soap12:body use="literal"/>
      </wsdl:input>
      <wsdl:output>
        <soap12:body use="literal"/>
      </wsdl:output>
    </wsdl:operation>
  </wsdl:binding>
  <wsdl:service name="Lists">
    <wsdl:port name="ListsSoap" binding="tns:ListsSoap">
      <soap:address location="http://atlas.wz.hasbro.com/sites/dept/tsops/_vti_bin/Lists.asmx"/>
    </wsdl:port>
    <wsdl:port name="ListsSoap12" binding="tns:ListsSoap12">
      <soap12:address location="http://atlas.wz.hasbro.com/sites/dept/tsops/_vti_bin/Lists.asmx"/>
    </wsdl:port>
  </wsdl:service>
</wsdl:definitions>