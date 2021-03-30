<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, tr, td {
	border: 1px solid black;
	border-collapse: collapse;
}

fieldset {
	width: fit-content;
	margin: 10px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"
	integrity="sha512-bLT0Qm9VnAYZDflyKcBaQ2gg0hSYNQrJ8RilYldYQ1FxQYoCLtUjuuRuZo+fjqhx/qtq/1itJ0C2ejDxltZVFg=="
	crossorigin="anonymous"></script>
<script>

	$(document).ready(function () {
		$("#userid").keyup(function () {
		idCheck();
		});

		$("#userpw").keyup(function () {
		pwCheck();
		});
	});
	       
	function idCheck() {
		var id = $("#userid").val();
		console.log("id:" + id);
		console.log("idLength:" + id.length);
		if (id.length == 0) {
			$("#confirmid").css("color", "red").text("아이디는 필수입니다.");
		} else if (id.length < 4 || id.length > 10) {
			$("#confirmid").css("color", "red").text("아이디의 길이가 맞지 않습니다.");
		} else if (id.length >= 4 && id.length <= 10) {
			 var idCheck = $("#userid").val();
		     $.ajax({
		     	type : "get",
		        url : "checkId",
		        data : {"uid" : idCheck},
		        success : function(data) {
		        	console.log("data:" + data);
		            if ( data == "OK") {
		            	$("#confirmid").css("color", "green").text("사용 가능");
                    }else{
		                $("#confirmid").css("color","red").text("이미 사용되고 있는 아이디 입니다.")                      
		            }
		        },
		        error:function(){
		        	}
		     })
			
		}
	}
	
	function pwCheck() {
		var pw = $("#userpw").val();
		console.log("pw:" + pw);
		console.log("pwLength:" + pw.length);
		if (pw.length == 0) {
			$("#confirmpw").css("color", "red").text("비밀번호는 필수입니다.");
		} else if (pw.length < 8 || pw.length > 16) {
			$("#confirmpw").css("color", "red").text("비밀번호의 길이가 맞지 않습니다.");
		} else if (pw.length >= 8 && pw.length <= 16) {
			$("#confirmpw").css("color", "green").text("사용 가능");
		}
	}
	
</script>


</head>
<body>
	<h1>JoinForm.jsp</h1>
	
	<h1>회원가입</h1>
	<form action="membersJoin" method="POST">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="userid" id="userid" placeholder="4~10자리"><br>
					<span id="confirmid"></span></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="userpw" id="userpw" placeholder="8~16자리"><br>
				<span id="confirmpw"></span></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="username"></td>
			</tr>
			<tr>
				<td>생년월일</td>
				<td><input type="date" name="userbirth"></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="userpnum"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="회원가입"> 
				<input type="reset" value="다시작성">
				<input type="button" onclick="goMain()" value="메인으로">
				<input type="button" onclick="membersLogin()" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</body>
<script>
	function goMain() {
		location.href = "/Rentcar2/Main.jsp";
	}
	function membersLogin() {
		location.href = "/Rentcar2/members/LoginForm.jsp";
	}
</script>
</html>