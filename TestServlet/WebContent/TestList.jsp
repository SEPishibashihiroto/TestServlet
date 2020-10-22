<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.sql.*"%>
<%
	ResultSet rs = (ResultSet) request.getAttribute("rs") == null ? null
			: (ResultSet) request.getAttribute("rs");
	int nowPage = (int) request.getAttribute("page");
	int maxPage = (int) request.getAttribute("maxPage");
	int start = 0;
	int end = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/testlist.css">
<title>TestList</title>
</head>
<body>
	<h2>testList</h2>
	<div>
		<form action="./TestInput.jsp">
			<input type="submit" value="新規登録">
		</form>
		<form action="./TestExcel">
			<input type="submit" value="Excelファイル出力">
		</form>
	</div>

	<div class="paging">
		<ul>
			<li>
				<%
					if (nowPage == 1) {
				%> <a><%="<<"%></a> <%
 	} else {
 %> <a href="TestListSavlet?page=1"><%="<<"%></a> <%
 	}
 %>
			</li>
			<li>
				<%
					if (nowPage == 1) {
				%> <a><%="<"%></a> <%
 	} else {
 %> <a href="TestListSavlet?page=<%=nowPage - 1%>"><%="<"%></a> <%
 	}
 %>
			</li>
			<%
				if (maxPage <= 5) {
					start = 1;
					end = maxPage;
				} else if (nowPage == maxPage || nowPage == maxPage - 1) {
					start = maxPage - 4;
					end = maxPage;
				} else if (nowPage >= 3) {
					start = nowPage - 2;
					end = nowPage + 2;
				} else {
					start = 1;
					end = 5;
				}
				for (int i = start; i <= end; i++) {
			%>
			<li>
				<%
					if (nowPage == i) {
				%> <a><%=i%></a> <%
 	} else {
 %> <a href="TestListSavlet?page=<%=i%>"><%=i%></a> <%
 	}
 %>
			</li>
			<%
				}
			%>
			<li>
				<%
					if (nowPage == maxPage) {
				%> <a><%=">"%></a> <%
 	} else {
 %> <a href="TestListSavlet?page=<%=nowPage + 1%>"><%=">"%></a> <%
 	}
 %>
			</li>
			<li>
				<%
					if (nowPage == maxPage) {
				%> <a><%=">>"%></a> <%
 	} else {
 %> <a href="TestListSavlet?page=<%=maxPage%>"><%=">>"%></a> <%
 	}
 %>
			</li>
		</ul>
	</div>
	<table>
		<tr>
			<th>日付</th>
			<th>片道or往復</th>
			<th>交通機関</th>
			<th>出発駅</th>
			<th>到着駅</th>
			<th>出発駅</th>
			<th></th>
		</tr>

		<%
			while (rs.next()) {
		%>
		<form>
			<tr class="<%=rs.getInt("id")%>">
				<td><%=rs.getString("day").replace('-', '/')%><input
					type="hidden" name="day"
					value="<%=rs.getString("day").replace('-', '/')%>"></td>
				<td><%=rs.getString("route_name")%><input type="hidden"
					name="route_name" value="<%=rs.getString("route_name")%>"></td>
				<td><%=rs.getString("transit_name")%><input type="hidden"
					name="transit_name" value="<%=rs.getString("transit_name")%>"></td>
				<td><%=rs.getString("from_st")%><input type="hidden"
					name="from_st" value="<%=rs.getString("from_st")%>"></td>
				<td><%=rs.getString("to_st")%><input type="hidden" name="to_st"
					value="<%=rs.getString("to_st")%>"></td>
				<td><%=rs.getInt("price")%><input type="hidden" name="price"
					value="<%=rs.getInt("price")%>">円</td>
				<td><input type="hidden" name="id" value="<%=rs.getInt("id")%>">
					<input type="submit" formaction="./TestEdit.jsp" value="編集">
					<input type="submit" formaction="./TestDelete.jsp" value="削除"></td>
			</tr>
		</form>
		<%
			}
		%>
	</table>


	<div class="paging">
		<ul>
			<li>
				<%
					if (nowPage == 1) {
				%> <a><%="<<"%></a> <%
 	} else {
 %> <a href="TestListSavlet?page=1"><%="<<"%></a> <%
 	}
 %>
			</li>
			<li>
				<%
					if (nowPage == 1) {
				%> <a><%="<"%></a> <%
 	} else {
 %> <a href="TestListSavlet?page=<%=nowPage - 1%>"><%="<"%></a> <%
 	}
 %>
			</li>
			<%
				if (maxPage <= 5) {
					start = 1;
					end = maxPage;
				} else if (nowPage == maxPage || nowPage == maxPage - 1) {
					start = maxPage - 4;
					end = maxPage;
				} else if (nowPage >= 3) {
					start = nowPage - 2;
					end = nowPage + 2;
				} else {
					start = 1;
					end = 5;
				}
				for (int i = start; i <= end; i++) {
			%>
			<li>
				<%
					if (nowPage == i) {
				%> <a><%=i%></a> <%
 	} else {
 %> <a href="TestListSavlet?page=<%=i%>"><%=i%></a> <%
 	}
 %>
			</li>
			<%
				}
			%>
			<li>
				<%
					if (nowPage == maxPage) {
				%> <a><%=">"%></a> <%
 	} else {
 %> <a href="TestListSavlet?page=<%=nowPage + 1%>"><%=">"%></a> <%
 	}
 %>
			</li>
			<li>
				<%
					if (nowPage == maxPage) {
				%> <a><%=">>"%></a> <%
 	} else {
 %> <a href="TestListSavlet?page=<%=maxPage%>"><%=">>"%></a> <%
 	}
 %>
			</li>
		</ul>
	</div>

	<form action="./TestInput">
		<input type="submit" value="新規登録">
	</form>

</body>
</html>