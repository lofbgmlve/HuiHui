<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

#loginForm {
   border:2px solid black;
   border-radius:20px;
   text-align:center;
   width:1000px;
   height:700px;
   margin:auto;
   margin-top:120px;
   margin-reft:-100px;
   box-shadow: 0 0 20px rgba(0, 0, 0, 0.5);
}

input#employeeId{
   width:150px;
   height:25px;
}
input#userPass{
   width:150px;
   height:25px;
}

input#btnLogin {
   border:1px solid black;
   background-color:black;
   color:white;
   border-radius:2px;
   width:150px;
   height:30px;
}

input#btnJoin {
   border:1px solid white;
   background-color:black;
   color:white;
   width:150px;
   height:30px;
}
 
</style>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/emp.js"></script>
</body>
	<form id="loginForm" action="login" method="post">
		<h2><img src="resources/img/HuiHuiLogo.png" width="350px" height="350px" /></h2>
			<div id="login">
				<p>
					<label for="userId" class="labelStyle"></label>
					<input type="text" id="employeeId" name="employeeId" placeholder="사원번호" />
				</p>
				<p>
					<label for="userPass" class="labelStyle"></label>
					<input type="password" id="userPass" name="pass" placeholder="비밀번호"/>
				</p>
			</div>
			<p class="btn1">
				<input type="submit" value="로그인" id="btnLogin" />
			</p>
			<p class="join1">
				<input type="button" value="회원가입" id="btnJoin" onclick="location.href='joinForm'" />
			</p>
	</form>
</body>
</html>