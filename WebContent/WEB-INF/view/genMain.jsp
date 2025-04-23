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
       
        // id가 'gen'인 버튼을 선택
        var button = document.querySelector('#gen');

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

<!-- parentMainFrame.html을 삽입할 위치 -->
<div id="header-container">
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
					    		<c:forEach var="name" items="${listName}">
					            <option value="${name.child_backup_id}">${name.name}</option>
								</c:forEach>
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
					    	</select>
					      	<span>부터</span>
					      	<select name="end_time" id="time-end" required="required">
					             <option value="">종료 시간</option>
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
				        <div class="warning" id="min-time-warning">※일반 돌봄은 최소 1시간부터 이용 가능합니다.</div>
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
		                    <img src="<%= cp %>/images/pictures/sit_photoTEST0000.jpg" alt="김지민 시터">
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
		        
		        <div class="section-header" style="margin-top: 10px;">
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