<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 5px;
}
</style>
</head>
<body>
<h2>예약 정보</h2>
<table>
		<tr>
			<td>예약번호</td>
			<td>${reserveView.renum}</td>
		</tr>
		<tr>
			<td>예약자 아이디</td>
			<td>${sessionScope.loginid}</td>
		</tr>
		<tr>
			<td>지역</td>
			<td>${reserveView.locations}</td>
		</tr>
		<tr>
			<td>대여 날짜</td>
			<td>${reserveView.starts}</td>
		</tr>
		<tr>
			<td>대여 시작 시간</td>
			<td>${reserveView.starttime}</td>
		</tr>
		<tr>
			<td>반납 날짜</td>
			<td>${reserveView.ends}</td>
		</tr>
		<tr>
			<td>반납 시간</td>
			<td>${reserveView.endtime}</td>
		</tr>
		<tr>
			<td>차종</td>
			<td>${reserveView.variety}</td>
		</tr>
		<tr>
			<td>보험</td>
			<td>${reserveView.insurance}</td>
		</tr>
		<tr>
			<td colspan="2"><input type="button" onclick="goMain()" value="메인으로">
			<input type="button" onclick="reserveModify()" value="예약 수정">
			<input type="button" onclick="location.href='/Rentcar2/rentcar/myReserve'" value="예약정보보기">
			<input type="button" onclick="reserveDelete()" value="예약 취소">
			</td>
		</tr>
	</table>
</body>
<script>
function goMain(){
	location.href="/Rentcar2/Main.jsp";
}
function reserveModify(){
	location.href="reserveModify?renum=${reserveView.renum}";
}
function reserveDelete(){
	var passConfirm = prompt('비밀번호를 입력하세요');
	var password = ${sessionScope.loginpw};
	if(passConfirm == password){
		location.href='cancelReserve?renum=${reserveView.renum}';
	} else{
		alert('비밀번호가 틀립니다.');
	}
}
</script>
</html>