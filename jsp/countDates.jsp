<%--
Project: Urban Emotions Web Viewer

The Urban Emotions Web Viewer is free software. It can be redistributed and
modified under the terms of the GNU General Public Licence as published by the
Free Software Foundation, either Version 3 of the license, or (at your option)
any later version.

For the license, see <http://www.gnu.org/licenses/>.

Author: Andreas Petutschnig
Email: andreas@petutschnig.de

Description: This web viewer can be used to call a web processing service to
generate images derived from sensor data and display this data in a web map.
--%>
<%@ page contentType="text/html; charset=utf-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="javax.xml.xpath.*" %>
<%@ page import="javax.xml.parsers.DocumentBuilderFactory" %>
<%@ page import="javax.xml.parsers.DocumentBuilder" %>
<%@ page import="org.xml.sax.SAXParseException" %>
<%@ page import="java.io.*" %>
<%@ page import="org.w3c.dom.*" %>
<%
/*
 * Only a limited number of all available time stamps will be displayed in
 * the UI. This number defines how many there will be. They are evenly
 * spaced throughout the data.
 */
final int numDatesDisplayed = 30;
String allDates = "";
Connection myConnection = null;
try
{
    // Parse the config file for database credentials
    String configFileURI = "conf\\dbConfig.xml";
    File file = new File (configFileURI);
    if (file.exists () == false)
    {
        // Check if file exists on Unix system
        configFileURI = "conf/dbConfig.xml";
        file = new File (configFileURI);
    }
    if (file.exists () == false)
    {
        out.println ("<p>Config file \"" + configFileURI + "\" not found.");
    }

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

    // Access database for date count
    String myQuery = "SELECT count (timestamp) "
        + "FROM observations_compact;";
    PreparedStatement myPreparedStatement = null;
    ResultSet rset = null;
    Class.forName (driver).newInstance ();
    myConnection = DriverManager.getConnection(url,username,password);
    myPreparedStatement = myConnection.prepareStatement(myQuery);
    rset = myPreparedStatement.executeQuery();

    int countTotal = 0;
    while (rset.next ())
    {
        countTotal = (int) rset.getInt("count");
    }
    int factor = countTotal / numDatesDisplayed;

    // Access database for all dates
    myQuery = "SELECT * FROM( "
        + "(SELECT MIN(timestamp) AS timestamp "
        + "FROM observations_compact) "
        + "UNION "
        + "(SELECT tbl.timestamp "
        + "FROM ( "
        + "SELECT *,row_number() OVER (ORDER BY timestamp ASC) "
        + "AS row FROM "
        + "observations_compact)  tbl "
        + "WHERE tbl.row % " + factor + " = 0) "
        + "UNION "
        + "(SELECT MAX(timestamp) AS timestamp "
        + "FROM observations_compact) "
        + ") timestamp "
        + "ORDER BY timestamp;";

    myConnection = null;
    myPreparedStatement = null;
    rset = null;
    Class.forName (driver).newInstance ();
    myConnection = DriverManager.getConnection(url,username,password);
    myPreparedStatement = myConnection.prepareStatement(myQuery);
    rset = myPreparedStatement.executeQuery();

    String date = "";
    // set countTotal to the actual number of received dates
    countTotal = 0;
    while (rset.next ())
    {
        countTotal++;
        date = rset.getString("timestamp");
        allDates += date + ",";
    }
    allDates = allDates.substring (0, allDates.length () - 1);
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
finally
{
    if (myConnection != null)
    {
        myConnection.close ();
    }
}
%>

<script language="javascript"> 
     var dateCount = "<%=numDatesDisplayed%>";
     var dates = "<%=allDates%>";
     dates = dates.split(',');
</script> 
