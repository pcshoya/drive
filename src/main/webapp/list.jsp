<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<!-- JSP 페이지 설정: Java 사용, UTF-8 인코딩 지정 -->

<%@ page import="java.sql.*"%>
<!--    JDBC 관련 클래스 사용을 위한 import -->

<%@ include file="dbconnect.jsp"%>
<!-- DB 연결 정보가 담긴 JSP 파일 포함 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- HTML 문서 인코딩 설정 -->
<title>차량조회</title>
<!-- 브라우저 탭 제목 -->
</head>
<body>
	<jsp:include page="header.jsp"></jsp:include>
	<!-- header.jsp 파일을 현재 위치에 포함 -->
	<section>
		<!-- 본문 영역 시작 -->
		<h2>차량조회</h2>
		<!-- 제목 출력 -->

		<%
		try { /* 예외 처리를 위한 try 시작 */
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery(
			    "SELECT * FROM TBL_DRIVE"
			);
		%>

		<table border="1">
			<!-- 테이블 시작 (테두리 1) -->
			<tr>
				<th>주행일자</th>
				<th>차량번호</th>
				<th>출발km</th>
				<th>도착km</th>
				<th>부서코드</th>
				<th>주유금액</th>
			</tr>

			<%
			while (rs.next()) { /* 다음 데이터가 있을 때까지 반복 */
			%>

			<tr>
				<td><%=rs.getString("DRV_DATE")%></td>
				<td><%=rs.getString("CAR_NO")%></td>
				<td><%=rs.getString("DRV_START")%></td>
				<td><%=rs.getString("DRV_END")%></td>
				<td><%=rs.getString("DEPT_CODE")%></td>
				<td><%=rs.getString("DRV_MONEY")%></td>
			</tr>

			<%
			}
			rs.close(); // ResultSet 자원 해제
			stmt.close(); // PreparedStatement 자원 해제
			conn.close(); // DB 연결 종료

			} catch (Exception e) { // 예외 발생 시 처리
			e.printStackTrace(); // 콘솔에 에러 출력
			out.println("DB 조회 오류 : " + e.getMessage()); // 화면에 에러 메시지 출력
			}
			%>

		</table>
		<!-- 테이블 종료 -->
	</section>
	<!-- 본문 영역 종료 -->

	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer.jsp 파일 포함 -->

</body>
</html>