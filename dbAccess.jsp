<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.xml.xpath.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.xml.sax.SAXParseException" %>
<%@ page import="java.io.*" %>
<%@ page import="org.w3c.dom.*" %>
<%
try
{
    // Parse the config file for database credentials
    String configFileURI = "conf\\dbConfig.xml";
    File file = new File (configFileURI);
    if (file.exists () == false)
        out.println ("<p>Config file \"" + configFileURI + "\" not found.");

    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance ();
    DocumentBuilder builder = factory.newDocumentBuilder ();
    Document document = builder.parse (file);

    XPath xpath = XPathFactory.newInstance().newXPath();

    String driver = (String)
        xpath.compile ("//config//jdbc//driver").evaluate (document, XPathConstants.STRING);
    String url = (String)
        xpath.compile ("//config//jdbc//url").evaluate (document, XPathConstants.STRING);
    String username = (String)
        xpath.compile ("//config//jdbc//username").evaluate (document, XPathConstants.STRING);
    String password = (String)
        xpath.compile ("//config//jdbc//password").evaluate (document, XPathConstants.STRING);

    // Access database
    String myQuery = "SELECT column_name "
        + "FROM information_schema.columns "
        + "WHERE table_name = 'observations_compact'";
    Connection myConnection = null;
    PreparedStatement myPreparedStatement = null;
    ResultSet rset = null;
    Class.forName (driver).newInstance ();
    myConnection = DriverManager.getConnection(url,username,password);
    myPreparedStatement = myConnection.prepareStatement(myQuery);
    rset = myPreparedStatement.executeQuery();
    
    //build sensor drop down list
    String sensorName = "";
    out.println ("<select name = \"Sensor\">");
    while (rset.next ())
    {
        sensorName = rset.getString("column_name");
        out.print ("<option value = \"");
        out.print (sensorName);
        out.print ("\">");
        out.print (sensorName);
        out.println ("</option>");
    }
    out.println ("</select>");
}
catch (ClassNotFoundException e)
{
    out.println (e);
    e.printStackTrace ();
}
catch (SQLException ex)
{
    out.println ("<p>");
    out.print("SQLException: "+ ex.getMessage () + "<p>");
    out.print("SQLState: " + ex.getSQLState () + "<p>");
    out.print("VendorError: " + ex.getErrorCode () + "<p>");
}
catch (IOException ioEx)
{
    out.println ("<p>");
    out.println ("IOException: " + ioEx.getMessage ());
}
catch (SAXParseException saxEx)
{
    out.println ("<p>");
    out.println ("SAXParseException: " + saxEx.getMessage ());
}
%>
