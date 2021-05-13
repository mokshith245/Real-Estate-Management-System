<!DOCTYPE html>
<html>
<head>
	<title>Intro to JSP</title>
	 <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" href="styling.css">
</head>
<style>
a:link{
  text-decoration: none!important;
  cursor: pointer;
}
</style>
<body >
	<%@ page import="java.sql.*" %>
	<h1>Sales Report</h1>
	<div>
	<%

	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
response.setHeader("Expires", "0"); // Proxies.
	// if(session.getAttribute("TableName")==null)
	// {
	// 	response.sendRedirect("index.jsp");
	// }

	String url = "jdbc:mysql://localhost:3306/dbms_project";
		String user = "root";
		// Credentials c = new Credentials();
		String pass = "Veeru@2426";

		 // Class.forName(driverClassName);
		 // loadClass("com.mysql.jdbc.Driver")

		

		Class.forName("com.mysql.jdbc.Driver").newInstance(); 

		try(

				Connection conn = DriverManager.getConnection(url,user,pass);
				Statement stmt = conn.createStatement();
			)
		{
			

			ResultSet rset = stmt.executeQuery("select * from Houses,Transaction where Houses.property_id = Transaction.property_id");


			ResultSetMetaData rsmd = rset.getMetaData();

			int columnCount = rsmd.getColumnCount();

			%>
			<br><br>
				<%
out.println("<div class=\"table-responsive\">");
			
			out.println("<table class = \"table-bordered table table-striped table-hover \">");
			out.println("<thead>");
			for(int i=1;i<=columnCount;i++)
			{
				out.print("<th scope=\"col\">"+rsmd.getColumnName(i).toUpperCase() + "</th>");
			}
			    out.println("</thead>");
			int counter = 0;
			out.println("<tbody>");
			while(rset.next())
			{
				
				out.println("<tr>");
			 	

				for(int i=1;i<=columnCount;i++)
				{
					
					out.print("<td>"+rset.getString(i) + "</td>");
					
				}
				counter++;
			    out.println("</tr>");
				
			}
		out.println("</tbody>");

			out.println("</table>");





			}
			catch(Exception e)
			{
				out.println(e);
			}
	%>
</div>

</body>
</html>