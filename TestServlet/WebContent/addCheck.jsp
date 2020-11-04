<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.text.NumberFormat" import="common.*"%>

<%
	/** 登録か編集かの判断値**/
	String menulist = (String) request.getAttribute("menulist");

	CommonAddData data = (CommonAddData) request.getAttribute("data");

	/** 金額 処理変更**/
	int Price = (data.getPrice().isEmpty()) ? 0 : Integer.parseInt(data.getPrice());

	String route_name = CommonDB.getRouteName(data.getRoute_no());
	String transit_name = CommonDB.getTransitName(data.getTransit_no());

	NumberFormat nf = NumberFormat.getNumberInstance();

	request.getSession().setAttribute("data", data);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/add.css">
<title>登録確認</title>
</head>
<body>
	<h2>交通費登録システム：登録</h2>

	<form class="addlist" method="post">

		<table>
			<tr>
				<th>日付：</th>
				<td><%=data.getDay()%></td>
			</tr>

			<tr>
				<th>片道or往復：</th>
				<td><%=route_name%></td>
			</tr>

			<tr>
				<th>交通機関：</th>
				<td><%=transit_name%></td>
			</tr>

			<tr>
				<th>出発駅：</th>
				<td><%=data.getFrom_st()%></td>
				<th class="to">―到着駅：</th>
				<td><%=data.getTo_st()%></td>
			</tr>

			<tr>
				<th>金額：</th>
				<td>
					<%
						if (Price == 0) {
					%> <%=Price%> <%
 	} else {
 %> <%=nf.format(data.getRoute_no().equals("1") ? Price : Price * 2)%> <%
 	}
 %> 円
				</td>
			</tr>

		</table>

		<br>
		<!-- hidden用 -->
		<input type="hidden" name="menulist" value="<%=menulist%>"> <input
			type="hidden" name="day" value="<%=data.getDay()%>"> <input
			type="hidden" name="route_no" value="<%=data.getRoute_no()%>">
		<input type="hidden" name="transit_no"
			value="<%=data.getTransit_no()%>"> <input type="hidden"
			name="from_st" value="<%=data.getFrom_st()%>"> <input
			type="hidden" name="to_st" value="<%=data.getTo_st()%>"> <input
			type="hidden" name="price" value="<%=data.getPrice()%>"> <input
			class="transitionbt" type="submit" formaction="AddCheck" value="登録">
		<input class="transitionbt" type="submit" formaction="Add"
			formmethod="get" value="戻る">
	</form>
</body>
</html>