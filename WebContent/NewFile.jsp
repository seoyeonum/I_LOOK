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
<title>genMain.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gen-filter.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="js/genFilter.js" defer></script>
<style>
    /* 캐러셀 관련 스타일 */
    .carousel-container {
        position: relative;
        width: 100%;
        overflow: hidden;
        border-radius: 10px;
        margin-bottom: 20px;
        box-shadow: 2px 2px 0 #e5e5e5;
    }
    
    .carousel-slide {
        display: flex;
        width: 300%;
        transition: transform 0.5s ease-in-out;
    }
    
    .carousel-item {
        width: 33.33%;
        height: 200px;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        color: white;
        text-align: center;
        padding: 0 20px;
    }
    
    .carousel-item h3 {
        font-size: 22px;
        margin-bottom: 10px;
        color: white;
    }
    
    .carousel-item p {
        font-size: 16px;
        line-height: 1.5;
    }
    
    .carousel-controls {
        position: absolute;
        bottom: 15px;
        left: 0;
        right: 0;
        display: flex;
        justify-content: center;
        gap: 10px;
    }
    
    .carousel-dot {
        width: 10px;
        height: 10px;
        border-radius: 50%;
        background-color: rgba(255, 255, 255, 0.5);
        cursor: pointer;
    }
    
    .carousel-dot.active {
        background-color: white;
    }
    
    /* 첫 번째 슬라이드: 분홍색 계열 */
    .carousel-item:nth-child(1) {
        background: linear-gradient(135deg, #e28c99, #d05475);
    }
    
    /* 두 번째 슬라이드: 보라색 계열 */
    .carousel-item:nth-child(2) {
        background: linear-gradient(135deg, #dcb9ff, #8265b5);
    }
    
    /* 세 번째 슬라이드: 파란색 계열 */
    .carousel-item:nth-child(3) {
        background: linear-gradient(135deg, #aad5ff, #5199e4);
    }
    
    /* 추천 시터 섹션 */
    .sitter-carousel-container {
        width: 100%;
        overflow: hidden;
        position: relative;
        margin-bottom: 15px;
    }
    
    .sitter-carousel {
        display: flex;
        transition: transform 0.5s ease;
    }
    
    .sitter-item {
        min-width: 100%;
        display: flex;
        padding: 15px;
        background: white;
        border-radius: 10px;
        box-shadow: 2px 2px 0 #e5e5e5;
        box-sizing: border-box;
    }
    
    .arrow-btn {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        background: rgba(226, 140, 153, 0.7);
        color: white;
        border: none;
        width: 30px;
        height: 30px;
        border-radius: 50%;
        cursor: pointer;
        z-index: 10;
        display: flex;
        align-items: center;
        justify-content: center;
    }
    
    .arrow-btn:hover {
        background: rgba(226, 140, 153, 1);
    }
    
    .prev-btn {
        left: 10px;
    }
    
    .next-btn {
        right: 10px;
    }
    
    /* 공지사항 리스트 스타일 */
    .notice-list {
        list-style-type: none;
        margin: 0;
        padding: 0;
    }
    
    .notice-item {
        display: flex;
        justify-content: space-between;
        padding: 10px 5px;
        border-bottom: 1px solid #eee;
    }
    
    .notice-item:last-child {
        border-bottom: none;
    }
    
    .notice-title {
        flex: 1;
        white-space: nowrap;
        overflow: hidden;
        text-overflow: ellipsis;
        color: #555;
    }
    
    .notice-date {
        color: #999;
        font-size: 0.9em;
        margin-left: 15px;
    }
    
    .notice-badge {
        background-color: #e28c99;
        color: white;
        font-size: 11px;
        padding: 2px 6px;
        border-radius: 10px;
        margin-right: 8px;
    }
    
    /* 공지사항과 시터검색 컨테이너 */
    .content-row {
        display: flex;
        gap: 10px;
        width: 100%;
    }
    
    .more-link {
        font-size: 12px;
        color: #888;
        margin-left: auto;
        text-decoration: none;
    }
    
    .more-link:hover {
        color: #e28c99;
    }
    
    .box-header {
        display: flex;
        align-items: center;
        margin-bottom: 10px;
    }
    
    /* 별점 표시 */
    .star-rating {
        color: #FFD700;
        margin-left: 8px;
        font-size: 14px;
    }
    
    /* 배너 섹션 */
    .banner-section {
        background: linear-gradient(135deg, #f9f0f2, #fce8ec);
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        box-shadow: 2px 2px 0 #e5e5e5;
        width: 1100px;
    }
    
    .banner-content {
        flex: 1;
    }
    
    .banner-title {
        font-size: 22px;
        color: #d05475;
        margin-bottom: 10px;
    }
    
    .banner-text {
        color: #555;
        margin-bottom: 15px;
        line-height: 1.5;
    }
    
    .banner-image {
        width: 120px;
        height: 120px;
        margin-left: 20px;
        background: url('/api/placeholder/120/120') center center no-repeat;
        background-size: contain;
    }
    
    /* 최근 이용 내역 */
    .recent-history {
        margin-top: 15px;
    }
    
    .history-item {
        display: flex;
        align-items: center;
        padding: 8px 0;
        border-bottom: 1px solid #eee;
    }
    
    .history-info {
        flex: 1;
    }
    
    .history-date {
        font-size: 12px;
        color: #999;
    }
    
    .history-sitter {
        font-weight: bold;
    }
    
    .tag {
        display: inline-block;
        font-size: 11px;
        padding: 2px 6px;
        border-radius: 10px;
        margin-right: 5px;
    }
    
    .tag-regular {
        background-color: #aad5ff;
        color: #1f6c96;
    }
    
    .tag-emergency {
        background-color: #febdb4;
        color: #d9534f;
    }
    
    /* 추가 헤더 스타일 */
    .section-header {
        display: flex;
        align-items: center;
        margin-bottom: 15px;
        padding-bottom: 10px;
        border-bottom: 1px solid #eee;
    }
    
    .section-title {
        font-size: 18px;
        font-weight: bold;
        margin: 0;
        color: #333;
    }
    
    .section-icon {
        color: #e28c99;
        margin-right: 8px;
        font-size: 18px;
    }
    
    /* 1차 필터 추가 - 없어서 다시 추가 */
    .box-filter {
        background: white;
        border-radius: 10px;
        padding: 20px;
        margin-bottom: 20px;
        box-shadow: 2px 2px 0 #e5e5e5;
        width: 1100px;
    }
    
    /* 추가: 캐러셀 화살표 */
    .main-carousel-arrow {
        position: absolute;
        top: 50%;
        transform: translateY(-50%);
        z-index: 10;
        background: rgba(255, 255, 255, 0.3);
        border: none;
        width: 40px;
        height: 40px;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        color: white;
        font-size: 20px;
        cursor: pointer;
        transition: background 0.3s;
    }
    
    .main-carousel-arrow:hover {
        background: rgba(255, 255, 255, 0.5);
    }
    
    .main-carousel-prev {
        left: 10px;
    }
    
    .main-carousel-next {
        right: 10px;
    }
    
    /* 1차 필터 폼 스타일 */
    #primary-filter-form {
        display: flex;
        flex-wrap: wrap;
        gap: 20px;
        justify-content: center;
    }
    
    .form-group {
        margin-bottom: 15px;
        padding: 10px;
    }
    
    .date-range, .time-range {
        display: flex;
        gap: 10px;
        white-space: nowrap;
        margin-bottom: 8px;
        align-items: center;
    }
    
    .date-range input, .time-range select {
        flex: 1;
    }
    
    .warning {
        color: #d9534f;
        font-size: 14px;
        margin-top: 5px;
        display: none;
    }
    
    .label {
        display: block;
        margin-bottom: 8px;
        font-size: 18px;
        white-space: nowrap;
    }
    
    .btn {
        background-color: #e28c99;
        color: white;
        border: none;
        padding: 12px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 16px;
        font-weight: 500;
        transition: background-color 0.3s;
    }
    
    .btn:hover {
        background-color: #febdb4;
    }
    
    .btn-large {
        margin-bottom: 20px;
    }
    
    .gen-btn-small {
        font-size: 12px;
    }
    
    /* 애니메이션 효과 */
    @keyframes fadeIn {
        from { opacity: 0; }
        to { opacity: 1; }
    }
    
    .fade-in {
        animation: fadeIn 0.5s ease-in-out;
    }
    
    /* 추가 인터랙션 스타일 */
    .sitter-item:hover {
        box-shadow: 0 5px 15px rgba(226, 140, 153, 0.3);
        transform: translateY(-2px);
        transition: all 0.3s ease;
    }
    
    .notice-item:hover .notice-title {
        color: #e28c99;
        transition: color 0.2s;
    }
    
    .btn:active {
        transform: scale(0.98);
    }
</style>
<script type="text/javascript">
    // 이 페이지 로드 시
    document.addEventListener('DOMContentLoaded', function() {
        //=================== 헤더 버튼 클래스 변경 ==================
        // menuBtn 와 presentPage를 클래스로 가지는 첫 엘리먼트에서 presentPage 클래스 제거
        var firstButton = document.querySelector('.menuBtn.presentPage');
        if (firstButton) {
            firstButton.classList.remove('presentPage');
        }
       
        // id가 'gen'인 버튼을 선택
        var button = document.querySelector('#gen');
        // 만약 버튼이 존재하면
        if (button) {
            // 'presentPage' 클래스 추가
            button.classList.add('presentPage');
        }
        
        //=================== 메인 캐러셀 기능 ==================
        // 메인 캐러셀 관련 변수
        let currentSlide = 0;
        const slides = document.querySelector('.carousel-slide');
        const dots = document.querySelectorAll('.carousel-dot');
        const totalSlides = dots.length;
        
        // 메인 캐러셀 화살표 버튼 이벤트
        const mainPrevBtn = document.querySelector('.main-carousel-prev');
        const mainNextBtn = document.querySelector('.main-carousel-next');
        
        if (mainPrevBtn) {
            mainPrevBtn.addEventListener('click', () => {
                currentSlide = (currentSlide - 1 + totalSlides) % totalSlides;
                updateCarousel();
            });
        }
        
        if (mainNextBtn) {
            mainNextBtn.addEventListener('click', () => {
                currentSlide = (currentSlide + 1) % totalSlides;
                updateCarousel();
            });
        }
        
        // 캐러셀 도트 클릭 이벤트
        dots.forEach((dot, index) => {
            dot.addEventListener('click', () => {
                currentSlide = index;
                updateCarousel();
                // 자동 슬라이드 타이머 재설정
                clearInterval(carouselInterval);
                carouselInterval = setInterval(() => {
                    currentSlide = (currentSlide + 1) % totalSlides;
                    updateCarousel();
                }, 5000);
            });
        });
        
        // 캐러셀 업데이트 함수
        function updateCarousel() {
            if (slides) {
                slides.style.transform = `translateX(-${currentSlide * 33.33}%)`;
                
                // 활성 도트 업데이트
                dots.forEach((dot, index) => {
                    if (index === currentSlide) {
                        dot.classList.add('active');
                    } else {
                        dot.classList.remove('active');
                    }
                });
            }
        }
        
        // 자동 슬라이드 타이머 설정
        let carouselInterval = setInterval(() => {
            currentSlide = (currentSlide + 1) % totalSlides;
            updateCarousel();
        }, 5000);
        
        // 초기 상태 설정
        updateCarousel();
        
        //=================== 시터 캐러셀 기능 ==================
        const sitterCarousel = document.querySelector('.sitter-carousel');
        const sitterItems = document.querySelectorAll('.sitter-item');
        const totalSitters = sitterItems.length;
        let currentSitter = 0;
        
        // 다음 시터 보기
        const nextBtn = document.querySelector('.next-btn');
        if (nextBtn) {
            nextBtn.addEventListener('click', () => {
                if (currentSitter < totalSitters - 1) {
                    currentSitter++;
                    updateSitterCarousel();
                }
            });
        }
        
        // 이전 시터 보기
        const prevBtn = document.querySelector('.prev-btn');
        if (prevBtn) {
            prevBtn.addEventListener('click', () => {
                if (currentSitter > 0) {
                    currentSitter--;
                    updateSitterCarousel();
                }
            });
        }
        
        function updateSitterCarousel() {
            if (sitterCarousel) {
                sitterCarousel.style.transform = `translateX(-${currentSitter * 100}%)`;
                
                // 버튼 상태 업데이트
                if (prevBtn) prevBtn.style.display = currentSitter === 0 ? 'none' : 'flex';
                if (nextBtn) nextBtn.style.display = currentSitter === totalSitters - 1 ? 'none' : 'flex';
            }
        }
        
        // 초기 상태 설정
        updateSitterCarousel();
        
        //=================== 폼 검증 기능 ==================
        // 1차 필터 폼 추가
        const filterForm = document.getElementById('primary-filter-form');
        const childSelect = document.getElementById('child-name');
        const startDate = document.getElementById('date-start');
        const endDate = document.getElementById('date-end');
        const startTime = document.getElementById('time-start');
        const endTime = document.getElementById('time-end');
        const maxTimeWarning = document.getElementById('max-time-warning');
        const minTimeWarning = document.getElementById('min-time-warning');
        
        // 오늘 날짜를 기본값으로 설정
        if (startDate && endDate) {
            const today = new Date();
            const tomorrow = new Date(today);
            tomorrow.setDate(tomorrow.getDate() + 1);
            
            const formatDate = (date) => {
                const year = date.getFullYear();
                const month = String(date.getMonth() + 1).padStart(2, '0');
                const day = String(date.getDate()).padStart(2, '0');
                return `${year}-${month}-${day}`;
            };
            
            startDate.min = formatDate(today);
            startDate.value = formatDate(today);
            endDate.min = formatDate(today);
            endDate.value = formatDate(tomorrow);
            
            // 종료 날짜가 시작 날짜보다 빠르지 않도록
            startDate.addEventListener('change', () => {
                if (endDate.value < startDate.value) {
                    endDate.value = startDate.value;
                }
                endDate.min = startDate.value;
            });
        }
        
        function validateTime() {
            if (startTime && endTime && maxTimeWarning && minTimeWarning) {
                const start = parseInt(startTime.value) || 0;
                const end = parseInt(endTime.value) || 0;
                
                if (start && end) {
                    // 최소 2시간 검증
                    if (end - start < 2) {
                        minTimeWarning.style.display = 'block';
                    } else {
                        minTimeWarning.style.display = 'none';
                    }
                    
                    // 최대 8시간 검증
                    if (end - start > 8) {
                        maxTimeWarning.style.display = 'block';
                    } else {
                        maxTimeWarning.style.display = 'none';
                    }
                }
            }
        }
        
        // 시간 변경 시 검증 실행
        if (startTime) startTime.addEventListener('change', validateTime);
        if (endTime) endTime.addEventListener('change', validateTime);
        
        // 폼 제출 이벤트
        if (filterForm) {
            filterForm.addEventListener('submit', function(e) {
                e.preventDefault(); // 실제 제출 방지 (데모용)
                
                // 폼 유효성 검사
                let isValid = true;
                
                if (!childSelect.value) {
                    alert('돌봄 희망 아이를 선택해주세요.');
                    isValid = false;
                }
                
                if (!startDate.value || !endDate.value) {
                    alert('돌봄 희망 날짜를 입력해주세요.');
                    isValid = false;
                }
                
                if (!startTime.value || !endTime.value) {
                    alert('돌봄 희망 시간을 선택해주세요.');
                    isValid = false;
                }
                
                if (startTime.value && endTime.value) {
                    const start = parseInt(startTime.value);
                    const end = parseInt(endTime.value);
                    
                    if (end <= start) {
                        alert('종료 시간은 시작 시간보다 커야 합니다.');
                        isValid = false;
                    }
                    
                    if (end - start < 2) {
                        alert('일반 돌봄은 최소 2시간부터 이용 가능합니다.');
                        isValid = false;
                    }
                    
                    if (end - start > 8) {
                        alert('일반 돌봄 하루 최대 이용시간은 8시간입니다.');
                        isValid = false;
                    }
                }
                
                if (isValid) {
                    // 실제 구현에서는 이 부분에서 서버로 데이터 전송
                    // 데모용 알림
                    alert('시터 검색을 시작합니다!\n(실제 서버 연동은 구현되지 않았습니다)');
                    
                    // 폼 리셋 (데모용)
                    // filterForm.reset();
                }
            });
        }
        
        //=================== 시터 검색 폼 ==================
        const sitterSearchForm = document.querySelector('.row-items');
        if (sitterSearchForm) {
            sitterSearchForm.addEventListener('submit', function(e) {
                e.preventDefault(); // 실제 제출 방지 (데모용)
                
                const searchInput = document.getElementById('search-name');
                if (!searchInput.value.trim()) {
                    alert('시터 이름을 입력해주세요.');
                    return;
                }
                
                // 데모용 알림
                alert(`"${searchInput.value}" 시터를 검색합니다!\n(실제 서버 연동은 구현되지 않았습니다)`);
                searchInput.value = '';
            });
        }
        
        //=================== 재신청 버튼 ==================
        const reapplyButtons = document.querySelectorAll('.recent-history .btn');
        reapplyButtons.forEach(button => {
            button.addEventListener('click', function() {
                const sitterName = this.parentElement.querySelector('.history-sitter').textContent;
                alert(`${sitterName}에게 돌봄을 재신청합니다.\n(실제 신청은 구현되지 않았습니다)`);
            });
        });
        
        //=================== 배너 버튼 ==================
        const bannerButton = document.querySelector('.banner-content .btn');
        if (bannerButton) {
            bannerButton.addEventListener('click', function() {
                alert('서비스 안내 페이지로 이동합니다.\n(실제 페이지 이동은 구현되지 않았습니다)');
            });
        }
        
        //=================== 캐러셀 버튼 ==================
        const carouselButtons = document.querySelectorAll('.carousel-item .btn');
        carouselButtons.forEach(button => {
            button.addEventListener('click', function() {
                const serviceName = this.parentElement.querySelector('h3').textContent;
                alert(`${serviceName} 페이지로 이동합니다.\n(실제 페이지 이동은 구현되지 않았습니다)`);
            });
        });
        
        //=================== 애니메이션 효과 ==================
        // 페이지 로드 시 요소들에 페이드인 효과 추가
        const fadeElements = document.querySelectorAll('.box-filter, .box-main, .carousel-container');
        fadeElements.forEach(el => {
            el.classList.add('fade-in');
        });
    });
</script>
</head>
<body>

<!-- parentMainFrame.html을 삽입할 위치 -->
<div id="header-container">
	<!-- → jstl import 구문으로 변경 -->
	<%-- <c:import url="/parentMainFrame.html" charEncoding="UTF-8" /> --%>
	<!-- → action 처리로 변경 -->
	<c:import url="/parentheader.action"/>
</div>

<div id="body-container">
	<div id="wrapper-header">
		<div class="main-subject">
			<h1>일반 돌봄 서비스</h1>
		</div>
	</div>
	
	<div class="banner-section">
	    <div class="banner-content">
	        <h3 class="banner-title">우리 아이를 위한 특별한 돌봄</h3>
	        <p class="banner-text">아이사랑에서는 전문 시터가 아이의 개성과 성향에 맞는<br>맞춤형 돌봄 서비스를 제공합니다.</p>
	        <button class="btn gen-btn-small">서비스 안내 보기</button>
	    </div>
	    <div class="banner-image"></div>
	</div>
	
	<div id="wrapper-body">
        <!-- (main) 일반 돌봄 1차 필터 -->
		<div class="box-filter">
			<div class="sub-subject">
				<h2>1차 필터</h2>
			</div>
			<div class="sub-body">
			    <form action="gensearchresult.action" id="primary-filter-form" method="post" >
			    	<div class="form-group">
				        <div class="label">돌봄 희망 아이</div>
				        <div class="child-range">
				        	<select name='child_backup_id' id="child-name" required="required">
								<option value="">아이 선택</option>
					    		<option value="1">김민준 (5세)</option>
                                <option value="2">이지우 (3세)</option>
                                <option value="3">박서연 (7세)</option>
					    	</select>
				    	</div>
				    </div>
				    
					<div class="form-group">
				        <div class="label">돌봄 희망 날짜</div>
				        <div class="date-range">
				        	<input type="date" name="start_date" id="date-start" required="required">
				        	<span>부터</span>
				        	<input type="date" name="end_date" id="date-end" required="required">
				        	<span>까지</span>
				    	</div>
				    </div>
				
				    <div class="form-group">
				    	<div class="label">돌봄 희망 시간</div>
				     	<div class="time-range">
				        	<select name="start_time" id="time-start" required="required">
					             <option value="">시작 시간</option>
					             <option value="8">오전 8:00</option>
					             <option value="9">오전 9:00</option>
					             <option value="10">오전 10:00</option>
					             <option value="11">오전 11:00</option>
					             <option value="12">오후 12:00</option>
					             <option value="13">오후 1:00</option>
					             <option value="14">오후 2:00</option>
					             <option value="15">오후 3:00</option>
					             <option value="16">오후 4:00</option>
					             <option value="17">오후 5:00</option>
					             <option value="18">오후 6:00</option>
					             <option value="19">오후 7:00</option>
				    		</select>
				        	<span>까지</span>
				        </div>
				        <div class="warning" id="max-time-warning">※일반 돌봄 하루 최대 이용시간은 8시간입니다.</div>
				        <div class="warning" id="min-time-warning">※일반 돌봄은 최소 2시간부터 이용 가능합니다.</div>
				    </div>
				
				    <button type="submit" class="btn btn-large" id="primary-search-btn">시터 찾기</button>
			    </form>
			</div>
		</div>
		
		<!-- 캐러셀 영역 추가 -->
		<div class="carousel-container">
		    <button class="main-carousel-arrow main-carousel-prev" onclick="prevSlide()"><i class="fas fa-chevron-left"></i></button>
		    <button class="main-carousel-arrow main-carousel-next" onclick="nextSlide()"><i class="fas fa-chevron-right"></i></button>
		    <div class="carousel-slide">
		        <div class="carousel-item">
		            <h3>긴급 돌봄 서비스</h3>
		            <p>갑작스러운 일정으로 급하게 돌봄이 필요할 때<br>빠르게 시터를 연결해 드립니다.</p>
		            <button class="btn gen-btn-small">긴급 돌봄 이용하기</button>
		        </div>
		        <div class="carousel-item">
		            <h3>정기 돌봄 할인 혜택</h3>
		            <p>월 8회 이상 정기 이용 시<br>이용료 10% 할인 혜택을 드립니다.</p>
		            <button class="btn gen-btn-small">정기 돌봄 신청하기</button>
		        </div>
		        <div class="carousel-item">
		            <h3>이달의 우수 시터</h3>
		            <p>학부모님들의 높은 평가를 받은<br>이달의 우수 시터를 만나보세요.</p>
		            <button class="btn gen-btn-small">우수 시터 보기</button>
		        </div>
		    </div>
		    <div class="carousel-controls">
		        <div class="carousel-dot active" onclick="goToSlide(0)"></div>
		        <div class="carousel-dot" onclick="goToSlide(1)"></div>
		        <div class="carousel-dot" onclick="goToSlide(2)"></div>
		    </div>
		</div>
		
		<!-- 추천 시터 영역 -->
		<div class="box-filter">
		    <div class="box-header">
		        <div class="section-icon"><i class="fas fa-medal"></i></div>
		        <h2 class="section-title">우수 시터 추천</h2>
		    </div>
		    
		    <div class="sitter-carousel-container">
		        <button class="arrow-btn prev-btn" onclick="prevSitter()"><i class="fas fa-chevron-left"></i></button>
		        <button class="arrow-btn next-btn" onclick="nextSitter()"><i class="fas fa-chevron-right"></i></button>
		        
		        <div class="sitter-carousel">
		            <!-- 시터 1 -->
		            <div class="sitter-item">
		                <div class="sitter-photo">
		                    <img src="/api/placeholder/100/100" alt="김지민 시터">
		                </div>
		                <div class="sitter-info">
		                    <div class="sitter-name">김지민 시터 <span class="star-rating"><i class="fas fa-star"></i> 4.9</span></div>
		                    <div class="sitter-details">
		                        <div><span class="badge female">여성</span> <span class="badge">5년 경력</span> <span class="badge">유아교육과</span></div>
		                        <div>돌봄 가능 연령: 12개월 ~ 7세</div>
		                        <div>주요 활동: 동화책 읽기, 유아 미술, 야외활동</div>
		                        <div>특이사항: 영어 가능, 응급처치 자격증 보유</div>
		                    </div>
		                </div>
		            </div>
		            
		            <!-- 시터 2 -->
		            <div class="sitter-item">
		                <div class="sitter-photo">
		                    <img src="/api/placeholder/100/100" alt="박서준 시터">
		                </div>
		                <div class="sitter-info">
		                    <div class="sitter-name">박서준 시터 <span class="star-rating"><i class="fas fa-star"></i> 4.8</span></div>
		                    <div class="sitter-details">
		                        <div><span class="badge male">남성</span> <span class="badge">3년 경력</span> <span class="badge">체육교육과</span></div>
		                        <div>돌봄 가능 연령: 24개월 ~ 12세</div>
		                        <div>주요 활동: 야외 놀이, 스포츠 활동, 학습 지도</div>
		                        <div>특이사항: 체육 전문, 수영 강사 자격증 보유</div>
		                    </div>
		                </div>
		            </div>
		            
		            <!-- 시터 3 -->
		            <div class="sitter-item">
		                <div class="sitter-photo">
		                    <img src="/api/placeholder/100/100" alt="이서연 시터">
		                </div>
		                <div class="sitter-info">
		                    <div class="sitter-name">이서연 시터 <span class="star-rating"><i class="fas fa-star"></i> 4.9</span></div>
		                    <div class="sitter-details">
		                        <div><span class="badge female">여성</span> <span class="badge">7년 경력</span> <span class="badge">아동심리학</span></div>
		                        <div>돌봄 가능 연령: 6개월 ~ 10세</div>
		                        <div>주요 활동: 놀이 치료, 발달 활동, 독서 지도</div>
		                        <div>특이사항: 심리 상담사 자격증, 특수아동 돌봄 가능</div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!-- 공지사항 및 시터 검색 영역 -->
		<div class="content-row">
		    <!-- 공지사항 간단 리스트로 보여주기 -->
		    <div class="box-main">
		        <div class="box-header">
		            <div class="section-icon"><i class="fas fa-bullhorn"></i></div>
		            <h2 class="section-title">공지사항</h2>
		            <a href="/notice.action" class="more-link">더보기 <i class="fas fa-angle-right"></i></a>
		        </div>
		        <ul class="notice-list">
		            <li class="notice-item">
		                <div class="notice-title"><span class="notice-badge">공지</span>5월 가정의 달 이벤트 안내</div>
		                <div class="notice-date">2025.04.15</div>
		            </li>
		            <li class="notice-item">
		                <div class="notice-title">시터 자격 검증 절차 강화 안내</div>
		                <div class="notice-date">2025.04.10</div>
		            </li>
		            <li class="notice-item">
		                <div class="notice-title">어린이날 특별 돌봄 서비스 안내</div>
		                <div class="notice-date">2025.04.05</div>
		            </li>
		            <li class="notice-item">
		                <div class="notice-title">돌봄 서비스 이용료 조정 안내</div>
		                <div class="notice-date">2025.04.01</div>
		            </li>
		            <li class="notice-item">
		                <div class="notice-title">시스템 점검 안내 (4/30 오전 2시~4시)</div>
		                <div class="notice-date">2025.03.25</div>
		            </li>
		        </ul>
		    </div>
		
		    <!-- 시터 검색 및 최근 이용내역 -->
		    <div class="box-main">
		        <div class="box-header">
		            <div class="section-icon"><i class="fas fa-search"></i></div>
		            <h2 class="section-title">시터 이름으로 검색</h2>
		        </div>
		        <form action="/sittersearch.action" class="row-items">
		            <input type="text" id="search-name" placeholder="시터 이름을 입력하세요"/>
		            <button type="submit" class="btn gen-btn-small">검색</button>
		        </form>
		        
		        <div class="section-header" style="margin-top: 20px;">
		            <div class="section-icon"><i class="fas fa-history"></i></div>
		            <h2 class="section-title">최근 이용 내역</h2>
		        </div>
		        <div class="recent-history">
		            <div class="history-item">
		                <div class="history-info">
		                    <div><span class="tag tag-regular">일반</span> <span class="history-date">2025.04.15</span></div>
		                    <div class="history-sitter">김지민 시터</div>
		                </div>
		                <button class="btn gen-btn-small">재신청</button>
		            </div>
		            <div class="history-item">
		                <div class="history-info">
		                    <div><span class="tag tag-emergency">긴급</span> <span class="history-date">2025.04.01</span></div>
		                    <div class="history-sitter">박서준 시터</div>
		                </div>
		                <button class="btn gen-btn-small">재신청</button>
		            </div>
		        </div>
		    </div>
		</div>
		
		<!-- 이용 가이드 -->
		<div class="box-filter">
		    <div class="box-header">
		        <div class="section-icon"><i class="fas fa-info-circle"></i></div>
		        <h2 class="section-title">이용 가이드</h2>
		    </div>
		    <div style="display: flex; justify-content: space-between; gap: 20px; margin-top: 10px;">
		        <div style="flex: 1; text-align: center; padding: 15px; background: #f9f0f2; border-radius: 8px;">
		            <div><i class="fas fa-calendar-check" style="font-size: 24px; color: #e28c99; margin-bottom: 10px;"></i></div>
		            <h3 style="margin-bottom: 10px; font-size: 16px;">예약 신청</h3>
		            <p style="font-size: 14px; color: #666;">희망 날짜와 시간을 선택하고 필터를 통해 시터를 검색합니다.</p>
		        </div>
		        <div style="flex: 1; text-align: center; padding: 15px; background: #f0f8ff; border-radius: 8px;">
		            <div><i class="fas fa-user-check" style="font-size: 24px; color: #5199e4; margin-bottom: 10px;"></i></div>
		            <h3 style="margin-bottom: 10px; font-size: 16px;">시터 선택</h3>
		            <p style="font-size: 14px; color: #666;">시터의 프로필과 리뷰를 확인하고 돌봄 서비스를 신청합니다.</p>
		        </div>
		        <div style="flex: 1; text-align: center; padding: 15px; background: #f3f0f9; border-radius: 8px;">
		            <div><i class="fas fa-credit-card" style="font-size: 24px; color: #8265b5; margin-bottom: 10px;"></i></div>
		            <h3 style="margin-bottom: 10px; font-size: 16px;">결제 진행</h3>
		            <p style="font-size: 14px; color: #666;">신청 내용 확인 후 결제를 진행합니다. 카드 결제가 기본입니다.</p>
		        </div>
		        <div style="flex: 1; text-align: center; padding: 15px; background: #f0f9f5; border-radius: 8px;">
		            <div><i class="fas fa-child" style="font-size: 24px; color: #4caf50; margin-bottom: 10px;"></i></div>
		            <h3 style="margin-bottom: 10px; font-size: 16px;">돌봄 진행</h3>
		            <p style="font-size: 14px; color: #666;">예약한 날짜와 시간에 시터가 방문하여 돌봄을 진행합니다.</p>
		        </div>
		    </div>
		</div>
	</div>
</div>

</body>
</html>