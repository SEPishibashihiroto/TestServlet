<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	<p><%=errmsg%></p>
	<%
		}
	%>

	<form action="./InputTest2" method="get">
		<table>
			<tr>
				<td>日付</td>
				<td>:</td>
				<td><input type="text" name="day"></td>
			</tr>
			<tr>
				<td>片道or往復</td>
				<td>:</td>
				<td><input type="text" name="route"></td>
			</tr>
			<tr>
				<td>交通機関</td>
				<td>:</td>
				<td><input type="text" name="transit"></td>
			</tr>
			<tr>
				<td>出発駅</td>
				<td>:</td>
				<td><input type="text" name="from_st"></td>
			</tr>
			<tr>
				<td>到着駅</td>
				<td>:</td>
				<td><input type="text" name="to_st"></td>
			</tr>
			<tr>
				<td>金額</td>
				<td>:</td>
				<td><input type="text" name="price"></td>
			</tr>
		</table>

		<input type="submit" value="送信">
	</form>

</body>
</html>