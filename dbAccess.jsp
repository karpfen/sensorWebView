<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.xml.xpath.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.xml.sax.*" %>
<%@ page import="java.io.*" %>
<%@ page import="org.w3c.dom.*" %>
<%
try
{
    // Parse the config file for database credentials
	DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
	factory.setNamespaceAware (true);
    DocumentBuilder builder = factory.newDocumentBuilder();
    Document document = builder.parse(new ByteArrayInputStream ("dbConfig.xml".getBytes ()));

    XPath xpath = XPathFactory.newInstance().newXPath();

    String driver = (String)
        xpath.compile("//config//jdbc//driver").evaluate(document, XPathConstants.STRING);
    String url = (String)
        xpath.compile("//config//jdbc//url").evaluate(document, XPathConstants.STRING);
    String username = (String)
        xpath.compile("//config//jdbc//username").evaluate(document, XPathConstants.STRING);
    String password = (String)
        xpath.compile("//config//jdbc//password").evaluate(document, XPathConstants.STRING);

    // Access database
    String myDataField = null;
    String myQuery = "SELECT * FROM observations_compact LIMIT 10";
    Connection myConnection = null;
    PreparedStatement myPreparedStatement = null;
    ResultSet rset = null;
    Class.forName(driver).newInstance();
    myConnection = DriverManager.getConnection(url,username,password);
    myPreparedStatement = myConnection.prepareStatement(myQuery);
    rset = myPreparedStatement.executeQuery();
    if(rset.next())
        myDataField = rset.getString("heartrate");
    out.print(myDataField);
}
catch(ClassNotFoundException e)
{
    out.println(e);
    e.printStackTrace();
}
catch (SQLException ex)
{
    out.print("SQLException: "+ex.getMessage());
    out.print("SQLState: " + ex.getSQLState());
    out.print("VendorError: " + ex.getErrorCode());
}
catch (IOException ioEx)
{
	out.println(ioEx.getMessage ());
}
%>
