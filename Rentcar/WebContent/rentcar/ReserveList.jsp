<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	table, th, tr, td {
		border: 1px solid black;
		border-collapse: collapse;
		padding: 5px;
	}
	fieldset{
	 width: fit-content;
     margin: 10px;
	}
</style>
</head>
<body>
<h2>예약정보보기</h2>
<c:if test="${sessionScope.loginid != null }">
<fieldset>
${sessionScope.loginid}님 환영합니다.<br/>
<input type="button" onclick="location.href='/Rentcar2/members/membersLogout'" value="로그아웃">
</fieldset>
</c:if>
<table>
	<tr>
		<th>예약번호</th>
		<th>지역</th>
		<th>예약자</th>
		<th>대여 시작 날짜</th>
		<th>대여 시작 시간</th>
		<th>반납 날짜</th>
		<th>반납 시간</th>
		<th>차종</th>
		<th>보험</th>
	</tr>
	<c:forEach items="${reserveList}" var="reserve">
	<tr>
		<td><a href="reserveView?renum=${reserve.renum}">${reserve.renum}</a></td>
		<td>${reserve.locations}</td>
		<td>${reserve.reid}</td>
		<td>${reserve.starts}</td>
		<td>${reserve.starttime}</td>
		<td>${reserve.ends}</td>
		<td>${reserve.endtime}</td>
		<td>${reserve.variety}</td>
		<td>${reserve.insurance}</td>
	</tr>
	</c:forEach>
	<tr>
		<td colspan="9"><input type="button" onclick="goMain()" value="메인으로">
		<c:choose>
		<c:when test="${sessionScope.loginid != null }">
		<input type="button" onclick="location.href='/Rentcar2/rentcar/Reserve.jsp'" value="예약하기"></td>
		</c:when>
		<c:otherwise>
		<input type="button" onclick="location.href='/Rentcar2/members/LoginForm.jsp'" value="로그인"></td>
		</c:otherwise>
		</c:choose>
	</tr>
</table>
</body>
<script>
function goMain(){
	location.href="/Rentcar2/Main.jsp";
}
</script>
</html>