<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="common.*" import="java.sql.*"%>
<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
	rs.next();

	int id = rs.getInt("user_id");
	String userName = rs.getString("user_name");
	String address = rs.getString("address");
	String password = rs.getString("password");
	String salt = rs.getString("salt");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>
		id :
		<%=id%></p>
	<p>
		name :
		<%=userName%></p>
	<p>
		address :
		<%=address%></p>
	<p>
		password :
		<%=password%></p>
	<p>
		salt :
		<%=salt%></p>
</body>
</html>