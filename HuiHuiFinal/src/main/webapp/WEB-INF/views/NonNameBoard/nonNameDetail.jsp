<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:formatDate var="today" value="${ now }" pattern="yyyy-MM-dd" />
<script src="resources/js/nonNameAjax.js"></script>
<article>
<form name="checkForm" id="checkForm">
   <input type="hidden" name="no" id="no" value="${ nonNameBoard.nonNameNo }"/>
   <input type="hidden" name="pageNum" value="${pageNum }"/>
</form>
<c:if test="${searchOption }">
   <input type="hidden" name="type" value="${type }"/>
   <input type="hidden" name="keyword" value="${keyword }"/>
</c:if>

<table class="nonDetail">
   <tr class="nonTitle fw-bold">
      <td colspan="3">${nonNameBoard.nonNameTitle }</td>
   </tr>
   <tr class="nonSubTitle">
      <td class="nonDetailEmp">익명의 사원</td>
      <td class="nonDetailTd">
         <fmt:formatDate value="${nonNameBoard.nonNameDate }" var="regDate" pattern="yyyy-MM-dd"/>
            <c:if test="${today == regDate }">
               <fmt:formatDate value="${nonNameBoard.nonNameDate }" pattern="hh:mm"/>
            </c:if>
            <c:if test="${today != regDate }">
               <fmt:formatDate value="${nonNameBoard.nonNameDate }" pattern="yyyy-MM-dd"/>
            </c:if>
      </td>
      <td class="nonDetailTd">조회수 : ${nonNameBoard.nonNameReadCount }</td>
   </tr>
   <tr id="nonDetailContent">
      <td colspan="3">${nonNameBoard.nonNameContent }</td>
   </tr>
   <tr class="nonContent" id="recommend">
      <td class="nonNameGood" colspan="1">
         <button type="button" class="btn btn-primary nonRecommend" id="nonNameThank" name="nonNameThank">
            좋아요 ${nonNameBoard.nonNameThank }</button>
      </td>
      <td class="nonNameBad" colspan="2">
      <button type="button" class="btn btn-danger nonRecommend" id="nonNameBad" name="nonNameBad">
         싫어요 ${nonNameBoard.nonNameBad }</button>
      </td>
   </tr>
   <tr>
   	<td>&nbsp</td>
   </tr>
   <tr>
      <td id="nonNameUpdateButton1">
         <c:if test="${sessionScope.id  == nonNameBoard.empId}">
            <form action="update">
               <button type="submit" id="nonDetailBtnUpdate">수정</button>
               <input type="hidden" name="nonNameNo" value="${nonNameBoard.nonNameNo }">
            </form>
         </c:if>
      </td>
      <td id="nonNameUpdateButton2">
         <c:if test="${sessionScope.id == nonNameBoard.empId}">
            <form action="delete">
               <button>삭제</button>
               <input type="hidden" name="nonNameNo" value="${nonNameBoard.nonNameNo }">
            </form>
         </c:if>
      </td>
     </tr>
     <tr>
      <td id="nonDetailListButton" colspan="4">
         <c:if test="${searchOption}">
            <a href="javascript:window.location.href='nonNameBoardList?
               pageNum=${pageNum}&type=${type }&keyword=${keyword }'">
               <button id="nonDetailBtnList">목록보기</button></a>
         </c:if>
         <c:if test="${not searchOption}">
            <a href="javascript:window.location.href='nonNameBoardList?
               pageNum=${pageNum}'">
               <button id="nonDetailBtnList">목록보기</button></a>
         </c:if>
      </td>
   </tr>
</table>
</article>