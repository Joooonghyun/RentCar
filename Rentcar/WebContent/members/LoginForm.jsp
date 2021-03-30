<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table,tr,td{
    	border: 1px solid black;
        border-collapse: collapse;
    }
    fieldset{
		width: fit-content;
        margin: 10px;
	}
</style>
</head>
<script>
	function goMain() {
		location.href = "/Rentcar2/Main.jsp";
	}
	function membersLogin(){
	    loginForm.submit();
	}
	
</script>
<body>
	<h1>LoginForm.jsp</h1>
	
<form action="membersLogin" method="post" id="loginForm">
<table>
    <tr>
        <td>아이디</td>
        <td><input type="text" name="userid"></td>
    </tr>
    <tr>
        <td>비밀번호</td>
        <td><input type="password" name="userpw"></td>
    </tr>
</table>
</form><br/>
<button onclick="goMain()">메인으로</button>
<button onclick="membersLogin()">로그인</button>
</body>

</html>