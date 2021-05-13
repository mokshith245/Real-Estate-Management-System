
<head>
<style>
h1 {text-align: center;}
p {text-align: center;}
div {text-align: center;}
.button {
  background-color: #FFA500;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
</head>  
<h1>Update House Status</h1>  
<%  
String profile_msg=(String)request.getAttribute("profile_msg");  
if(profile_msg!=null){  
out.print(profile_msg);  
}  
String login_msg=(String)request.getAttribute("login_msg");  
if(login_msg!=null){  
out.print(login_msg);  
}  
 %>  

 <br/>  
<form action="House_update.jsp" method="post">  
Property_id:<input type="number" name="property_id"/><br/><br/>    
<input type="submit"class="button" value="Update Availability"/>  
</form>  