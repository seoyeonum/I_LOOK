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
<title>noticeDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/notice.css">
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> -->
<script type="text/javascript">
	    
	//이 페이지 로드 시,
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
	});

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
                <button type="button" id="back" class="btn"
                onclick="window.location.href='<%=cp%>/noticelist.action'">목록으로</button>
            </div>
            <c:choose>
			    <c:when test="${not empty admin}">
	            <div class="search-box">
	                <button type="button" id="update" class="btn">수정</button>
	                <button type="button" id="delete" class="btn">삭제</button>
	            </div>
	            </c:when>
		        <c:otherwise>
		            <!-- 기본 헤더 또는 아무 작업도 하지 않음 -->
		        </c:otherwise>
		    </c:choose>
        </div>
	        
		<form action="">
	        <div class="board-border">
		        <div class="board-detail">
		            <!-- 게시판 헤더 -->
		            <div class="board-list-header">
		                <div class="board-list-cell detail-rnum">번호</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-rnum">${noticeRnum }</div>
		            </div>
		            <div class="board-list-header">
		                <div class="board-list-cell detail-hitcount">조회수</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-hitcount">${noticeDetail.hitcount }</div>
		            </div>
		        </div>
		         
		        <div class="board-detail">
		        	<div class="board-list-header">
		                <div class="board-list-cell detail-author">작성자</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-author">관리자</div>
		            </div>
		            
		            <div class="board-list-header">
		                <div class="board-list-cell detail-date">작성일</div>
		            </div>
		            <div class="board-list-detail">
	            	<fmt:parseDate var="noticeDateParsed" value="${noticeDetail.noticed_date }" pattern="yyyy-MM-dd HH:mm:ss"/>
	            	<div class="board-list-cell detail-notice-date">
	            		<fmt:formatDate value="${noticeDateParsed}" pattern="yyyy.MM.dd."/>
	            	</div>
		            </div>
		        </div>
		         
		        <div class="board-detail">
		            <div class="board-list-header">
		                <div class="board-list-cell detail-type">유형</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-type">
		            	<c:choose>
						<c:when test="${noticeDetail.type == '이벤트'}">
							<span class="badge-type event">${noticeDetail.type}</span>
						</c:when>
						<c:when test="${noticeDetail.type == '공지사항'}">
							<span class="badge-type notice">${noticeDetail.type}</span>
						</c:when>
						<c:otherwise>
							<!-- 기타 타입의 경우 공지사항과 동일하게 출력 -->
							<span class="badge-type notice">${noticeDetail.type}</span>
						</c:otherwise>
						</c:choose>
		            	</div>
		            </div>
		            <div class="board-list-header">
		                <div class="board-list-cell detail-subject">제목</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-subject">${noticeDetail.subject}</div>
		            </div>
		        </div>
		        <div class="board-detail">
		            <div class="board-list-header">
		                <div class="board-list-cell detail-content">내용</div>
		            </div>
		        </div>
		        <div class="board-detail">
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-content">${noticeDetail.content}</div>
		            </div>
		        </div>
	        </div>
    	</form>
    </div>
</div>

<footer class="footer">
	<c:import url="/footer.action"/>
</footer>

</body>
</html>