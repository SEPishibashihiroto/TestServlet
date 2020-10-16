<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	int nowPage = (int) request.getAttribute("page");
	int maxPage = 10;
	int start = 0;
	int end = 0;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./css/page.css">
<title>Insert title here</title>
</head>
<body>
	<h1>
		now =
		<%=nowPage%></h1>

	<div class="paging">
		<ul>
			<li>
				<% if (nowPage == 1) { %>
					<a><%="<<"%></a>
				<% } else { %>
					<a href="TestPeajing?page=1"><%="<<"%></a>
				<% } %>
			</li>
			<li>
				<% if (nowPage == 1) { %>
				<a><%="<"%></a>
				<% } else { %> <a href="TestPeajing?page=<%=nowPage - 1%>"><%="<"%></a>
				<% } %>
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
				<% if (nowPage == i) { %>
					<a><%=i%></a>
				<% } else { %>
					<a href="TestPeajing?page=<%=i%>"><%=i%></a>
				<% } %>
			</li>
			<%
				}
			%>
			<li>
				<% if (nowPage == maxPage) { %>
					<a><%=">"%></a>
				<% } else { %>
					<a href="TestPeajing?page=<%=nowPage + 1%>"><%=">"%></a>
					<% } %>
			</li>
			<li>
				<% if (nowPage == maxPage) { %>
					<a><%=">>"%></a>
				<% } else { %>
					<a href="TestPeajing?page=<%=maxPage%>"><%=">>"%></a>
				<% }  %>
			</li>
		</ul>
	</div>

</body>
</html>