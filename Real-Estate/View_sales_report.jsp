<!DOCTYPE html>
<html>
<head>
	<title>
		YOUR TITLE
	</title>
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
 <!--    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="styling.css">
	  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <%@ page import = "java.util.*" %>  
	<%@ page import="java.sql.*" %>
	
    
	<%
            String url ="jdbc:mysql://localhost:3306/dbms_project"; 
			String user = "root";
			String pass = "Veeru@2426";
			Class.forName("com.mysql.jdbc.Driver").newInstance(); 
			try(
					Connection conn = DriverManager.getConnection(url,user,pass);
					Statement stmt = conn.createStatement();
				)
			{

				
               ResultSet rset = stmt.executeQuery("select * from Houses,Transaction where Transaction.property_id = Houses.property_id and Transaction.emp_id="+request.getParameter("agent_id")+" and Houses.status='"+request.getParameter("type")+"'");

               

              
			ResultSetMetaData rsmd = rset.getMetaData();

			int columnCount = rsmd.getColumnCount();

			%>
				
				<%

			%>
			<div class="container">

    <h1>Sales Report</h1>
    <hr>
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
				
			    out.println("</tr>");
				
			}
		out.println("</tbody>");

			out.println("</table>");
%>
			</div>
			</div>
			<%





			}
			catch(Exception e)
			{
				out.println(e);
			}
	%>

</body>
</html>