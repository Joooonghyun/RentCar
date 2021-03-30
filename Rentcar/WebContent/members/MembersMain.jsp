<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberMain.jsp</title>
<style>
	fieldset{
		width: fit-content;
        margin: 10px;
	}
</style>
</head>
<body> 
 <h2>MemberMain.jsp</h2>
  <fieldset>
   
    <legend>${sessionScope.loginid}님 환영합니다.</legend>
     
    <button onclick="goMain()">메인으로</button>
    <c:if test ="${sessionScope.loginid != null}">
    <button onclick="membersModify()">회원수정</button>
    <button onclick="membersLogout()">로그아웃</button>
    <button onclick="location.href='/Rentcar2/rentcar/myReserve'">예약정보보기</button>
    <button onclick="location.href='/Rentcar2/rentcar/Reserve.jsp'">예약하기</button>
    <button onclick="membersDelete()">회원탈퇴</button>
    
    </c:if>
  </fieldset>
</body>
<script>
   function goMain() {
	 location.href = "/Rentcar2/Main.jsp";
   }
   function membersModify(){
      location.href="membersModify";
   }
   function membersLogout(){
      location.href="membersLogout";
   }
   function membersDelete(){
	   var passConfirm = prompt('비밀번호를 입력하세요');
	   var password = ${sessionScope.loginpw};
	   if(passConfirm == password){
		   location.href='membersDelete?loginid=${sessionScope.loginid}';
	   } else{
		   alert('비밀번호가 틀립니다.');
	   }
   }
   
</script>
</html>