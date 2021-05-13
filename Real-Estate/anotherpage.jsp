
<%
String user = request.getParameter("buyerUser");
out.println("Hi " + user);
String password = request.getParameter("buyerPassword");
out.println("pass : " + password);
%>