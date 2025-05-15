<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>

<!-- genRegListFragment.jsp -->
<div class="sub-subject">
	<h2>검색 결과 (${countPrimaryGenReg})</h2>
</div>
<!-- 일반 돌봄 각 등록 건 -->
<!-- <form action="genregdetail.action" method="post" target="_blank"> -->
<!-- 
listPrimaryGenReg 
 R.GEN_REG_ID, R.NAME, R.TITLE, R.START_DATE, R.END_DATE, R.START_TIME, R.END_TIME, STATUS
 -->
<c:forEach var="genReg" items="${listPrimaryGenReg}">

<div class="box-preview">
    <div class="sitter-photo">
    	<%-- <c:set var="cp" value="${pageContext.request.contextPath}" /> --%>
        <img src="<%= cp %>/images/pictures/${genReg.photo_file_path}.jpg" alt="시터 사진">
    </div>
    <div class="sitter-info"> 
        <div class="sitter-title">
        	<span class="sitter-status">${genReg.status == "예약가능" ? "[예약가능]" : "" }</span>
         	&nbsp;${genReg.title }
        </div>
        <div class="sitter-details">
         	
            <div class="sitter-grade">
            	<span class="sitter-grade-img">
             		<img src="<%= cp %>/images/grades/${genReg.grade_file_path}.gif" 
    				 width="20" height="20" alt="시터 등급 이미지">
             	</span>
             	&nbsp;${genReg.grade} 시터 ${genReg.name}
            </div>
            <c:choose>
         	<c:when test="${restrict == 0}">
         		<div>최근 평점 ⭐${genReg.recent_avg_rating } (${genReg.recent_review_count }건)</div>
            	<div>전체 평점 ⭐${genReg.avg_rating } (${genReg.review_count }건)</div>
         	</c:when>
         	<c:otherwise>
         		<div>(⭐<a href="parentcaredone.action">돌봄 이용 리뷰 작성</a>&nbsp;이후 평점 열람 가능)</div>
         	</c:otherwise>
         	</c:choose>
         	<fmt:parseDate var="startDateParsed" value="${genReg.start_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:parseDate var="endDateParsed" value="${genReg.end_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<div>돌봄 등록 일자: 📆
				<fmt:formatDate value="${startDateParsed}" pattern="yyyy.MM.dd."/>
			~
			<fmt:formatDate value="${endDateParsed}" pattern="yyyy.MM.dd."/>
			</div>
           	
            <div>돌봄 등록 시간: ⏰
            <c:choose>
			<c:when test="${genReg.start_time < 12}">
				오전 ${genReg.start_time}시
			</c:when>
			<c:otherwise>
				오후 ${genReg.start_time == 12 ? 12 : genReg.start_time-12}시
			</c:otherwise>
			</c:choose>
			~
			<c:choose>
			<c:when test="${genReg.end_time < 12}">
				오전 ${genReg.end_time}시
			</c:when>
			<c:otherwise>
			    오후 ${genReg.end_time == 12 ? 12 : genReg.end_time-12}시
			</c:otherwise>
			</c:choose>
			</div>
			
			<div>
			<c:if test="${not empty genReg.certList}">
			<div>
				<c:forEach var="cert" items="${genReg.certList}">
					<span class="badge">${cert}</span>&nbsp;
				</c:forEach>
			</div>
			</c:if>
			</div>
			
       	</div>
           
        <div class="hidden sitter-gender-hidden">${genReg.gender }</div>
        <div class="hidden sitter-status-hidden">${genReg.status }</div>
        <div class="hidden sitter-age-hidden">${genReg.age }</div>
        <%-- <div class="hidden sitter-region-hidden">${genReg.regionlist }</div> --%>
        <button type="submit" class="btn gen-btn-small"
        onclick="openDetailWindow('${genReg.gen_reg_id}')">돌봄 신청</button>
     </div>
 </div>

</c:forEach>

<!-- </form> -->
<!-- 페이징 영역 -->
<div class="page">
<c:if test="${paging.totalPage >= 1}">
	<c:if test="${paging.startPage > 1}">
    <a href="javascript:void(0);" onclick="goToPage(${paging.startPage-1})">&lt;</a>
    <!-- <a href="javascript:void(0);>" → 폼 제출 방지 및 현상 유지 -->
	</c:if>

	<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
	    <c:choose>
	    	<c:when test="${p == paging.page}">
	        	<strong>${p}</strong>		<!-- 엘리먼트 강조 -->
	        </c:when>
	        <c:otherwise>
	        	<a href="javascript:void(0);" onclick="goToPage(${p})">${p}</a>
	        </c:otherwise>
	    </c:choose>
	</c:forEach>

	<c:if test="${paging.endPage < paging.totalPage}">
		<a href="javascript:void(0);" onclick="goToPage(${paging.endPage+1})">&gt;</a>
	</c:if>
</c:if>
</div>

<!-- 페이지 이동을 위한 hidden 폼 -->
<form id="pageForm" action="gensearchresult.action" method="post">
    <input type="hidden" name="child_backup_id" value="${childBackupId}">
	<input type="hidden" name="start_date" value="${dateStart}">
	<input type="hidden" name="end_date" value="${dateEnd}">
	<input type="hidden" name="start_time" value="${timeStart}">
	<input type="hidden" name="end_time" value="${timeEnd}">
    <input type="hidden" name="page" id="pageInput" value="1">
</form>