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
			Statement stmt = conn.createStatement(); /* SQL 실행을 위한 객체 생성 */
			ResultSet rs = stmt.executeQuery("select * from tbl_car order by car_n"); /* SQL 실행 후 결과를 ResultSet으로 반환 (※ 여기서는 sql 인자 없이 executeQuery()가 더 적절) */
		%>

		<table border="1">
			<!-- 테이블 시작 (테두리 1) -->
			<tr>
				<th>차량번호</th>
				<!-- 테이블 헤더: 차량번호 -->
				<th>모델</th>
				<!-- 테이블 헤더: 모델 -->
				<th>제조사</th>
				<!-- 테이블 헤더: 제조사 -->
				<th>구매일</th>
				<!-- 테이블 헤더: 구매일 -->
			</tr>

			<%
			while (rs.next()) { /* 다음 데이터가 있을 때까지 반복 */
			%>

			<tr>
				<td><%=rs.getString("CAR_NO")%></td>
				<!-- 차량번호 출력 -->
				<td><%=rs.getString("CAR_MODEL")%></td>
				<!-- 차량 모델 출력 -->
				<td><%=rs.getString("CAR_COMPANY")%></td>
				<!-- 제조사 출력 -->
				<td><%=rs.getString("CAR_DATE")%></td>
				<!-- 구매일 출력 -->
			</tr>

			<%
			}
			rs.close(); // ResultSet 자원 해제
			stmt.close(); // PreparedStatement 자원 해제
			conn.close(); // DB 연결 종료
			%>

		</table>
		<!-- 테이블 종료 -->
	</section>
	<!-- 본문 영역 종료 -->

	<jsp:include page="footer.jsp"></jsp:include>
	<!-- footer.jsp 파일 포함 -->

</body>
</html>