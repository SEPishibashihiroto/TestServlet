<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="common.*" import="java.sql.*"%>
<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%=request.getAttribute("listCnt")%>
</body>
</html>