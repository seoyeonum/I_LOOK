<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>genRegDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/gen-filter.css">
<script type="text/javascript">

    // 페이지 로드 완료 후 실행
    document.addEventListener('DOMContentLoaded', function()
    {
        // Case 1. 팝업 닫기 버튼 → 창 닫기
        document.getElementById('back').addEventListener('click', function()
        {
            // 창 닫기
            window.close();
        });
        
        // Case 2. 돌봄 신청 버튼 → 기존 페이지에서 새 페이지 열기
        document.getElementById('gen-request').addEventListener('click', function()
        {
            // 부모 창을 genReqInsertForm.jsp로 이동
            // opener: 현재 창을 연 부모창
            // location: 이동할 URL
            // href: ...로 이동
            window.opener.location.href = 'gereqinsertform.action?genRegId=${genRegId}';
            
            // 현재 창 닫기
            window.close();
        });
    });
</script>
</head>
<body>

<!-- parentMainFrame.html을 삽입할 위치 -->
<!-- <div id="header-container"></div> -->
<!-- 새 창으로 펼쳐질 예정이라 헤더 존재 X -->

<div id="body-container">
	<!-- 일반 돌봄 등록 건 상세 -->
    <div class="gen-results-detail">
    	<div class="sub-subject">
        	<h2>일반 돌봄 상세 정보</h2>
        </div>
        <!-- 일반 돌봄 각 등록 건 -->
        <div class="box-detail">
            <div class="sitter-photo">
                <img src="<%= cp %>/images/pictures/${genDetail.photo_file_path}.jpg" alt="시터 사진">
                <!-- 파일 경로 추후 수정 필요!! -->
            </div>
            <div class="sitter-info">
        <div class="sitter-title">${genDetail.title }</div>
        <div class="sitter-details">
         	
            <div class="sitter-grade">
            	<span class="sitter-grade-img">
             		<img src="<%= cp %>/images/grades/${genDetail.grade_file_path}.gif" 
    				 width="20" height="20" alt="시터 등급 이미지">
             	</span>
             	&nbsp;${genDetail.grade} 시터 ${genDetail.name}
            </div>
            
         	<c:choose>
         	<c:when test="${restrict == 0}">
         		<div>최근 평점 ⭐${genDetail.recent_avg_rating } (${genDetail.recent_review_count }건)</div>
            	<div>전체 평점 ⭐${genDetail.avg_rating } (${genDetail.review_count }건)</div>
         	</c:when>
         	<c:otherwise>
         		<div>
         			(⭐
         			<a href="#" onclick="window.opener.location.href='parentcaredone.action'; window.close(); return false;">
         				돌봄 이용 리뷰 작성
         			</a>
         			&nbsp;이후 평점 열람 가능)
         		</div>
         	</c:otherwise>
         	</c:choose>
         	
         	<fmt:parseDate var="startDateParsed" value="${genDetail.start_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:parseDate var="endDateParsed" value="${genDetail.end_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<div>돌봄 등록 일자: 📆
				<fmt:formatDate value="${startDateParsed}" pattern="yyyy.MM.dd."/>
			~
			<fmt:formatDate value="${endDateParsed}" pattern="yyyy.MM.dd."/>
			</div>
           	
            <div>돌봄 등록 시간: ⏰
            <c:choose>
			<c:when test="${genDetail.start_time < 12}">
				오전 ${genDetail.start_time}시
			</c:when>
			<c:otherwise>
				오후 ${genDetail.start_time == 12 ? 12 : genDetail.start_time-12}시
			</c:otherwise>
			</c:choose>
			~
			<c:choose>
			<c:when test="${genDetail.end_time < 12}">
				오전 ${genDetail.end_time}시
			</c:when>
			<c:otherwise>
			    오후 ${genDetail.end_time == 12 ? 12 : genDetail.end_time-12}시
			</c:otherwise>
			</c:choose>
			</div>
					<c:if test="${not empty preferedRegion}">
                    <div>지역:&nbsp;
                    <c:forEach var="pr" items="${preferedRegion}">
                    	<span class="badge">${pr}</span>
		            </c:forEach>
                    </div>
                    </c:if>
                    
                    <c:if test="${not empty preferedAge}">
               		<div>자신있는 돌봄 연령대:&nbsp;
               		<c:forEach var="pa" items="${preferedAge}">
                    	<span class="badge">${pa}</span>
		            </c:forEach>
                    </div>
                    </c:if>
                    
                    <c:if test="${not empty listSitCert}">
               		<div>보유 자격:&nbsp;
               		<c:forEach var="cert" items="${listSitCert}">
                    	<span class="badge">${cert}</span>
		            </c:forEach>
                    </div>
		            </c:if>
		            
		            <c:if test="${not empty listReview}">
               		<div>돌봄 후기:&nbsp;
               		<c:forEach var="review" items="${listReview}">
                    	<span class="badge">${review}</span>
		            </c:forEach>
                    </div>
		            </c:if>
		            
                    	
                    <div>시터님의 한 마디: ${genDetail.introduction}</div>
                	<!-- <div>마지막 근무일: 2025.03.14.</div> -->
            	</div>	
   			</div>
        </div>
        <div class="btn-area row-items">
	        <button type="button" class="btn gen-btn-small" id="back">팝업 닫기</button>
	        <button type="button" class="btn gen-btn-small" id="gen-request">돌봄 신청</button>
	    </div>
    </div>
</div>

</body>
</html>