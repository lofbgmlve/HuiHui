<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 폼</title>
<style>
	#empJoinForm {
		margin: 10px auto;
		width: 600px;
	}
	#joinFormTitle {
		width: 590px;
		margin: 0 auto;
		height: 50px;
		line-height: 50px;
		font-size: 1.2em;
		text-align: center;
	}
	#empInputDefault{
		margin: 5px auto;
		padding: 10px;
		width: 588px;
		background: #EBF3F9;
		border: 1px solid #3A96D6;
		border-radius: 5px;
	}
	#empInputOption {
		margin: 5px auto;
		padding: 10px;
		width: 588px;
		border: 2px dotted #3A96D6;
		background: #EBF3F9;
		border-radius: 5px;
	}
	.empInputText {
		height: 30px;
		line-height: 30px;
	}
	.empSpan {
		display: inline-block;
		width: 120px;
		text-align: right;
		margin-right: 10px;
	}
	.formButton {
		margin-top: 15px;
		text-align: center;
	}
	.address {
		width: 255px;
		padding-left: 5px;
	}
	.btn {
		width: 35px;
	}
</style>
<script src="resources/js/jquery-3.2.1.min.js"></script>
<script src="resources/js/emp.js"></script>
</head>
<body>
	<div id="empJoinForm">
	<h2 id="joinFormTitle">사원 정보 입력</h2>
	<form action="joinResult" name="joinForm" method="post" id="joinForm">
		<div id="empInputDefault">
			<div class="empInputText">
				<span class="empSpan">사원번호 : </span>
				<input type="text" name="employeeId" size="15" id="employeeId" />
			</div>
			<div class="memberInputText">
				<span class="empSpan">이&nbsp;&nbsp;름 : </span>
				<input type="text" name="eName" size="15" id="eName" />
			</div>
			<div class="empInputText">
				<span class="empSpan"> 비밀번호 : </span>
				<input type="password" name="pass" id="pass" size="15"/>
			</div>
			<div class="empInputText">
				<span class="empSpan">주&nbsp;&nbsp;소 : </span>
				<input type="text" name="address1" size="50" id="address1" />
			</div>
			<div class="empInputText">
				<span class="empSpan">상세주소 : </span>
				<input type="text" name="address2" size="50" id="address2" />
			</div>
			<div class="empInputText">
				<span class="empSpan">부&nbsp;서&nbsp;명 : </span>
				<select name="dName" id="dName">
					<option>인사팀</option>
					<option>경영팀</option>
					<option>개발팀</option>
					<option>디자인팀</option>
					<option>영업팀</option>
				</select>
			</div>
			<div class="empInputText">
				<span class="empSpan">부서번호 : </span>
				<select name="deptNo" id="deptNo">
					<option>100</option>
					<option>101</option>
					<option>102</option>
					<option>103</option>
					<option>104</option>
				</select>
			</div>
			<div class="empInputText">
				<span class="empSpan">직&nbsp;&nbsp;급 : </span>
				<select name="position" id="position">
					<option>부장</option>
					<option>차장</option>
					<option>과장</option>
					<option>대리</option>
					<option>주임</option>
					<option>사원</option>
				</select>
			</div>
			<div class="empInputText">
				<span class="empSpan"> 휴 대 폰 : </span>
				<select name="mobile1" id="mobile1">
					<option>010</option>
					<option>011</option>
					<option>016</option>
					<option>017</option>
					<option>018</option>
					<option>019</option>
				</select>-
				<input type="text" name="mobile2" size="3" maxlength="4" id="mobile2"/>-
				<input type="text" name="mobile3" size="3" maxlength="4" id="mobile3"/>
			</div>
		</div>
		<div class="formButton">
			<input type="submit" value="가입하기" />
		</div>
	</form>
	</div>
</body>
</html>