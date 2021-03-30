<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>       
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   table,tr,td,th{
       border:1px solid black;
         border-collapse: collapse;
   }
</style>
</head>
<body>
<h1>MemberModify.jsp</h1>
<form action="modifyProcess" method="POST" id="modifyForm">
<table>
   <tr>
      <th>아이디</th>
      <td><input type="hidden" value="${membersInfo.userid }" name="userid">${membersInfo.userid }</td>
   </tr>
   <tr>
      <th>현재 비밀번호</th>
      <td><input type="text" id="upw" required></td>
   </tr>
   <tr>
      <th>새 비밀번호</th>
      <td><input type="text" name="userpw" required></td>
   </tr>
   <tr>
      <th>이름</th>
      <td><input type="text" name="username" value="${membersInfo.username }"></td>
   </tr>
   <tr>
      <th>생년월일</th>
      <td><input type="date" name="userbirth" value="${membersInfo.userbirth }"></td>
   </tr>
   <tr>
      <th>전화번호</th>
      <td><input type="text" name="userpnum" value="${membersInfo.userpnum }"></td>
   </tr>
</table>

  <br>
  </form>
  <button onclick="membersModify()">정보수정</button>
  <button onclick="goMain()">메인으로</button>
</body>
<script>
   function membersModify(){
      var passwordConfirm = document.getElementById("upw").value;
      var password = '${membersInfo.userpw}';
      if(passwordConfirm == password){
         modifyForm.submit();
      } else {
         alert('비밀번호가 틀립니다.')
      }
   }
   function goMain(){
      location.href="/Rentcar2/Main.jsp"
   }
</script>
</html>