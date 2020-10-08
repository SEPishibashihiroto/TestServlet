<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String dayErr = (String) request.getAttribute("dayErr") == null ? ""
			: (String) request.getAttribute("dayErr");
	String routeErr = (String) request.getAttribute("routeErr") == null ? ""
			: (String) request.getAttribute("routeErr");
	String transitErr = (String) request.getAttribute("transitErr") == null ? ""
			: (String) request.getAttribute("transitErr");
	String from_stErr = (String) request.getAttribute("from_stErr") == null ? ""
			: (String) request.getAttribute("from_stErr");
	String to_stErr = (String) request.getAttribute("to_stErr") == null ? ""
			: (String) request.getAttribute("to_stErr");
	String priceErr = (String) request.getAttribute("priceErr") == null ? ""
			: (String) request.getAttribute("priceErr");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestInput</title>
</head>
<body>

	<form action="./InputTest2" method="get">
		<table>
			<tr>
				<td>日付</td>
				<td>:</td>
				<td><input type="text" name="day"></td>
				<%
					if (!(dayErr.equals(""))) {
				%>
				<td><%=dayErr%></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td>片道or往復</td>
				<td>:</td>
				<td><input type="text" name="route"></td>
				<%
					if (!(routeErr.equals(""))) {
				%>
				<td><%=routeErr%></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td>交通機関</td>
				<td>:</td>
				<td><input type="text" name="transit"></td>
				<%
					if (!(transitErr.equals(""))) {
				%>
				<td><%=transitErr%></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td>出発駅</td>
				<td>:</td>
				<td><input type="text" name="from_st"></td>
				<%
					if (!(from_stErr.equals(""))) {
				%>
				<td><%=from_stErr%></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td>到着駅</td>
				<td>:</td>
				<td><input type="text" name="to_st"></td>
				<%
					if (!(to_stErr.equals(""))) {
				%>
				<td><%=to_stErr%></td>
				<%
					}
				%>
			</tr>
			<tr>
				<td>金額</td>
				<td>:</td>
				<td><input type="text" name="price"></td>
				<%
					if (!(priceErr.equals(""))) {
				%>
				<td><%=priceErr%></td>
				<%
					}
				%>
			</tr>
		</table>

		<input type="submit" value="送信">
	</form>

</body>
</html>