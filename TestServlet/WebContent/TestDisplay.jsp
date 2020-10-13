<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="common.*" import="java.sql.*"%>
<%
	String text1 = CommonDB.getRouteName("1");
	String text2 = CommonDB.getTransitName("2");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>text1:片道or往復</p>
	<p><%=text1%></p>
	<p>text2:交通機関</p>
	<p><%=text2%></p>
</body>
</html>