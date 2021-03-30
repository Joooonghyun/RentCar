<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table,tr,td{
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	}
</style>
</head>
<body>
<h2>Reserve.jsp 파일</h2>
<form action="reserve" method="post">
	<table>
		<tr>
			<td>예약자 아이디</td>
			<td><input type="hidden" name="reid" value="${sessionScope.loginid }">
			${sessionScope.loginid}</td>
		</tr>
		<tr>
			<td>지역</td>
			<td><input type="text" name="locations"></td>
		</tr>
		<tr>
			<td>대여 날짜</td>
			<td><input type="date" name="starts"></td>
		</tr>
		<tr>
			<td>대여 시작 시간</td>
			<td><input type="text" name="starttime"></td>
		</tr>
		<tr>
			<td>반납 날짜</td>
			<td><input type="date" name="ends"></td>
		</tr>
		<tr>
			<td>반납 시간</td>
			<td><input type="text" name="endtime"></td>
		</tr>
		<tr>
			<td>차종</td>
			<td><input type="text" name="variety"></td>
		</tr>
		<tr>
			<td>보험</td>
			<td><input type="text" name="insurance"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="submit" value="예약 결정">
			<input type="reset" value="다시 작성">
			<input type="button" onclick="location.href='/Rentcar2/Main.jsp'" value="메인으로">
			<input type="button" onclick="location.href='/Rentcar2/rentcar/myReserve'" value="예약정보보기"></td>
		</tr>
	</table>
</form>

</body>
</html>