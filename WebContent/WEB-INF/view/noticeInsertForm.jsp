<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/notice.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
    
    // 이 페이지 로드 시,
    document.addEventListener('DOMContentLoaded', function()
    {
    	//객체 생성
        var xmlHttp = new XMLHttpRequest();
    	
    	// xmlHttp 요청 준비
        xmlHttp.open('GET', './parentMainFrame.html', true);
        
        // xmlHttp 서버 응답 완료 후 아래를 실행
        xmlHttp.onload = function()
        {        	
        	// onload 요청을 성공적으로 처리 시
            if (xmlHttp.status == 200)
            {
            	// 업무 처리 → xmlHttp 응답 데이터를 헤더에 넣기.
                document.getElementById('header-container').innerHTML = xmlHttp.responseText;
            	
             	// 헤더가 로드된 후 버튼 클래스 변경
                // menuBtn 와 presentPage를 클래스로 가지는 엘리먼트에서 presentPage 클래스 제거
                var firstButton = document.querySelector('.menuBtn.presentPage');
                if (firstButton)
                {
                    firstButton.classList.remove('presentPage');
                }
                
                // menuBtn 을 클래스로 가지는 엘리먼트 중
                var buttons = document.querySelectorAll('.menuBtn');
                if (buttons.length >= 2)
                {
                	// 0번째 엘리먼트에 presentPage 클래스 추가 (0부터 시작)
                    buttons[0].classList.add('presentPage');
                }
            }
        };
        
        xmlHttp.send();
        
        
        
     	// 1. 등록 버튼 클릭 시 팝업 후 수정
    	$("#insert").click(function()
    	{
    	    alert("공지사항 수정이 완료되었습니다.");
    	    
    	    // 폼 제출 → noticeList.jsp
    		$("form").submit();
    	    
    	});
     	
    	// 2. 초기화 버튼 클릭 시 확인 후 초기화
    	$("#reset").click(function(e)
    	{
    	    var userConfirmed = confirm("정말 초기화 하시겠습니까?");
    	    
    	    if (userConfirmed)
    	    {
    	        alert("textarea 초기화 완료");
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

<!-- parentMainFrame.html을 삽입할 위치 -->
<div id="header-container"></div>

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
                <button type="button" id="insert" class="btn">등록</button>
                <button type="button" id="reset" class="btn">초기화</button>
            </div>
        </div>
	        
		<form action="./noticeList.jsp">
	        <div class="board-border">
	            <!-- 게시판 헤더 -->
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
		                <div class="board-list-cell detail-title">제목</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-title">
		            		<input type="text" id="title-input" placeholder="(제목을 입력하세요./최대 16자 입력 가능)"/>
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
		            		<textarea id="content-input" placeholder="(내용을 입력하세요./최대 1,000자 입력 가능)"></textarea>
		            	</div>
		            </div>
		        </div>
	        </div>
    	</form>
    </div>
</div>
</body>
</html>