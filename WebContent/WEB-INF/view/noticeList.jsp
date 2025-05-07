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
<title>noticeList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%= cp %>/css/notice.css">
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> -->
<script type="text/javascript">
    
    // 이 페이지 로드 시,
	document.addEventListener('DOMContentLoaded', function ()
	{
		//=================== 헤더 버튼 클래스 변경 ==================
		
		// menuBtn 와 presentPage를 클래스로 가지는 첫 엘리먼트에서 presentPage 클래스 제거
        var firstButton = document.querySelector('.menuBtn.presentPage');
        if (firstButton)
        {
            firstButton.classList.remove('presentPage');
        }
       
        // id가 'noticeList'인 버튼을 선택
        var button = document.querySelector('#noticeList');

        // 만약 버튼이 존재하면
        if (button)
        {
            // 'presentPage' 클래스 추가
            button.classList.add('presentPage');
        }	
		
        //=================== 게시물 클릭 이벤트 처리 ==================
        
        // board-list-item 를 클래스로 가지는 모든(All) 엘리먼트 → boardItems (배열)
     	var boardItems = document.querySelectorAll('.board-list-item');
        
        // boardItems 각 엘리먼트에 대하여
        boardItems.forEach(function(item)
        {
        	// 클릭 시
            item.addEventListener('click', function()		
            {
                // board-list-cell와 notice-id를 클래스로 갖는 엘리먼트의
                // PC data(게시물 코드)를 다음 페이지로 전달
                var noticeId = this.querySelector('.board-list-cell.notice-id').textContent;
                
            	// board-list-cell와 rnum를 클래스로 갖는 엘리먼트의
            	// PC data(게시물 번호)를 다음 페이지로 전달
                var noticeRnum = this.querySelector('.board-list-cell.rnum').textContent;
            	
                location.href = 'noticedetail.action?noticeId=' + noticeId + '&noticeRnum=' + noticeRnum;
                
            });
            
        });

    });
    
	// 함수 1. 페이지 이동을 위한 폼 제출 함수
    function goToPage(page)
	{
	    document.getElementById('pageInput').value = page;
	    document.getElementById('pageForm').submit();
	}

</script>
</head>
<body>

<!-- 상단 헤더 영역 -->
<div id="header-container">
    <c:choose>
        <c:when test="${not empty parent}">
            <c:import url="/parentheader.action"></c:import>
        </c:when>
        <c:when test="${not empty sitter}">
            <c:import url="/sitterheader.action"></c:import>
        </c:when>
        <c:when test="${not empty admin}">
            <c:import url="adminHeader.jsp"></c:import>
        </c:when>
        <c:otherwise>
            <!-- 기본 헤더 또는 아무 작업도 하지 않음 -->
        </c:otherwise>
    </c:choose>
</div>


<div id="body-container">
	<div id="wrapper-header">
		<div class="main-subject">
			<h1>공지사항</h1>
		</div>
	</div>
	
	<div id="wrapper-body">
		<div class="board-header">
            <div class="board-info">
                전체 <span>${countNotice}</span>건
            </div>
            <div class="search-box">
                <select>
                    <option value="subject">제목</option>
                    <option value="content">내용</option>
                    <option value="subject_content">제목+내용</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요">
                <button type="button" class="btn">검색</button>
                <c:choose>
			        <c:when test="${not empty admin}">
		                <button type="button" class="btn"
		                onclick="window.location.href='<%=cp%>/noticeinsertform.action'">등록</button>
			        </c:when>
			        <c:otherwise>
			            <!-- 기본 헤더 또는 아무 작업도 하지 않음 -->
			        </c:otherwise>
			    </c:choose>
            </div>
        </div>
        
         <div class="board-list">
            <!-- 게시판 헤더 -->
            <div class="board-list-header">
                <div class="board-list-cell rnum">번호</div>
                <div class="board-list-cell type">유형</div>
                <div class="board-list-cell subject">제목</div>
                <div class="board-list-cell author">작성자</div>
                <div class="board-list-cell hitcount">조회수</div>
                <div class="board-list-cell date">작성일</div>
            </div>
            
            <!-- 게시물 항목 -->
            <!-- 
            <div class="board-list-item">
                <div class="board-list-cell id">5</div>
                <div class="board-list-cell type"><span class="badge-type notice">공지사항</span></div>
                <div class="board-list-cell title">사이트 점검 안내</div>
                <div class="board-list-cell author">관리자</div>
                <div class="board-list-cell views">128</div>
                <div class="board-list-cell date">2025-04-07</div>
            </div>
            -->
            <c:forEach var="notice" items="${listNotice}">
            <div class="board-list-item">
                <div class="board-list-cell rnum">${notice.rnum}</div>
                <div class="board-list-cell type">
                <c:choose>
				<c:when test="${notice.type == '이벤트'}">
					<span class="badge-type event">${notice.type}</span>
				</c:when>
				<c:when test="${notice.type == '공지사항'}">
					<span class="badge-type notice">${notice.type}</span>
				</c:when>
				<c:otherwise>
					<!-- 기타 타입의 경우 공지사항과 동일하게 출력 -->
					<span class="badge-type notice">${notice.type}</span>
				</c:otherwise>
				</c:choose>
                </div>
                <div class="board-list-cell subject">${notice.subject}</div>
                <div class="board-list-cell author">관리자</div>
                <div class="board-list-cell hitcount">${notice.hitcount}</div>
                <fmt:parseDate var="noticeDateParsed" value="${notice.noticed_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
                <div class="board-list-cell date">
                	<fmt:formatDate value="${noticeDateParsed}" pattern="yyyy.MM.dd."/>
                </div>
                <div class="board-list-cell notice-id hidden">${notice.notice_id}</div>
            </div>
            </c:forEach>
    	</div>
    </div>
    
    <div class="board-footer">
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
		<form id="pageForm" action="noticelist.action" method="get">
		    <%--
		    <input type="hidden" name="child_backup_id" value="${childBackupId}">
			<input type="hidden" name="start_date" value="${dateStart}">
			<input type="hidden" name="end_date" value="${dateEnd}">
			<input type="hidden" name="start_time" value="${timeStart}">
			<input type="hidden" name="end_time" value="${timeEnd}">
			--%>
		    <input type="hidden" name="page" id="pageInput" value="1">
		</form>
	</div>
</div>

<footer class="footer">
	<c:import url="/footer.action"/>
</footer>

</body>
</html>