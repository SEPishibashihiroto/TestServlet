<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String day = (String) request.getAttribute("day") == null ? ""
			: (String) request.getAttribute("day");
	String route = (String) request.getAttribute("route") == null ? ""
			: (String) request.getAttribute("route");
	String transit = (String) request.getAttribute("transit") == null ? ""
			: (String) request.getAttribute("transit");
	String from_st = (String) request.getAttribute("from_st") == null ? ""
			: (String) request.getAttribute("from_st");
	String to_st = (String) request.getAttribute("to_st") == null ? ""
			: (String) request.getAttribute("to_st");
	String price = (String) request.getAttribute("price") == null ? ""
			: (String) request.getAttribute("price");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>OK!</h1>
	<table>
		<tr>
			<td>日付</td>
			<td>:</td>
			<td><%=day%></td>
		</tr>
		<tr>
			<td>片道or往復</td>
			<td>:</td>
			<td><%=route%></td>
		</tr>
		<tr>
			<td>交通機関</td>
			<td>:</td>
			<td><%=transit%></td>
		</tr>
		<tr>
			<td>出発駅</td>
			<td>:</td>
			<td><%=from_st%></td>
		</tr>
		<tr>
			<td>到着駅</td>
			<td>:</td>
			<td><%=to_st%></td>
		</tr>
		<tr>
			<td>金額</td>
			<td>:</td>
			<td><%=price%></td>
		</tr>
	</table>
</body>
</html>