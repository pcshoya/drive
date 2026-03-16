<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주행내역등록</title>
</head>
<body>
<script src="java.js"></script>
<jsp:include page="header.jsp"></jsp:include>
<section>
<h2 align="center">주행내역등록</h2>
<form name="frm" onsubmit="return checkValue()">
<table border="1">

<tr>
    <td width="120" class="td-center">주행일자</td>
    <td width="150">
        <input type="text" name="drv_date">
    </td>
    <td>2023년01월01일 예)20230101</td>
</tr>

<tr>
    <td class="td-center">차량번호</td>
    <td>
        <input type="text" name="car_no">
    </td>
    <td>예)10가0001</td>
</tr>

<tr>
    <td class="td-center">출발Km</td>
    <td>
        <input type="text" name="drv_start">
    </td>
    <td>km</td>
</tr>

<tr>
    <td class="td-center">도착Km</td>
    <td>
        <input type="text" name="drv_end">
    </td>
    <td>km</td>
</tr>

<tr>
    <td class="td-center">부서코드</td>
    <td colspan="2">
        <select name="dept_code">
            <option>[10]영업부</option>
            <option>[20]총무부</option>
            <option>[30]구매부</option>
            <option>[40]개발부</option>
        </select>
    </td>
</tr>

<tr>
    <td class="td-center">주유금액</td>
    <td>
        <input type="text" name="drv_money">
    </td>
    <td>원</td>
</tr>

<tr>
    <td colspan="3" class="td-center">
        <input type="submit" value="주행내역등록">
        <input type="reset" value="다시쓰기">
    </td>
</tr>
</table>
</form>
</section>
<jsp:include page="footer.jsp"></jsp:include>
</body>
</html>