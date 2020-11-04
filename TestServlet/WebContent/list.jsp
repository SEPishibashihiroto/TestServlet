<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.ResultSet"
	import="java.text.NumberFormat"%>
<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
	String nowPage = (String) request.getAttribute("nowPage");
	int now = (int) request.getAttribute("np");
	int start = 0;
	int end = 0;
	int role_id = (int) session.getAttribute("role_id");
	String Role_id = String.valueOf(role_id);
	int listCnt = (int) request.getAttribute("listCnt");
	int maxPage = listCnt / 10;
	NumberFormat nf = NumberFormat.getNumberInstance();
	if (listCnt % 10 > 0) {
		maxPage = maxPage + 1;
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>交通費登録システム:一覧画面</title>
<link rel="stylesheet" href="./css/list.css">
</head>

<body>
	<h2>交通費登録システム:一覧</h2>
	<table class="topmenue">
		<tr>
			<td>
				<form method="GET">
					<input type="submit" value="新規登録" formaction="Add" class="btn">
				</form>
			</td>
			<td>
				<%
					if (Role_id.equals("2")) {
				%>
				<form action="useradd.jsp" method="post">
					<input type="submit" value="ユーザー新規登録" class="btn">
				</form> <%
 	}
 %>
			</td>
			<td>
				<form action="Excel" method="post">
					<input type="submit" value="Excelへ出力" class="btn">
				</form>
			</td>
			<td>
				<form action="TransitdataList" method="get">
					<input type="hidden" name="menulist" value="3">
					<input type="submit" value="交通手段一覧へ" class="btn">
				</form>
			</td>
		</tr>
	</table>
	<br>
	<%
		rs = (ResultSet) request.getAttribute("rs");
	%>

	<form class="page" action="List" method="get">
		<ul>
			<li>
				<%
					if (now == 1) {
				%> <a><%="<<"%></a> <%
 	} else {
 %> <a href="List?page=1"><%="<<"%></a> <%
 	}
 %>
			</li>
			<li>
				<%
					if (now == 1) {
				%> <a><%="<"%></a> <%
 	} else {
 %> <a href="List?page=<%=now - 1%>"><%="<"%></a> <%
 	}
 %>
			</li>
			<%
				if (maxPage <= 5) {
					start = 1;
					end = maxPage;
				} else if (now == maxPage || now == maxPage - 1) {
					start = maxPage - 4;
					end = maxPage;
				} else if (now >= 3) {
					start = now - 2;
					end = now + 2;
				} else {
					start = 1;
					end = 5;
				}
				for (int i = start; i <= end; i++) {
			%>
			<li>
				<%
					if (now == i) {
				%> <a><%=i%></a> <%
 	} else {
 %> <a href="List?page=<%=i%>"><%=i%></a> <%
 	}
 %>
			</li>
			<%
				}
			%>
			<li>
				<%
					if (now == maxPage) {
				%> <a><%=">"%></a> <%
 	} else {
 %> <a href="List?page=<%=now + 1%>"><%=">"%></a> <%
 	}
 %>
			</li>
			<li>
				<%
					if (now == maxPage) {
				%> <a><%=">>"%></a> <%
 	} else {
 %> <a href="List?page=<%=maxPage%>"><%=">>"%></a> <%
 	}
 %>
			</li>
		</ul>

	</form>
	<br>
	<form>
		<table class="table1">
			<tr style="background-color: #99CCFF;">
				<td class="td1"><b>日付</b></td>
				<td class="td1"><b>片道or往復</b></td>
				<td class="td1"><b>交通機関</b></td>
				<td class="td1"><b>出発駅</b></td>
				<td class="td1"><b>到着駅</b></td>
				<td class="td1"><b>金額</b></td>
				<td></td>
			</tr>

			<%
				while (rs.next()) {
			%>
			<form method="get" name="<%=rs.getInt("id")%>">
				<tr>
					<input type="hidden" name="id" value="<%=rs.getString("id")%>">
					<td><%=rs.getString("day").replace('-', '/')%><input
						type="hidden" name="day"
						value="<%=rs.getString("day").replace('-', '/')%>"></td>
					<td><%=rs.getString("route_name")%><input type="hidden"
						name="route_name" value="<%=rs.getString("route_name")%>"></td>
					<td><%=rs.getString("transit_name")%><input type="hidden"
						name="transit_name" value="<%=rs.getString("transit_name")%>"></td>
					<td><%=rs.getString("from_st")%><input type="hidden"
						name="from_st" value="<%=rs.getString("from_st")%>"></td>
					<td><%=rs.getString("to_st")%><input type="hidden"
						name="to_st" value="<%=rs.getString("to_st")%>"></td>
					<td>
						<%
							int Price = Integer.parseInt(rs.getString("price"));
						%><%=nf.format(Price)%>円<input type="hidden" name="price"
						value="<%=nf.format(Price)%>">
					</td>

					<td><input type="submit" value="編集" formaction="edit.jsp"
						class="tbtn"><input type="submit" value="削除"
						formaction="Delete.jsp" class="tbtn"></td>
				</tr>
			</form>
			<%
				}
			%>
		</table>
	</form>
	<br>
	<form class="page" action="List" method="get">
		<ul>
			<li>
				<%
					if (now == 1) {
				%> <a><%="<<"%></a> <%
 	} else {
 %> <a href="List?page=1"><%="<<"%></a> <%
 	}
 %>
			</li>
			<li>
				<%
					if (now == 1) {
				%> <a><%="<"%></a> <%
 	} else {
 %> <a href="List?page=<%=now - 1%>"><%="<"%></a> <%
 	}
 %>
			</li>
			<%
				if (maxPage <= 5) {
					start = 1;
					end = maxPage;
				} else if (now == maxPage || now == maxPage - 1) {
					start = maxPage - 4;
					end = maxPage;
				} else if (now >= 3) {
					start = now - 2;
					end = now + 2;
				} else {
					start = 1;
					end = 5;
				}
				for (int i = start; i <= end; i++) {
			%>
			<li>
				<%
					if (now == i) {
				%> <a><%=i%></a> <%
 	} else {
 %> <a href="List?page=<%=i%>"><%=i%></a> <%
 	}
 %>
			</li>
			<%
				}
			%>
			<li>
				<%
					if (now == maxPage) {
				%> <a><%=">"%></a> <%
 	} else {
 %> <a href="List?page=<%=now + 1%>"><%=">"%></a> <%
 	}
 %>
			</li>
			<li>
				<%
					if (now == maxPage) {
				%> <a><%=">>"%></a> <%
 	} else {
 %> <a href="List?page=<%=maxPage%>"><%=">>"%></a> <%
 	}
 %>
			</li>
		</ul>

	</form>
	<br>

	<div class="newbtn">
		<form method="GET">
			<input type="submit" value="新規登録" formaction="Add" class="btn">
		</form>
	</div>


</body>
</html>
