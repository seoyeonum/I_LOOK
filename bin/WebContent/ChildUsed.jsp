<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봄 이용 내역 열람 페이지</title>
<link rel="stylesheet" href="css/ChildUsed.css">
<script type="text/javascript">
    let currentPage = 1;
    const itemsPerPage = 3;

    // 페이지네이션 처리 함수
    function paginate() 
    {
        let table = document.getElementById("history-table");
        let rows = table.getElementsByClassName("history-item");
        
        // 현재 페이지에 맞는 항목 범위 계산
        let start = (currentPage - 1) * itemsPerPage;
        let end = currentPage * itemsPerPage;
        
        // 모든 행을 순차적으로 확인하여 페이지에 맞게 표시/숨기기
        for (let i = 0; i < rows.length; i++) 
        {
            if (i >= start && i < end) {
                rows[i].style.display = "";
            } else {
                rows[i].style.display = "none";
            }
        }
        
        // 페이지네이션 버튼 업데이트
        updatePaginationButtons(rows.length);
    }

    // 페이지네이션 버튼 업데이트 함수
    function updatePaginationButtons(totalItems) 
    {
        let totalPages = Math.ceil(totalItems / itemsPerPage);
        
        // 페이지 버튼을 동적으로 생성
        let paginationContainer = document.getElementById("paginationContainer");
        paginationContainer.innerHTML = '';  // 기존 내용을 지우고 새로 생성
        
        // "이전" 버튼
        let prevBtn = document.createElement("button");
        prevBtn.innerText = "Prev";
        prevBtn.onclick = prevPage;
        prevBtn.disabled = currentPage === 1;
        paginationContainer.appendChild(prevBtn);

        // 페이지 번호 버튼
        for (let i = 1; i <= totalPages; i++) 
        {
            let pageBtn = document.createElement("button");
            pageBtn.innerText = i;
            pageBtn.onclick = function() 
            {
                currentPage = i;
                paginate();
            };
            if (i === currentPage) {
                pageBtn.style.fontWeight = "bold";  // 현재 페이지를 강조
            }
            paginationContainer.appendChild(pageBtn);
        }

        // "다음" 버튼
        let nextBtn = document.createElement("button");
        nextBtn.innerText = "Next";
        nextBtn.onclick = nextPage;
        nextBtn.disabled = currentPage === totalPages;
        paginationContainer.appendChild(nextBtn);
    }

    // "다음" 페이지로 이동
    function nextPage() 
    {
        currentPage++;
        paginate();
    }

    // "이전" 페이지로 이동
    function prevPage() 
    {
        currentPage--;
        paginate();
    }

    // 페이지 로드 시 초기화
    window.onload = function() 
    {
        paginate();
    };
</script>
</head>
<body>

<header>
	<div id="logo">
    	<img src="./logo.png" height="120px"></div>
            <nav>
                <button type="button" class="menuBtn presentPage">홈</button>
                <button type="button" class="menuBtn">로그아웃</button>
                <button type="button" class="menuBtn">스케줄러</button>
                <button type="button" class="menuBtn">긴급돌봄서비스</button>
                <button type="button" class="menuBtn">마이페이지</button>
                <button type="button" class="menuBtn">알림함</button>
            </nav>
</header>
        
<div class="sidebar">
	<div class="sidebar-title">마이페이지</div>
	  <div class="menu">
	
	    <!-- 아이 정보 -->
	    <div class="menu-item">
	      <a href="#"><i class="fa-solid fa-child"></i> 아이 정보 관리</a>
	      <div class="submenu">
	        <a href="#">아이 목록 보기</a>
	        <a href="#">신규 아이 등록</a>
	        <a href="#">아이 정보 수정</a>
	      </div>
	    </div>
	
	    <!-- 부모 정보 -->
	    <div class="menu-item">
	      <a href="#"><i class="fa-solid fa-user-group"></i> 부모 정보 관리</a>
	      <div class="submenu">
	        <a href="#">부모 정보 보기</a>
	        <a href="#">부모 정보 수정</a>
	      </div>
	    </div>
	
	    <!-- 돌봄 이용 -->
	    <div class="menu-item">
	      <a href="#"><i class="fa-solid fa-house-chimney-user"></i> 돌봄 이용 현황</a>
	      <div class="submenu">
	        <a href="#">현재 이용 내역</a>
	        <a href="#">이용 완료 내역</a>
	      </div>
	    </div>
	  </div>
