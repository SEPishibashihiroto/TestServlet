<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.ResultSet"%>
<%
	ResultSet route = (ResultSet) request.getAttribute("route");
	ResultSet transit = (ResultSet) request.getAttribute("transit");
	ResultSet transist_data = (ResultSet) request.getAttribute("transist_data");
	ResultSet transist_list = (ResultSet) request.getAttribute("transist_list");
	ResultSet user = (ResultSet) request.getAttribute("user");
	ResultSet user_category = (ResultSet) request.getAttribute("user_category");
	String text1 = (String) request.getAttribute("text1");
	String text2 = (String) request.getAttribute("text2");
	int cnt = (int) request.getAttribute("count");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>片道or往復</p>
	<table>
		<%
			while (route.next()) {
		%>
		<tr>
			<td><%=route.getInt("route_no")%></td>
			<td><%=route.getString("route_name")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>

	<p>交通機関</p>
	<table>
		<%
			while (transit.next()) {
		%>
		<tr>
			<td><%=transit.getInt("transit_no")%></td>
			<td><%=transit.getString("transit_name")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>

	<p>交通手段リスト</p>
	<table>
		<%
			while (transist_data.next()) {
		%>
		<tr>
			<td><%=transist_data.getInt("data_id")%></td>
			<td><%=transist_data.getString("transit_name")%></td>
			<td><%=transist_data.getString("from_st")%></td>
			<td><%=transist_data.getString("to_st")%></td>
			<td><%=transist_data.getInt("price")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>

	<p>
		交通手段登録件数:<%=cnt%>件
	<p>
		<br>
	<p>交通登録リスト</p>
	<table>
		<%
			while (transist_list.next()) {
		%>
		<tr>
			<td><%=transist_list.getInt("id")%></td>
			<td><%=transist_list.getDate("day").toString().replace("-", "/")%></td>
			<td><%=transist_list.getString("route_name")%></td>
			<td><%=transist_list.getString("transit_name")%></td>
			<td><%=transist_list.getString("from_st")%></td>
			<td><%=transist_list.getString("to_st")%></td>
			<td><%=transist_list.getInt("price")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>

	<p>ユーザー情報</p>
	<table>
		<%
			while (user.next()) {
		%>
		<tr>
			<td><%=user.getInt("user_id")%></td>
			<td><%=user.getString("address")%></td>
			<td><%=user.getString("password")%></td>
			<td><%=user.getInt("role_id")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>

	<p><%=text1%>
	<p>
	<p><%=text2%>
	<p>
		<br>
	<p>利用者分類表</p>
	<table>
		<%
			while (user_category.next()) {
		%>
		<tr>
			<td><%=user_category.getInt("role_id")%></td>
			<td><%=user_category.getString("role_name")%></td>
		</tr>
		<%
			}
		%>
	</table>
	<br>
</body>
</html>