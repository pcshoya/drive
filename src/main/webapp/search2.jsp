<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="drive.Util" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별주행통계</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<%
Connection conn = Util.getConnection();
Statment stmt = conn.createStatement();
String sql = "select * from db";
%>



</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>