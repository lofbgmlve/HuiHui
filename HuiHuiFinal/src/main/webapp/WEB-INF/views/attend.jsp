<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Lato&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Cormorant+Garamond:wght@500&display=swap" rel="stylesheet">

<style>
$primary-color: #333;
$secondary-color: #fff;

body {
  text-align: center; 
  font-family: 'Montserrat', sans-serif;
  background-color: #FFEB3B;
  height: 100vh;
  padding-top: 25vh;
}

.button {
  display: inline-block;
  margin: 0 10px 20px; 
  background-color: $primary-color;
  color: $secondary-color;
  text-transform: uppercase;
  font-size: 22px;
  text-decoration: none;
  padding: 15px 40px;
  position: relative;
  overflow: hidden;
  &:before {
    content: '';
    display: block;
    position: absolute;
    background-color: $secondary-color;
   
  }
  span {
    position: relative;
    z-index: 1;
  }
}

.btn1 {  
  transition: background 0.15s, color 0.25s;
  &:before {
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    transform-origin: center top; //this is the magic
    transform: scale(1, 0) translateZ(0);
    transition: all 0.25s ease-out;
  }
  &:hover {
    color: $primary-color;
    &:before { transform: scale(1) translateZ(0); }
  }
}

</style>
</head>
<article>
<table class="listTable" style="border-radius:20px;" >
	<tr>
		<th class="attendTitle" colspan="5">
			<img src="resources/img/HuiHuiLogo.png" width="150px" height="150px" />
		</th>
	</tr>
	<tr>
		<td class="attendTh" colspan="5">사번 &nbsp;&nbsp;: &nbsp;&nbsp; 1001<br/>
			  이름&nbsp;&nbsp;: &nbsp;&nbsp;${ sessionScope.emp.eName }
		</td>
	</tr>
	<tr class="attendTr">
		<td class="attendBtn">
			<form action="attendForm">
				<input type="hidden" value=${ sessionScope.emp.employeeId } id="employeeId">
				<input type="submit" class="button reverse dark" style="color:white; background-color:#1E90FF; border-radius:10px; border:1px solid #1E90FF;" value="출근">
			</form>
		</td>
		<td class="attendBtn">
			<form action="leaveForm">
				<input type="submit" class="button reverse dark" style="color:white; background-color:#1E90FF; border-radius:10px; border:1px solid #1E90FF;" value="퇴근">
			</form>
		</td>
		<td class="attendBtn">
			<input type="button" value="조회" style="color:white; background-color:#1E90FF; border-radius:10px; border:1px solid #1E90FF;" class="button reverse dark" onclick="location.href='attendList'"/>
		</td>
	</tr>
</table>
	<c:forEach var="commutes" items="${commutes}">
		<c:if test="${!empty commutes}">
			<input type="hidden" class="event" value="${commutes.getAttend()}">
		</c:if>
	</c:forEach>

	<c:forEach var="comm" items="${comm}">
		<c:if test="${!empty comm}">
			<input type="hidden" class="event" value="${comm.getAttend()}">
		</c:if>
	</c:forEach>
<!-- </table> -->
</article>