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
<title>시터 이용 완료 페이지</title>
<link rel="stylesheet" href="css/CareCompleted.css">
<script type="text/javascript">
    let currentPage = 1;
    const itemsPerPage = 8;

    // 페이지네이션 처리 함수
    function paginate() 
    {
        let table = document.getElementById("bookingTable");
        let rows = table.getElementsByClassName("booking-item");
        
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

 <div id="finish-header">
     <h2>돌봄 완료 내역</h2>
 </div>

<!-- 예약 완료 리스트 -->
 <div class="booking-list">
  <div class="booking-header">
      <div class="column">번호</div>
      <div class="column">시터 이름</div>
      <div class="column">예약 날짜</div>
      <div class="column">예약 시간</div>
      <div class="column">이용 상태</div>
      <div class="column">리뷰</div>
  </div>
  
  <div id="bookingTable">
      <!-- 예약 항목 1 -->
      <div class="booking-item">
          <div class="column">1</div>
          <div class="column">김주항</div>
          <div class="column">2025월 02월 25일 ~ 2025월 03월 03일</div> <!-- 예약 날짜 형식 변경 -->
          <div class="column">3시간</div>
          <div class="column">돌봄 완료</div> <!-- 고정된 이용 상태 -->
          <div class="column"><button>리뷰</button></div>
      </div>
      <!-- 예약 항목 2 -->
      <div class="booking-item">
          <div class="column">2</div>
          <div class="column">박노랑</div>
          <div class="column">2025월 02월 18일 ~ 2025월 02월 23일</div> <!-- 예약 날짜 형식 변경 -->
          <div class="column">2시간</div>
          <div class="column">돌봄 완료</div> <!-- 고정된 이용 상태 -->
          <div class="column"><button>리뷰</button></div>
      </div>
      <!-- 예약 항목 3 -->
      <div class="booking-item">
          <div class="column">3</div>
          <div class="column">오초록</div>
          <div class="column">2025월 01월 30일 ~ 2025월 02월 03일</div> <!-- 예약 날짜 형식 변경 -->
          <div class="column">4시간</div>
          <div class="column">돌봄 완료</div> <!-- 고정된 이용 상태 -->
            <div class="column"><button>리뷰</button></div>
        </div>
      <!-- 예약 항목 4 -->
      <div class="booking-item">
          <div class="column">4</div>
          <div class="column">이파랑</div>
          <div class="column">2025월 01월 15일 ~ 2025월 01월 23일</div> <!-- 예약 날짜 형식 변경 -->
          <div class="column">5시간</div>
          <div class="column">돌봄 완료</div> <!-- 고정된 이용 상태 -->
            <div class="column"><button>리뷰</button></div>
        </div>
        <!-- 예약 항목 5 -->
      <div class="booking-item">
          <div class="column">5</div>
          <div class="column">고소라</div>
          <div class="column">2025월 01월 02일 ~ 2025월 01월 13일</div> <!-- 예약 날짜 형식 변경 -->
          <div class="column">4시간</div>
          <div class="column">돌봄 완료</div> <!-- 고정된 이용 상태 -->
            <div class="column"><button>리뷰</button></div>
        </div>
        <!-- 예약 항목 6 -->
      <div class="booking-item">
          <div class="column">6</div>
          <div class="column">김보라</div>
          <div class="column">2024월 12월 18일 ~ 2024월 12월 23일</div> <!-- 예약 날짜 형식 변경 -->
          <div class="column">4시간</div>
          <div class="column">돌봄 완료</div> <!-- 고정된 이용 상태 -->
            <div class="column"><button>리뷰</button></div>
        </div>
        <!-- 예약 항목 7 -->
      <div class="booking-item">
          <div class="column">7</div>
          <div class="column">주빨강</div>
          <div class="column">2024월 11월 30일 ~ 2024월 12월 6일</div> <!-- 예약 날짜 형식 변경 -->
          <div class="column">7시간</div>
          <div class="column">돌봄 완료</div> <!-- 고정된 이용 상태 -->
            <div class="column"><button>리뷰</button></div>
        </div>
        <!-- 예약 항목 8 -->
      <div class="booking-item">
          <div class="column">8</div>
          <div class="column">미백호</div>
          <div class="column">2024월 11월 05일 ~ 2024월 11월 15일</div> <!-- 예약 날짜 형식 변경 -->
          <div class="column">6시간</div>
          <div class="column">돌봄 완료</div> <!-- 고정된 이용 상태 -->
            <div class="column"><button>리뷰</button></div>
        </div>
        <!-- 예약 항목 9 -->
      <div class="booking-item">
          <div class="column">9</div>
          <div class="column">검정은</div>
          <div class="column">2024월 10월 20일 ~ 2024월 10월 27일</div> <!-- 예약 날짜 형식 변경 -->
          <div class="column">4시간</div>
          <div class="column">돌봄 완료</div> <!-- 고정된 이용 상태 -->
            <div class="column"><button>리뷰</button></div>
        </div>
    </div>
    
    <!-- 페이지네이션 버튼 -->
    <div id="paginationContainer" class="pagination-controls"></div>
</div>

</body>
</html>