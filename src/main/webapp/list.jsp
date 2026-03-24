<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconnect.jsp"%>

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
		try { /* 예외 처리를 위한 try 시작 */
			Statement stmt = conn.createStatement(); /* SQL 실행을 위한 객체 생성 */
			ResultSet rs = stmt.executeQuery(
					"SELECT TO_CHAR(TO_DATE(D.DRV_DATE, 'YYYYMMDD'), 'YYYY\"년\"MM\"월\"DD\"일\"') AS 주행일자, D.CAR_NO AS 차량번호, C.CAR_MODEL AS 모델, TO_CHAR(D.DRV_START, '999,999') AS 출발KM, TO_CHAR(D.DRV_END, '999,999') AS 도착KM, T.DEPT_NAME AS 부서명, TO_CHAR(D.DRV_MONEY, 'L999,999') AS 주유금액 "+
					"FROM TBL_DRIVE D "+
					"JOIN TBL_CAR C "+
				    "ON D.CAR_NO = C.CAR_NO "+
					"JOIN TBL_DEPT T "+
				    "ON D.DEPT_CODE = T.DEPT_CODE "+
					"ORDER BY D.DRV_DATE DESC, D.CAR_NO "
			);
		%>

		<table border="1">
			<tr>
				<th>주행일자</th>
				<th>차량번호</th>
				<th>모델</th>
				<th>출발km</th>
				<th>도착km</th>
				<th>부서명</th>
				<th>주유금액</th>
			</tr>

			<%
			while (rs.next()) { /* 다음 데이터가 있을 때까지 반복 */
			%>

			<tr>
				<td><%=rs.getString("주행일자")%></td>
				<td><%=rs.getString("차량번호")%></td>
				<td><%=rs.getString("모델")%></td>
				<td><%=rs.getString("출발km")%></td>
				<td><%=rs.getString("도착km")%></td>
				<td><%=rs.getString("부서명")%></td>
				<td><%=rs.getString("주유금액")%></td>
			</tr>

			<%
			}
			rs.close(); /* ResultSet 자원 해제 */
			stmt.close(); /* Statement 자원 해제 */
			conn.close(); /* DB 연결 종료 */

			} catch (Exception e) { /* 예외 발생 시 처리 */
			e.printStackTrace(); /* 콘솔에 에러 출력 */
			out.println("DB 조회 오류 : " + e.getMessage()); /* 화면에 에러 메시지 출력 */
			}
			%>

		</table>
	</section>
	<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>