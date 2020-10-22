<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="common.CommonDB" import="java.sql.*"%>
<%
	String errmsg = (String) request.getAttribute("errmsg") == null ? ""
			: (String) request.getAttribute("errmsg");
	String id = request.getParameter("id") == null ? "" : request.getParameter("id");
	String day = (String) request.getParameter("day") == null ? "" : request.getParameter("day");
	int route_no = request.getAttribute("route_no") == null ? 0
			: (int) request.getAttribute("route_no");
	int transit_no = request.getAttribute("transit_no") == null ? 0
			: (int) request.getAttribute("transit_no");
	String from_st = (String) request.getParameter("from_st") == null ? "" : request.getParameter("from_st");
	String to_st = (String) request.getParameter("to_st") == null ? "" : request.getParameter("to_st");
	String price = (String) request.getParameter("price") == null ? "" : request.getParameter("price");
	ResultSet route_rs = CommonDB.getRouteAll();
	ResultSet transit_rs = CommonDB.getTransitAll();
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
			errmsg.toString();
		}
	%>

	<form action="./TestInputSavlet" method="get">
		<table>
			<tr>
				<td>日付</td>
				<td>:</td>
				<td><input type="text" name="day"></td>
			</tr>
			<tr>
				<td>片道or往復</td>
				<td>:</td>
				<td><select name="route_no">
						<%
							while (route_rs.next()) {
								if (route_rs.getInt("route_no") == route_no) {
						%>
						<option value="<%=route_rs.getInt("route_no")%>" selected><%=route_rs.getString("route_name")%></option>
						<%
							} else {
						%>
						<option value="<%=route_rs.getInt("route_no")%>"><%=route_rs.getString("route_name")%></option>
						<%
							}
							}
						%>
				</select></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="hidden" name="menulist" value="1"></td>
				<td><input type="submit" formaction="TestTransitList"
					value="以前のデータを参照"></td>
			</tr>
			<tr>
				<td>交通機関</td>
				<td>:</td>
				<td><select name="transit_no">
						<%
							while (transit_rs.next()) {
								if (transit_rs.getInt("transit_no") == transit_no) {
						%>
						<option value="<%=transit_rs.getString("transit_no")%>" selected><%=transit_rs.getString("transit_name")%></option>
						<%
							} else {
						%>
						<option value="<%=transit_rs.getString("transit_no")%>"><%=transit_rs.getString("transit_name")%></option>
						<%
							}
							}
						%>
				</select></td>
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

		<input type="submit" value="確認">
	</form>
	<form action="TestListSavlet">
		<input type="submit" value="戻る">
	</form>

</body>
</html>