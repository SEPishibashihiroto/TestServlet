<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="common.*" import="java.sql.*"%>
<%
	ResultSet rs = (ResultSet) request.getAttribute("rs");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table>
		<%
			while (rs.next()) {
		%>
		<tr>
			<td><%=rs.getString("transit_name")%></td>
			<td><%=rs.getString("from_st")%></td>
			<td><%=rs.getString("to_st")%></td>
			<td><%=rs.getInt("price")%></td>
		</tr>
		<%
			}
		%>

	</table>
</body>
</html>