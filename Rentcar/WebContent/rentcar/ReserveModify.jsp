<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
</style>
</head>
<body>
<h2>ReserveModify.jsp 파일</h2>
<form action="reserveModifyProcess" method="post">
	<table>
		<tr>
			<td>지역</td>
			<td><input type="text" name="locations" value="${reserveModify.locations}"></td>
		</tr>
		<tr>
			<td>대여 날짜</td>
			<td><input type="date" name="starts" value="${reserveModify.starts}"></td>
		</tr>
		<tr>
			<td>대여 시작 시간</td>
			<td><input type="text" name="starttime" value="${reserveModify.starttime}"></td>
		</tr>
		<tr>
			<td>반납 날짜</td>
			<td><input type="date" name="ends" value="${reserveModify.ends}"></td>
		</tr>
		<tr>
			<td>반납 시간</td>
			<td><input type="text" name="endtime" value="${reserveModify.endtime}"></td>
		</tr>
		<tr>
			<td>차종</td>
			<td><input type="text" name="variety" value="${reserveModify.variety}"></td>
		</tr>
		<tr>
			<td>예약자 아이디</td>
			<td>${reserveModify.reid} ${sessionScope.loginid}</td>
		</tr>
		<tr>
			<td>보험</td>
			<td><input type="text" name="insurance" value="${reserveModify.insurance}"></td>
		</tr>
		<tr>
			<td>예약 번호</td>
			<td>${reserveModify.renum}
			<input type="hidden" name="renum" value="${reserveModify.renum}"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="예약 변경">
			<input type="reset" value="다시 작성"></td>
		</tr>
	</table>
</form>

</body>
</html>