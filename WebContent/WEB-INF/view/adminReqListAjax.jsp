<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>

<!-- 리스트 내용만 뿌리기 -->
<c:forEach var="list" items="${list}" varStatus="status">
    <div class="info-row">
        <div class="info-cell">${paging.startNum - status.index}</div>
        <div class="info-cell">${list.par_name}</div>
        <div class="info-cell">${list.gen_req_id}</div>
        <div class="info-cell">${list.gen_reg_id}</div>
        <div class="info-cell">${fn:substring(list.req_date, 0, 10)}</div>
        <div class="info-cell">
        	<%-- 
            <c:choose>
                <c:when test="${list.status eq 'request'}">예약 신청</c:when>
                <c:when test="${list.status eq 'confirmed'}">예약 확정</c:when>
                <c:when test="${list.status eq 'completed'}">예약 완료</c:when>
                <c:when test="${list.status eq 'canceled'}">예약 취소</c:when>
                <c:otherwise>-</c:otherwise>
            </c:choose>
            --%>
            ${list.status}
        </div>
        <%-- <div class="info-cell">${fn:substring(list.req_date, 0, 10)}</div> --%>
        <div class="info-cell">
            <div class="action-buttons">
                <button type="button" class="btn detail-btn"
                    onclick="location.href='<%=cp%>/admingenreqdetail.action?gen_req_id=${list.gen_req_id}&careType=normal'">상세보기</button>
            </div>
        </div>
        <div class="info-cell">
            <div class="action-buttons">
                <button type="button" class="btn delete-btn">삭제</button>
            </div>
        </div>
    </div>
</c:forEach>

<div class="page">
    <c:if test="${paging.startPage > 1}">
        <a href="javascript:void(0);" onclick="loadList(${paging.startPage - 1});">&lt;</a>
    </c:if>

    <c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
        <c:choose>
            <c:when test="${p == paging.page}">
                <strong>${p}</strong>
            </c:when>
            <c:otherwise>
                <a href="javascript:void(0);" onclick="loadList(${p});">${p}</a>
            </c:otherwise>
        </c:choose>
    </c:forEach>

    <c:if test="${paging.endPage < paging.totalPage}">
        <a href="javascript:void(0);" onclick="loadList(${paging.endPage + 1});">&gt;</a>
    </c:if>
</div>