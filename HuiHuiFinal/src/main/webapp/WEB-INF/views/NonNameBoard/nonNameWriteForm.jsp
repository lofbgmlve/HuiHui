<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<article>
<form name="nonNameWriteForm" id="nonNameWriteProcess" method="post" action="nonNameWriteProcess">
<input type="hidden" name="empId" id="empId" value="${sessionScope.id}"/>
<table class="nonDetail">
	<tr class="1234">
		<td class="nonNameBoardTitle">제목</td>
		<td>
			<input type="text" name="nonNameTitle" id="nonNameTitle" maxlength="15" placeholder="제목을 입력해주세요. "/ >
		</td>
	</tr>
	<tr>
		<td colspan="2" class="contentTextBox">
			<textarea name="nonNameContent" id="nonNameContent" placeholder="누군가를 비방하는 내용의 게시물을 올리면  관리자에 의해 게시물이  삭제될 수 있습니다. "></textarea>
		</td>
	</tr>
	
	<tr>
		<td class="ButtonW"  colspan="2">
			
			<input type="submit" value="등록하기" id="insertN"/>
			<input type="button" value="목록보기" id="lisetB" 
				onclick="javascript:window.location.href='nonNameBoardList'"/>
		</td>
	</tr>
</table>
</form>
</article>
</body>