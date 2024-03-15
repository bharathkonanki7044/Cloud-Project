<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Hybrid Encryption for images</title>
</head>
<body>
<%
String name=request.getParameter("name");
String password=request.getParameter("password");
if(name.equals("cloud")&&password.equals("cloud"))
{
	response.sendRedirect("adminhome.jsp?msg=Login Successfully");
}else{
	response.sendRedirect("admin.jsp?msg=Please enter valid credentials");
}
%>
</body>
</html>