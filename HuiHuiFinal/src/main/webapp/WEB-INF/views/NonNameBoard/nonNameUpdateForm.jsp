<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
<form name="nonNameUpdateForm" id="nonNameUpdateForm" method="post" action="nonNameUpdate">
	<input type="hidden" name="nonNameNo" id="no" value="${ nonNameBoard.nonNameNo }"/>
	<input type="hidden" name="empId" id="id" value="${ nonNameBoard.empId }"/>
<table class="nonUpdateDetail">
	<tr class="1234">
		<td class="nonUpdateTitleTd">
			<input type="text" name="nonNameTitle" id="nonNameTitleU" class="fw-bold"maxlength="15"
				value="${nonNameBoard.nonNameTitle }"/>
		</td>
	</tr>
	<tr>
		<td class="contentTextBox">
			<textarea name="nonNameContent" id="nonNameContent">
				${nonNameBoard.nonNameContent }
			</textarea>
		</td>
	</tr>
	<tr class="btn_nonUpdate">
		<td  colspan="2">
			<input type="submit" value="등록하기" class="nonNameUpdateBtn"/>
			<input type="button" value="목록보기" onclick="javascript:window.location.href='nonNameBoardList'"/>	
		</td>
	</tr>
</table>
</form>
</article>