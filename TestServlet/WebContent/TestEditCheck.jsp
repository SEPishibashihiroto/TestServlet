<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="common.*" import="java.sql.*"%>
<%
	CommonUpdData data = (CommonUpdData) request.getAttribute("data");

	String route_name = CommonDB.getRouteName(data.getRoute_no());
	String transit_name = CommonDB.getTransitName(data.getTransit_no());
	request.getSession().setAttribute("upddata", data);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/editCheck.css">
<title>TestEditCheck</title>
</head>
<body>
	<h2>TestEditCheck</h2>
	<form action="./TestEditCheckSavlet" class="table">
		<table>
			<tr>
				<th>日付</th>
				<th>:</th>
				<td><%=data.getDay()%><input type="hidden" name="day"
					value="<%=data.getDay()%>"></td>
			</tr>
			<tr>
				<th>片道or往復</th>
				<th>:</th>
				<td><%=route_name%><input type="hidden" name="route_name"
					value="<%=route_name%>"></td>
			</tr>
			<tr>
				<th>交通機関</th>
				<th>:</th>
				<td><%=transit_name%><input type="hidden" name="transit_name"
					value="<%=transit_name%>"></td>
			</tr>
			<tr>
				<th>出発駅</th>
				<th>:</th>
				<td><%=data.getFrom_st()%><input type="hidden" name="from_st"
					value="<%=data.getFrom_st()%>"></td>
				<th class="to">－ 到着駅</th>
				<th>:</th>
				<td><%=data.getTo_st()%><input type="hidden" name="to_st"
					value="<%=data.getTo_st()%>"></td>
			</tr>
			<tr>
				<th>運賃</th>
				<th>:</th>
				<td><%=data.getPrice()%>円<input type="hidden" name="price"
					value="<%=data.getPrice()%>"></td>
			</tr>
		</table>
		<br>
		<div>
			<input type="hidden" name="id" value="<%=data.getId()%>">
		</div>
		<div>
			<input type="submit" value="編集" class="leftbtn btn">
		</div>
		<div>
			<input type="submit" value="戻る" formaction="./TestEdit.jsp"
				class="rightbtn btn">
		</div>

	</form>


</body>
</html>