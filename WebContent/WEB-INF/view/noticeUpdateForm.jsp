<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/notice.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
    
    // 이 페이지 로드 시,
    document.addEventListener('DOMContentLoaded', function()
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
        
        
        
     	// 1. 수정 버튼 클릭 시 팝업 후 수정
    	$("#update").click(function()
    	{
    	    alert("공지사항 수정이 완료되었습니다.");
    	    
    	    // 폼 제출 → noticeList.jsp
    		$("form").submit();
    	    
    	});
     	
    	// 2. 삭제 버튼 클릭 시 확인 후 삭제
    	$("#delete").click(function(e) {
    	    var userConfirmed = confirm("정말 삭제하시겠습니까?");
    	    
    	    if (userConfirmed) {
    	        alert("공지사항 삭제가 완료되었습니다.");
    	        
    	        // 폼 제출 → noticeList.jsp
    	        $("form").submit();
    	    }
    	    else
    	    {
    	        e.preventDefault(); // 폼 제출을 막고 현재 페이지에 머물게 함
    	        return; // 추가적인 동작을 막음
    	    }
    	});
        
    });

</script>
</head>
<body>

<!-- 상단 헤더 영역 -->
<div id="header-container">
    <c:import url="adminHeader.jsp"/>
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
                <button type="button" id="back" class="btn">목록으로</button>
            </div>
            <div class="search-box">
                <button type="button" id="update" class="btn">수정</button>
                <button type="button" id="delete" class="btn">삭제</button>
            </div>
        </div>
	        
		<form action="./noticeList.jsp">
	        <div class="board-border">
	            <!-- 게시판 헤더 -->
		        <div class="board-detail">
		            <div class="board-list-header">
		                <div class="board-list-cell detail-rnum">번호</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-rnum">5</div>
		            </div>
		            <div class="board-list-header">
		                <div class="board-list-cell detail-hitcount">조회수</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-hitcount">128</div>
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
		            	<div class="board-list-cell detail-notice-date">2025-04-07</div>
		            </div>
		        </div>
		         
		        <div class="board-detail">
		            <div class="board-list-header">
		                <div class="board-list-cell detail-type">유형</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-type">
		            		<select name="" id="">
		                		<option value="">유형</option>
		                		<option value="1" id="type-input" selected="selected">공지사항</option>
		                		<option value="2">이벤트</option>
		                	</select>
		            	</div>
		            </div>
		            <div class="board-list-header">
		                <div class="board-list-cell detail-subject">제목</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-subject">
		            		<input type="text" id="subject-input" value="사이트 점검 안내"/>
		            	</div>
		            </div>
		        </div>
		        <div class="board-detail">
		            <div class="board-list-header">
		                <div class="board-list-cell detail-content">내용</div>
		            </div>
		        </div>
		        <div class="board-detail">
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-content">
		            		<textarea id="content-input">4월 25일 02:00 ~ 04:00 사이트 점검 예정입니다.</textarea>
		            	</div>
		            </div>
		        </div>
	        </div>
    	</form>
    </div>
</div>
</body>


<footer class="footer">
	<c:import url="/footer.action"/>
</footer>

</html>