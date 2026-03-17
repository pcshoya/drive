<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량조회</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2>차량조회</h2>
<%
/* 자바 DB 연동 프로그램 */
	Class.forName("oracle.jdbc.OracleDriver");	//db_connect.jsp 에서 제공
	Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234"); // db_connect.jsp에서 제공
	Statement stmt = con.createStatement();
	ResultSet rs = stmt.executeQuery("select * from tbl_car order by CAR_NO");
%>
<table border="1">
<tr>
    <th>차량번호</th>
    <th>모델</th>
    <th>제조사</th>
    <th>구매일</th>
</tr>
<%
	while(rs.next()){
%>
<tr>
    <td><%=rs.getString("CAR_NO")%></td>
    <td><%=rs.getString("CAR_MODEL")%></td>
    <td><%=rs.getString("CAR_COMPANY")%></td>
    <td><%=rs.getString("CAR_DATE")%></td>
</tr>
<%
}
rs.close();
stmt.close();
con.close();
%>
</table>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>
