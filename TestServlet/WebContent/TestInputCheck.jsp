<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="common.*" import="java.sql.*"
	import="java.text.NumberFormat"%>

<%
	CommonAddData data = (CommonAddData) request.getAttribute("data");
	int Price = Integer.parseInt(data.getPrice());
	NumberFormat nf = NumberFormat.getNumberInstance();
	request.getSession().setAttribute("data", data);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TestInputCheck</title>
</head>
<body>
	<h2>TestInputCheck</h2>
	<form class="addlist">
		<table>
			<tr>
				<th>日付：</th>
				<td><%=data.getDay()%><input type="hidden" name="day"
					value="<%=data.getDay()%>"></td>
			</tr>
			<tr>
				<th>片道or往復：</th>
				<td><%=CommonDB.getRouteName(data.getRoute_no())%><input
					type="hidden" name="route_no" value="<%=data.getRoute_no()%>"></td>
			</tr>
			<tr>
				<th>交通機関：</th>
				<td><%=CommonDB.getTransitName(data.getTransit_no())%><input
					type="hidden" name="transit_no" value="<%=data.getTransit_no()%>"></td>
			</tr>
			<tr>
				<th>出発駅：</th>
				<td><%=data.getFrom_st()%><input type="hidden" name="from_st"
					value="<%=data.getFrom_st()%>"></td>
				<th class="to">―到着駅：</th>
				<td><%=data.getTo_st()%><input type="hidden" name="to_st"
					value="<%=data.getTo_st()%>"></td>
			</tr>
			<tr>
				<th>金額：</th>
				<td><%=nf.format(Price)%>円<input type="hidden" name="price"
					value="<%=data.getPrice()%>"></td>
			</tr>
		</table>

		<br> <input class="transitionbt" type="submit"
			formaction="TestInputCheckSavlet" value="登録"> <input
			class="transitionbt" type="submit" formaction="TestInput.jsp"
			formmethod="get" value="戻る">
	</form>

</body>
</html>