<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:formatDate var="today" value="${ now }" pattern="yyyy-MM-dd" />
<article>
	<table class="nonNameList">
		<tr class="nonNameListTh">
			<th class="nonNameNo">no</th>
			<th class="nonNameTitle">제목</th>
			<th class="nonNameTh">날짜</th>
			<th class="nonNameTh">조회</th>
			<th class="nonNameTh">좋아요</th>
			<th class="nonNameTh">싫어요</th>
		</tr>
		<c:if test="${not empty nonNameBoardList and searchOption }"> 
		<c:forEach var="n" items="${nonNameBoardList }" varStatus="status">
			<tr class="nonNameListTd">
				<td class="nonNameListCenterTd">${n.nonNameNo }</td>
				<td class="nonNameTd">
					<a href="nonNameDetail?nonNameNo=${n.nonNameNo}&pageNum=${currentPage}
						&type=${type}&keyword=${keyword}">
						${n.nonNameTitle}</a>
				</td>
				<td class="nonNameListCenterTd">					
					<fmt:formatDate var="regDate" value="${ n.nonNameDate }" pattern="yyyy-MM-dd" />
					<c:if test="${ today eq  regDate}">
						<fmt:formatDate value="${ n.nonNameDate }" pattern="hh:mm" />
					</c:if>
					<c:if test="${ not (today eq  regDate) }">
						<fmt:formatDate value="${ n.nonNameDate }" pattern="yyyy-MM-dd" />
					</c:if>								
				</td>
				<td class="nonNameListCenterTd">${n.nonNameReadCount }</td>
				<td class="nonNameListCenterTd">${n.nonNameThank}</td>
				<td class="nonNameListCenterTd">${n.nonNameBad}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" class="listPage">
				<c:if test="${startPage > pageGroup }">
					<a href="nonNameBoardList?pageNum=${startPage - pageGroup }&type=${type}&keyword=${keyword}">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i == currentPage }">
						[${i }]
					</c:if>
					<c:if test="${i != currentPage }">
						<a href="nonNameBoardList?pageNum=${i }&type=${type}&keyword=${keyword}">[${i }]</a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCount }">
					<a href="nonNameBoardList?pageNum=${startPage + pageGroup }&type=${type}&keyword=${keyword}">[다음]</a>
				</c:if>
			</td>
			<td colspan="5" class="nonNameWrite"><a href="nonNameWriteForm">글쓰기</a></td>
		</tr>
	</c:if>
	
	<c:if test="${not empty nonNameBoardList and not searchOption }"> 
		<c:forEach var="n" items="${nonNameBoardList }" varStatus="status">
			<tr class="nonNameListTd">
				<td class="nonNameListCenterTd">${n.nonNameNo }</td>
				<td class="nonNameTd">
					<a href="nonNameDetail?nonNameNo=${n.nonNameNo}&pageNum=${currentPage}">
						${n.nonNameTitle}</a>
				</td>
				<td class="nonNameListCenterTd">					
					<fmt:formatDate var="regDate" value="${ n.nonNameDate }" pattern="yyyy-MM-dd" />
					<c:if test="${ today eq  regDate}">
						<fmt:formatDate value="${ n.nonNameDate }" pattern="hh:mm" />
					</c:if>
					<c:if test="${ not (today eq  regDate) }">
						<fmt:formatDate value="${ n.nonNameDate }" pattern="yyyy-MM-dd" />
					</c:if>								
				</td>
				<td class="nonNameListCenterTd">${n.nonNameReadCount }</td>
				<td class="nonNameListCenterTd">${n.nonNameThank}</td>
				<td class="nonNameListCenterTd">${n.nonNameBad}</td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="6" class="listPage">
				<c:if test="${startPage > pageGroup }">
					<a href="nonNameBoardList?pageNum=${startPage - pageGroup }">[이전]</a>
				</c:if>
				<c:forEach var="i" begin="${startPage }" end="${endPage }">
					<c:if test="${i == currentPage }">
						[${i }]
					</c:if>
					<c:if test="${i != currentPage }">
						<a href="nonNameBoardList?pageNum=${i }">[${i }]</a>
					</c:if>
				</c:forEach>
				<c:if test="${endPage < pageCount }">
					<a href="nonNameBoardList?pageNum=${startPage + pageGroup }">[다음]</a>
				</c:if>
			</td>
			<td colspan="5" class="nonNameWrite"><a href="nonNameWriteForm">글쓰기</a></td>
		</tr>
	</c:if>
		
	<c:if test="${not searchOption and empty nonNameBoardList }"> 
		<tr>
			<td colspan="5">게시물이 존재하지 않습니다.</td>
		</tr>
		
		<tr>
			<td colspan="5" class="nonNameWrite"><a href="nonNameWriteForm">글쓰기</a></td>
		</tr>
	</c:if>
		
	<c:if test="${searchOption and empty nonNameBoardList }"> 
		<tr>
			<td colspan="5">"${keyword }"가 포함된 게시물이 존재하지 않습니다.</td>
		</tr>
		<tr>
			<td colspan="5" class="nonNameWrite"><a href="nonNameWriteForm">글쓰기</a></td>
		</tr>
	</c:if>
		<tr>
			<td colspan="7" class="searchFormTd">
				<form name="searchForm" id="searchForm">
					<select name="type" id="type">
						<option value="nonName_title">제목</option>
						<option value="nonName_content">내용</option>
					</select>
					<input type="text" placeholder="검색어를 입력하세요" name="keyword" id="keyword">
					<input type="submit" value="검색"/>
				</form>
			</td>
		</tr>
	</table>
</article>