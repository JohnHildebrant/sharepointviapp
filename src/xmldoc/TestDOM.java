package xmldoc;

import org.w3c.dom.*;
import javax.xml.parsers.*;
import javax.xml.transform.*;
import javax.xml.transform.stream.*;
import javax.xml.transform.dom.*;

public class TestDOM {
  public TestDOM() { }
    public Document doit()
      throws javax.xml.parsers.ParserConfigurationException,
             javax.xml.transform.TransformerException,
             javax.xml.transform.TransformerConfigurationException{

        DocumentBuilderFactory factory
          = DocumentBuilderFactory.newInstance();
        DocumentBuilder builder = factory.newDocumentBuilder();
        DOMImplementation impl = builder.getDOMImplementation();

        Document doc = impl.createDocument(null,null,null);
        //Element e1 = doc.createElement("howto");
        Element e1 = doc.createElement("Query");
        doc.appendChild(e1);
        
        Element e2 = doc.createElement("Where");
        e1.appendChild(e2);
        
        Element e3 = doc.createElement("Eq");
        e2.appendChild(e3);
        
        Element e4 = doc.createElement("FieldRef");
        e3.appendChild(e4); 
        
        Element e5 = doc.createElement("Value");
        e3.appendChild(e5);
        
        e4.setAttribute("Name", "Physical_x0020_or_x0020_Virtual");
        e5.appendChild(doc.createTextNode("Virtual"));
        
        e5.setAttribute("Type", "Text");
        
        
        //Element e2 = doc.createElement("java");
//        e1.appendChild(e2);
//
//        e2.setAttribute("url","http://www.rgagnon.com/howto.html");


        // transform the Document into a String
        DOMSource domSource = new DOMSource(doc);
        TransformerFactory tf = TransformerFactory.newInstance();
        Transformer transformer = tf.newTransformer();
        //transformer.setOutputProperty
        //    (OutputKeys.OMIT_XML_DECLARATION, "yes");
        transformer.setOutputProperty(OutputKeys.METHOD, "xml");
        transformer.setOutputProperty(OutputKeys.ENCODING,"ISO-8859-1");
        transformer.setOutputProperty
            ("{http://xml.apache.org/xslt}indent-amount", "4");
        transformer.setOutputProperty(OutputKeys.INDENT, "yes");
        java.io.StringWriter sw = new java.io.StringWriter();
        StreamResult sr = new StreamResult(sw);
        transformer.transform(domSource, sr);
        String xml = sw.toString();
        //return xml;
        return doc;
    }
}