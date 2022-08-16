<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<article>
<table class="listTable1">
	<tr>
		<th class="listHead" colspan="5"> 1001번 사원의 출퇴근 내역입니다.</th>
	</tr>
	<tr>
		<th class="listTh">날짜</th>
		<th class="listTh">출근 시간</th>
		<th class="listTh">퇴근 시간</th>
	</tr>
	<c:forEach var="a" items="${ aList }" varStatus="status">		
	<tr class="listTr">
		<td class="listTd">
			<fmt:parseDate pattern="yyyy-MM-dd" value="${ a.attend }" var="dateValue"/>
			<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd"/>
		</td>
		<td class="listTd">
			<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss" value="${ a.attend }" var="attendValue"/>
			<fmt:formatDate value="${attendValue}" pattern="HH:mm:ss"/>
		</td>
		<td class="listTd">
			<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss" value="${ a.leaved }" var="leavedValue"/>
			<fmt:formatDate value="${leavedValue}" pattern="HH:mm:ss"/>
		</td>
	</tr>
	</c:forEach>
	
</table>
</article>