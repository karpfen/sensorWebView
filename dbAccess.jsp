<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.* " %>
<%@ page import="java.io.*" %>
<%
try {
String driver = "";
String url = "";
String username = "";
String password = "";
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
%>