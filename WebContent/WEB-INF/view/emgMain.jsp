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
<title>emgMain.jsp</title>
<link rel="stylesheet" type="text/css" href="<%= cp %>/css/gen-filter.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
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
	   
	    // id가 'emg'인 버튼을 선택
	    var button = document.querySelector('#emg');
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

<div id="header-container">
	<c:import url="/sitterheader.action"/>
</div>

<div id="body-container">
	<div id="wrapper-header">
		<div class="main-subject">
			<h1>시터 메인 페이지</h1>
		</div>
	</div>
	
	<div class="banner-section">
	    <div class="banner-content">
	        <h3 class="banner-title">${sitName} 시터님, 환영합니다!</h3>
	        <p class="banner-text">오늘도 아이들에게 행복한 시간을 선물해 주세요.<br>시터님의 따뜻한 돌봄이 아이들의 미래를 밝게 합니다.</p>
	        <!-- <button class="btn emg-btn-small">시터 가이드 보기</button> -->
	    </div>
	    <div class="banner-image"></div>
	</div>
	
	<div id="wrapper-body">
        <!-- 긴급 돌봄 요청 리스트 -->
		<div class="box-filter">
			<div class="box-header">
		        <div class="section-icon"><i class="fas fa-exclamation-circle"></i></div>
		        <h2 class="section-title">긴급 돌봄 요청 리스트</h2>
		    </div>
			<div class="emergency-requests">
			    <!-- 긴급 돌봄 요청 1 -->
			    <div class="request-item urgent">
			        <div class="request-info">
			            <div class="request-status"><span class="badge emergency">긴급</span> <span class="time-left">2시간 이내</span></div>
			            <div class="request-title">오늘 오후 3시부터 4시간 돌봄 요청</div>
			            <div class="request-details">
			                <div><i class="fas fa-map-marker-alt"></i> 서울시 강남구</div>
			                <div><i class="fas fa-child"></i> 5세 여아</div>
			                <div><i class="fas fa-clock"></i> 15:00 ~ 19:00</div>
			            </div>
			        </div>
			        <div class="request-action">
			            <!-- <div class="payment-info">시급 15,000원</div> -->
			            <!-- <button class="btn emg-btn-small">신청하기</button> -->
			        </div>
			    </div>
			    
			    <!-- 긴급 돌봄 요청 2 -->
			    <div class="request-item">
			        <div class="request-info">
			            <div class="request-status"><span class="badge emergency">긴급</span> <span class="time-left">6시간 이내</span></div>
			            <div class="request-title">내일 오전 9시부터 3시간 돌봄 요청</div>
			            <div class="request-details">
			                <div><i class="fas fa-map-marker-alt"></i> 서울시 서초구</div>
			                <div><i class="fas fa-child"></i> 3세 남아, 7세 여아</div>
			                <div><i class="fas fa-clock"></i> 09:00 ~ 12:00</div>
			            </div>
			        </div>
			        <div class="request-action">
			            <!-- <div class="payment-info">시급 18,000원</div> -->
			            <!-- <button class="btn emg-btn-small">신청하기</button> -->
			        </div>
			    </div>
			    
			    <!-- 긴급 돌봄 요청 3 -->
			    <div class="request-item">
			        <div class="request-info">
			            <div class="request-status"><span class="badge emergency">긴급</span> <span class="time-left">12시간 이내</span></div>
			            <div class="request-title">내일 오후 2시부터 4시간 돌봄 요청</div>
			            <div class="request-details">
			                <div><i class="fas fa-map-marker-alt"></i> 서울시 송파구</div>
			                <div><i class="fas fa-child"></i> 2세 남아</div>
			                <div><i class="fas fa-clock"></i> 14:00 ~ 18:00</div>
			            </div>
			        </div>
			        <div class="request-action">
			            <!-- <div class="payment-info">시급 16,000원</div> -->
			            <!-- <button class="btn emg-btn-small">신청하기</button> -->
			        </div>
			    </div>
			    
			    <div class="see-more-container">
			        <a href="emgreqlist.action" class="see-more-link">더보기 <i class="fas fa-angle-right"></i></a>
			    </div>
			</div>
		</div>
		
		<!-- 캐러셀 영역 -->
		<div class="carousel-container">
		    <button class="main-carousel-arrow main-carousel-prev" onclick="prevSlide()"><i class="fas fa-chevron-left"></i></button>
		    <button class="main-carousel-arrow main-carousel-next" onclick="nextSlide()"><i class="fas fa-chevron-right"></i></button>
		    <div class="carousel-slide">
		        <div class="carousel-item">
		            <h3>우수 시터 혜택</h3>
		            <p>매달 우수 시터로 선정되시면<br>추가 수당과 다양한 혜택을 드립니다.</p>
		            <!-- <button class="btn emg-btn-small">혜택 알아보기</button> -->
		        </div>
		        <div class="carousel-item">
		            <h3>시터 교육 프로그램</h3>
		            <p>전문성을 높이는 교육 프로그램에<br>무료로 참여하실 수 있습니다.</p>
		            <!-- <button class="btn emg-btn-small">교육 신청하기</button> -->
		        </div>
		        <div class="carousel-item">
		            <h3>정기 돌봄 추천</h3>
		            <p>정기 돌봄을 맡으시면<br>안정적인 수입을 얻을 수 있습니다.</p>
		            <!-- <button class="btn emg-btn-small">정기 돌봄 신청하기</button> -->
		        </div>
		    </div>
		    <div class="carousel-controls">
		        <div class="carousel-dot active" onclick="goToSlide(0)"></div>
		        <div class="carousel-dot" onclick="goToSlide(1)"></div>
		        <div class="carousel-dot" onclick="goToSlide(2)"></div>
		    </div>
		</div>
		
		<!-- 공지사항 및 스케줄 영역 -->
		<div class="content-row">
		    <!-- 공지사항 간단 리스트로 보여주기 -->
		    <div class="box-main">
		        <div class="box-header">
		            <div class="section-icon"><i class="fas fa-bullhorn"></i></div>
		            <h2 class="section-title">공지사항</h2>
		            <a href="<%= cp %>/noticelist.action" class="more-link">더보기 <i class="fas fa-angle-right"></i></a>
		        </div>
		        <ul class="notice-list">
		            <li class="notice-item">
		                <div class="notice-title"><span class="notice-badge">공지</span>시터 평가 시스템 개편 안내</div>
		                <div class="notice-date">2025.04.18</div>
		            </li>
		            <li class="notice-item">
		                <div class="notice-title">5월 가정의 달 특별 수당 지급 안내</div>
		                <div class="notice-date">2025.04.15</div>
		            </li>
		            <li class="notice-item">
		                <div class="notice-title">아동학대 예방 교육 의무화 안내</div>
		                <div class="notice-date">2025.04.10</div>
		            </li>
		            <li class="notice-item">
		                <div class="notice-title">시터 자격증 갱신 절차 안내</div>
		                <div class="notice-date">2025.04.05</div>
		            </li>
		            <li class="notice-item">
		                <div class="notice-title">시스템 점검 안내 (4/30 오전 2시~4시)</div>
		                <div class="notice-date">2025.03.25</div>
		            </li>
		        </ul>
		    </div>
		
		    <!-- 나의 스케줄 및 활동 영역 -->
		    <div class="box-main">
		        <div class="box-header">
		            <div class="section-icon"><i class="fas fa-calendar-alt"></i></div>
		            <h2 class="section-title">나의 스케줄</h2>
		            <a href="/mysitter/schedule.action" class="more-link">전체보기 <i class="fas fa-angle-right"></i></a>
		        </div>
		        <div class="schedule-container">
		            <div class="schedule-date">오늘 (4월 23일)</div>
		            
		            <div class="schedule-item active">
		                <div class="schedule-time">09:00 - 12:00</div>
		                <div class="schedule-info">
		                    <div class="schedule-child">김민준 (4세)</div>
		                    <div class="schedule-location">강남구 삼성동</div>
		                </div>
		                <div class="schedule-status">진행중</div>
		            </div>
		            
		            <div class="schedule-item upcoming">
		                <div class="schedule-time">15:00 - 18:00</div>
		                <div class="schedule-info">
		                    <div class="schedule-child">이지아 (6세)</div>
		                    <div class="schedule-location">서초구 반포동</div>
		                </div>
		                <div class="schedule-status">예정</div>
		            </div>
		            <!-- 
		            <div class="schedule-date">내일 (4월 24일)</div>
		            
		            <div class="schedule-item">
		                <div class="schedule-time">10:00 - 15:00</div>
		                <div class="schedule-info">
		                    <div class="schedule-child">박수민 (3세), 박준호 (5세)</div>
		                    <div class="schedule-location">송파구 잠실동</div>
		                </div>
		                <div class="schedule-status">예정</div>
		            </div>
		            -->
		        </div>
		    </div>
		</div>
		
		<!-- 돌봄 팁 및 가이드 -->
		<div class="box-filter">
		    <div class="box-header">
		        <div class="section-icon"><i class="fas fa-lightbulb"></i></div>
		        <h2 class="section-title">시터를 위한 돌봄 팁</h2>
		    </div>
		    <div class="care-tips-container">
		        <div class="care-tip">
		            <div class="care-tip-icon"><i class="fas fa-heart"></i></div>
		            <div class="care-tip-content">
		                <h3>연령별 돌봄 방법</h3>
		                <p>영유아부터 초등학생까지 연령별로 적합한 돌봄 방법과 활동을 알아보세요.</p>
		                <a href="#" class="tip-link">자세히 보기</a>
		            </div>
		        </div>
		        <div class="care-tip">
		            <div class="care-tip-icon"><i class="fas fa-medkit"></i></div>
		            <div class="care-tip-content">
		                <h3>응급 상황 대처법</h3>
		                <p>아이들과 함께할 때 발생할 수 있는 응급 상황에 대비한 기본 대처법을 숙지하세요.</p>
		                <a href="#" class="tip-link">자세히 보기</a>
		            </div>
		        </div>
		        <div class="care-tip">
		            <div class="care-tip-icon"><i class="fas fa-book-reader"></i></div>
		            <div class="care-tip-content">
		                <h3>교육적인 놀이 활동</h3>
		                <p>아이의 발달을 돕는 재미있고 교육적인 놀이 활동들을 소개합니다.</p>
		                <a href="#" class="tip-link">자세히 보기</a>
		            </div>
		        </div>
		    </div>
		</div>
	</div>
</div>

</body>
</html>