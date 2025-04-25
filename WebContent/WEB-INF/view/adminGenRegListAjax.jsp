<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

	<!-- 리스트 내용만 뿌리기 -->
	<c:forEach var="genRegList" items="${genRegList }"
		varStatus="status">
		<div class="info-row">
			<div class="info-cell">${paging.startNum - status.index}</div>
			<div class="info-cell">${genRegList.name }</div>
			<div class="info-cell">${genRegList.gen_reg_id }</div>
			<div class="info-cell">${fn:substring(genRegList.start_date, 0, 10) }</div>
			<div class="info-cell">${fn:substring(genRegList.end_date, 0, 10) }</div>
			<c:set var="startTime" value="${genRegList.start_time}" />
			<c:set var="endTime" value="${genRegList.end_time}" />
			<div class="info-cell">${startTime lt 10 ? '0' : ''}${startTime}:00</div>
			<div class="info-cell">${endTime lt 10 ? '0' : ''}${endTime}:00</div>
			<div class="info-cell">${fn:substring(genRegList.reg_date, 0, 10)}</div>
			<div class="info-cell">
				<div class="action-buttons">
					<button type="button" class="btn detail-btn"
						onclick="location.href='<%=cp%>/admingenregdetail.action?gen_reg_id=${genRegList.gen_reg_id}&sit_reg_id=${genRegList.sit_reg_id }'">상세보기</button>
				</div>
			</div>
			<div class="info-cell">
				<div class="action-buttons">
					<button type="button" class="btn delete-btn">삭제</button>
				</div>
			</div>
		</div>
	</c:forEach>

<!-- 페이징 영역 -->
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
