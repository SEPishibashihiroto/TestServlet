<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*" import="javax.servlet.http.*"
	import="javax.servlet.*"%>
<%
	String errmsg = (String) request.getAttribute("errmsg") == null ? ""
			: (String) request.getAttribute("errmsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestInput</title>
</head>
<body>
	<%
		if (!(errmsg.equals(""))) {
	%>
	<h2><%=errmsg%></h2>
	<%
		}
	%>

	<form action="./InputTest1" method="get">
		<table>
			<tr>
				<td>メールアドレス</td>
				<td>:</td>
				<td><input type="text" name="address"></td>
			</tr>
			<tr>
				<td>パスワード</td>
				<td>:</td>
				<td><input type="text" name="password"></td>
			</tr>
		</table>
		<input type="submit" value="送信">
	</form>
</body>
</html>