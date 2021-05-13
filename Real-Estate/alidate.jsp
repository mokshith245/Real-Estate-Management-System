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

				
               ResultSet rset = stmt.executeQuery("select * from agents where pwd ="+request.getParameter("password"));
               if(rset.next)
               {
                 response.sendRedirect("agent.jsp");
               }
               else
               {
               	response.sendRedirect("welcome.jsp");
               }

			}
			catch(Exception e)
			{
				out.println(e);
			}
	%>

</body>
</html>