</div>

<div class="title">
	<h2>시터 이용 내역</h2>
</div>

<div class="container">
<!-- 상단 섹션 (최근 이용한 시터 프로필) -->
<div class="recent-sitter-container">
    <h2 class="page-title">최근 이용 내역 및 현재 이용 상태</h2> 
    <div class="recent-sitter-profile">
        <div class="sitter-photo-container">
            <img src="sitter-profile.jpg" alt="시터 사진">
        </div>
        <div class="sitter-info-container">
            <div class="info-item">
                <span class="info-label">현재 상태:</span> <span class="info-value">이용 중</span>
            </div>
            <div class="info-item">
                <span class="info-label">이용 날짜:</span> <span class="info-value">2025년 3월 5일 ~ 2025년 3월 11일</span>
            </div>
            <div class="info-item">
                <span class="info-label">아이 이름:</span> <span class="info-value">김창식</span>
            </div>
            <div class="info-item">
                <span class="info-label">시터 이름:</span> <span class="info-value">오이지</span>
            </div>
            <div class="info-item">
                <span class="info-label">시터 등급</span> <span class="info-value">silver</span>
            </div>
        </div>
    </div>
</div>


<!-- 하단 섹션 (이용 내역 리스트) -->
    <div class="history-section">
	    <h2 class="page-list-title">이용 내역</h2>
	    <div class="history-list-container">
	        <div class="history-item header">
	            <span class="history-number">번호</span>
	            <span class="history-date">이용날짜</span>
	            <span class="history-time">이용시간</span>
	            <span class="history-child-name">아이 이름</span>
	            <span class="history-sitter-name">시터 이름</span>
	            <span class="history-btn">상세보기</span>
	        </div>
	    <div id="history-table" class="history-list-container">
	        <div class="history-item">
	            <span class="history-number">1</span>
	            <span class="history-date">
	                <span class="start-date">2025년 2월 25일 ~ </span><br>
	                <span class="end-date">2025년 3월 03일</span>
	            </span>
	            <span class="history-time">3시간</span>
	            <span class="history-child-name">김창식</span>
	            <span class="history-sitter-name">김주항</span>
	            <button class="details-btn">상세보기</button>
	        </div>
	        <div class="history-item">
	            <span class="history-number">2</span>
	            <span class="history-date">
	                <span class="start-date">2025년 2월 18일 ~ </span><br>
	                <span class="end-date">2025년 2월 23일</span>
	            </span>
	            <span class="history-time">2시간</span>
	            <span class="history-child-name">김창식</span>
	            <span class="history-sitter-name">박노랑</span>
	            <button class="details-btn">상세보기</button>
	        </div>
	        <div class="history-item">
	            <span class="history-number">3</span>
	            <span class="history-date">
	                <span class="start-date">2025년 1월 30일 ~ </span><br>
	                <span class="end-date">2025년 2월 03일</span>
	            </span>
	            <span class="history-time">4시간</span>
	            <span class="history-child-name">김창식</span>
	            <span class="history-sitter-name">오초록</span>
	            <button class="details-btn">상세보기</button>
	        </div>
	        <!-- 추가 항목들 -->
	        <div class="history-item">
	            <span class="history-number">4</span>
	            <span class="history-date">
	                <span class="start-date">2025년 1월 15일 ~ </span><br>
	                <span class="end-date">2025년 1월 23일</span>
	            </span>
	            <span class="history-time">5시간</span>
	            <span class="history-child-name">김창식</span>
	            <span class="history-sitter-name">이파랑</span>
	            <button class="details-btn">상세보기</button>
	        </div>
	    </div>

   			<!-- 페이지네이션 버튼을 표시할 컨테이너 -->
    		<div id="paginationContainer" class="pagination-controls"></div>
		</div>
	</div>
</div>


</body>
</html>