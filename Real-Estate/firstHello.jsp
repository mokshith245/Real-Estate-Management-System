T<!DOCTYPE html>
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
	
		<a href="http://localhost:8080/firstjsp/" id ="link"><b>HOME</b></a>   <a href="" id ="link"><b>CONTACT</b></a>
	
	
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
			

			ResultSet rset = stmt.executeQuery("select * from" + " " +"Transaction,Houses where Houses.property_id = Transaction.property_id and emp_id =" request.getParameter("Agent_id"));


			ResultSetMetaData rsmd = rset.getMetaData();

			int columnCount = rsmd.getColumnCount();

			%>
				<br><br><br>
				
				<%



			int counter = 0;
			out.print("<table>");

			while(rset.next())
			{
				
				%>
					<tr>
				<%
			 	

				for(int i=1;i<=columnCount;i++)
				{
					
					out.print("<td>"+rset.getString(i) + "</td>");
					
				}
				counter++;
			    
			    %>
			        </tr>
			    <%
				
			}
		

			out.print("</table>");




		}
		catch(Exception e)
		{
			response.sendRedirect("index.jsp");
			out.println(e);
		}
		// out.println("2");
out.println("<div>");
	%>
	<!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>
</html>