<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconnect.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>부서별주행통계</title>
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<section>
		<h2>(부서별)주행통계</h2>
		<%
		Statement stmt = null;
		ResultSet rs = null;
		try { /* 예외 처리를 위한 try 시작 */
			stmt = conn.createStatement(); /* SQL 실행을 위한 객체 생성 */
			rs = stmt.executeQuery("SELECT D.DEPT_CODE, D.DEPT_NAME, SUM(C.DRV_END - C.DRV_START) AS A, TO_CHAR(SUM(C.DRV_MONEY),'L999,999') AS B "+
					"FROM TBL_DRIVE C "+
					"JOIN TBL_DEPT D "+   
					"ON C.DEPT_CODE = D.DEPT_CODE "+
					"GROUP BY D.DEPT_CODE, D.DEPT_NAME"); 
		%>
		<table border="1">
			<tr>
				<th>부서코드</th>
				<th>부서명</th>
				<th>총운행거리</th>
				<th>총주유금액</th>
			</tr>
		<%
			while (rs.next()) { /* 다음 데이터가 있을 때까지 반복 */
		%>			
			<tr>
				<td><%=rs.getString("DEPT_CODE")%></td>
				<td><%=rs.getString("DEPT_NAME")%></td>
				<td><%=rs.getString("A")%></td>
				<td><%=rs.getString("B")%></td>
			</tr>
		<%
			}
		} catch (Exception e) { // 예외 발생 시 처리
			e.printStackTrace(); // 콘솔에 에러 출력
			out.println("DB 조회 오류 : " + e.getMessage()); // 화면에 에러 메시지 출력
		}
			rs.close(); // ResultSet 자원 해제
			stmt.close(); // PreparedStatement 자원 해제
			conn.close(); // DB 연결 종료
		%>
		</table>
	</section>
</body>
</html>