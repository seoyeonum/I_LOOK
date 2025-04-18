<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/notice.css">
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script> -->
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
                전체 <span>5</span>건
            </div>
            <div class="search-box">
                <select>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                    <option value="title_content">제목+내용</option>
                </select>
                <input type="text" placeholder="검색어를 입력하세요">
                <button type="button" class="btn">검색</button>
                <button type="button" class="btn">등록</button>
            </div>
        </div>
        
         <div class="board-list">
            <!-- 게시판 헤더 -->
            <div class="board-list-header">
                <div class="board-list-cell id">번호</div>
                <div class="board-list-cell type">유형</div>
                <div class="board-list-cell title">제목</div>
                <div class="board-list-cell author">작성자</div>
                <div class="board-list-cell views">조회수</div>
                <div class="board-list-cell date">작성일</div>
            </div>
            
            <!-- 게시물 항목 -->
            <div class="board-list-item">
                <div class="board-list-cell id">5</div>
                <div class="board-list-cell type"><span class="badge-type notice">공지사항</span></div>
                <div class="board-list-cell title">사이트 점검 안내</div>
                <div class="board-list-cell author">관리자</div>
                <div class="board-list-cell views">128</div>
                <div class="board-list-cell date">2025-04-07</div>
            </div>
            
            <div class="board-list-item">
                <div class="board-list-cell id">4</div>
                <div class="board-list-cell type"><span class="badge-type event">이벤트</span></div>
                <div class="board-list-cell title">봄맞이 이벤트 안내</div>
                <div class="board-list-cell author">관리자</div>
                <div class="board-list-cell views">256</div>
                <div class="board-list-cell date">2025-04-05</div>
            </div>
            
            <div class="board-list-item">
                <div class="board-list-cell id">3</div>
                <div class="board-list-cell type"><span class="badge-type notice">공지사항</span></div>
                <div class="board-list-cell title">개인정보처리방침 변경 안내</div>
                <div class="board-list-cell author">관리자</div>
                <div class="board-list-cell views">142</div>
                <div class="board-list-cell date">2025-04-03</div>
            </div>
            
            <div class="board-list-item">
                <div class="board-list-cell id">2</div>
                <div class="board-list-cell type"><span class="badge-type event">이벤트</span></div>
                <div class="board-list-cell title">신규 회원 혜택 안내</div>
                <div class="board-list-cell author">관리자</div>
                <div class="board-list-cell views">318</div>
                <div class="board-list-cell date">2025-04-01</div>
            </div>
            
            <div class="board-list-item">
                <div class="board-list-cell id">1</div>
                <div class="board-list-cell type"><span class="badge-type notice">공지사항</span></div>
                <div class="board-list-cell title">사이트 오픈 안내</div>
                <div class="board-list-cell author">관리자</div>
                <div class="board-list-cell views">425</div>
                <div class="board-list-cell date">2025-03-28</div>
            </div>
        </div>
        
        <div class="board-footer">
	        <ul class="page-number">
	            <li><a href="#">&laquo;</a></li>		<!-- &laquo; → "<<" -->
	            <li><a class="active" href="#">1</a></li>
	            <li><a href="#">2</a></li>
	            <li><a href="#">3</a></li>
	            <li><a href="#">4</a></li>
	            <li><a href="#">5</a></li>
	            <li><a href="#">&raquo;</a></li>		<!-- &raquo; → "<<" -->
	        </ul>
        </div>
    </div>
</div>
</body>
</html>