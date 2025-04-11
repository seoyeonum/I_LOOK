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
<title>genSearchResult.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gen-filter.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	// 페이지가 로드되면
    $(document).ready(function()
    {
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
    	
		//-------------------------------
        
        // 날짜 선택 제한
    	
     	// Date() → 오늘 날짜 객체 생성
        var today = new Date();
        
        // 오늘로부터 4일 후 (최소 날짜)
        var minDate = new Date(today);
        minDate.setDate(today.getDate() + 4);
        
        // 오늘로부터 34일 후 (최대 날짜)
        var maxDate = new Date(today);
        maxDate.setDate(today.getDate() + 34);
        
        // 최소, 최대 날짜 설정
        var minDateStr = formatDate(minDate);
        var maxDateStr = formatDate(maxDate);
        
        // 시작 날짜와 종료 날짜 입력 → min, max 속성 설정
        $('#date-start').attr('min', minDateStr);
        $('#date-start').attr('max', maxDateStr);
        $('#date-end').attr('min', minDateStr);
        $('#date-end').attr('max', maxDateStr);
        
        // 시작 날짜 선택 시 종료 날짜는 최소값 표기
        $('#date-start').on('change', function()
        {
            var startDate = $(this).val();
            $('#date-end').attr('min', startDate);
            
            // 만약 종료 날짜가 새로운 시작 날짜보다 이전이면 종료 날짜를 시작 날짜와 같게 설정
            if ($('#date-end').val() < startDate)
            {
                $('#date-end').val(startDate);
            }
        });
        
        
        
		//-------------------------------
        
        // 시간 선택 제한
        
     	// 경고 메시지 요소 기본적으로 숨기기
        $('#time-warning').hide();
        
        // 시작 시간, 종료 시간 변경 시 검사 실행
        $('#time-start').on('change', checkTimeDiff);
        $('#time-end').on('change', checkTimeDiff);
        
        // 폼 제출 시 유효성 검사
        $('#primary-filter-form').on('submit', function(event)
        {
            // 시간 차이 재확인
            if ($('#time-start').val() && $('#time-end').val())
            {
                var startHour = parseInt($('#time-start').val());
                var endHour = parseInt($('#time-end').val());
                var hourDiff = endHour - startHour;
                
                // 8시간 초과면 제출 막기
                if (hourDiff > 8)
           		{
                	// 경고 팝업
                	alert('일반 돌봄 하루 최대 이용시간은 8시간입니다.');
                	event.preventDefault(); // 폼 제출 막기
	            }
	        }
        });
        
        
        //-------------------------------
        
        
    	// 토글 처리 - 시터 등급
  		$("#toggle-grade").click(function() {
        	//$("#checkbox-grade").toggle();			// 일반 토글 모션 처리
  			$("#checkbox-grade").slideToggle(500);		// 부드러운 토글 모션 처리 (괄호는 밀리초 단위 처리 속도)
    	});
  		
  		// 토글 처리 - 시터 근무 선호 지역
  		$("#toggle-region").click(function() {
        	$("#checkbox-region").slideToggle(750);
    	});
  		
  		// 토글 처리 - 시터 성별 
  		$("#toggle-gender").click(function() {
        	$("#checkbox-gender").slideToggle(500);
    	});
  		
  		// 토글 처리 - 시터 연령대 
  		$("#toggle-age").click(function() {
        	$("#checkbox-age").slideToggle(500);
    	});
  	
  		// 토글 처리 - 시터 보유 자격증 
  		$("#toggle-cert").click(function() {
        	$("#checkbox-cert").slideToggle(500);
    	});
  		
  		// 토글 처리 - 전체 돌봄 비용
  		$("#toggle-price").click(function() {
        	$("#range-price").slideToggle(500);
    	});
  		
	  	// 가격 range 값 변경 시 current-price로 표시
  	    $('input[name="price"]').on('input', function()
  	    {
  	        var value = $(this).val();
  	        
  	        // 숫자 단위 구분자 포맷으로 전환
  	        var formatValue = Number(value).toLocaleString('ko-KR');
  	        $('#current-price').text(formatValue + '원');
  	    });
  	    
  	    // 가격 초기 설정
  	    var initialPrice = $('input[name="price"]').val();
  	    var formattedInitialPrice = Number(initialPrice).toLocaleString('ko-KR');
  	    $('#current-price').text(formattedInitialPrice + '원');
	});
	
 	// 함수 1.시간 차이 검사 함수
    function checkTimeDiff()
    {
        // 두 시각이 모두 선택되었다면,
        if ($('#time-start').val() && $('#time-end').val())
        {
            // 시간 계산
            var startHour = parseInt($('#time-start').val());
            var endHour = parseInt($('#time-end').val());
            var hourDiff = endHour - startHour;
            
            // 시간 차가 8시간 초과라면,
            if (hourDiff > 8)
            {
                // 경고 표시
                $('#time-warning').show();
            }
            else
            {
                // 경고 숨기기
                $('#time-warning').hide();
            }
        }
    }
	
 	// 함수 2.날짜 → YYYY-MM-DD 형식으로 변환
    function formatDate(date)
    {
        var year = date.getFullYear();
        var month = String(date.getMonth() + 1).padStart(2, '0');		//-- LPAD 와 같다.
        var day = String(date.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
    }
 	
 	// 함수 3.돌봄 신청 클릭 시 새 창(genRegDetail.jsp) 열기
    function openDetailWindow(sitterId)
 	{
        // 두 번째 파라미터 : '_blank' → 새 창 열기
        // 세 번째 파라미터 : 창 옵션 (크기, 스크롤바 등)
        window.open('./genRegDetail.jsp?sitterId=' + sitterId, '_blank', 'width=640,height=500');
    }
  
</script>
</head>
<body>

<!-- parentMainFrame.html을 삽입할 위치 -->
<div id="header-container">
	<c:import url="./parentMainFrame.html" charEncoding="UTF-8" />
</div>

<div id="body-container">
	<div id="wrapper-header">
		<div class="main-subject">
			<h1>일반 돌봄 서비스</h1>
		</div>
	</div>
	
	<div id="wrapper-body">
		<!-- (main) 일반 돌봄 1차 필터 -->
		<div class="box-filter">
			<div class="sub-subject">
				<h2>1차 필터</h2>
			</div>
			<div class="sub-body">
			    <form action="" id="primary-filter-form">
			    	<div class="form-group">
				        <div class="label">돌봄 희망 아이</div>
				        <div class="child-range">
				        	<select id="child-name" required="required">
					             <option value="">아이 선택</option>
					             <option value="1">김창식</option>
					             <option value="2">김충식</option>
					             <option value="3">김민식</option>
					             <option value="4">김주식</option>
					    	</select>
				    	</div>
				    </div>
				    
					<div class="form-group">
				        <div class="label">돌봄 희망 날짜</div>
				        <div class="date-range">
				        	<input type="date" id="date-start" required="required">
				        	<span>부터</span>
				        	<input type="date" id="date-end" required="required">
				        	<span>까지</span>
				    	</div>
				    </div>
				
				    <div class="form-group">
				    	<div class="label">돌봄 희망 시간</div>
				     	<div class="time-range">
				        	<select id="time-start" required="required">
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
					      	<span>부터</span>
					      	<select id="time-end" required>
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
				        <div class="warning" id="time-warning">※일반 돌봄 하루 최대 이용시간은 8시간입니다.</div>
				    </div>
				
				    <button type="submit" class="btn" id="primary-search-btn">시터 찾기</button>
			    </form>
			</div>
		</div>
	</div>
	
	<div id="wrapper-body">
		
		<!-- (side) 일반 돌봄 2차 필터 -->
		<div class="box-side">
			<div class="sub-subject">
		    	<h2>2차 필터</h2>
		    </div>
		    <div class="sidebar">
		    <form action="" id="secondary-filter-form">
			    <div class="form-group">
			    	<div class="label" id="toggle-grade">시터 등급</div>
			        <div class="checkbox-group" id="checkbox-grade">
			            <label class="checkbox-label">
			                <input type="checkbox" name="grade" value="rookie" checked="checked">신입
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="grade" value="bronze" checked="checked">브론즈
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="grade" value="silver" checked="checked">실버
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="grade" value="gold" checked="checked">골드
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="grade" value="platinum" checked="checked">플래티넘
			            </label>
			        </div>
			    </div>
			    
				<div class="form-group">
					<div class="label" id="toggle-region">근무 지역</div>
					<div class="checkbox-group"  id="checkbox-region">
			            <label class="checkbox-label">
			                <input type="checkbox" name="region" value="1" checked="checked" autocomplete="off">강남구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="2" checked="checked" autocomplete="off">강동구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="3" checked="checked" autocomplete="off">강북구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="4" checked="checked" autocomplete="off">강서구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="5" checked="checked" autocomplete="off">관악구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="6" checked="checked" autocomplete="off">광진구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="7" checked="checked" autocomplete="off">구로구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="8" checked="checked" autocomplete="off">금천구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="9" checked="checked" autocomplete="off">노원구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="10" checked="checked" autocomplete="off">도봉구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="11" checked="checked" autocomplete="off">동대문구 
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="12" checked="checked" autocomplete="off">동작구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="13" checked="checked" autocomplete="off">마포구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="14" checked="checked" autocomplete="off">서대문구 
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="15" checked="checked" autocomplete="off">서초구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="16" checked="checked" autocomplete="off">성동구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="17" checked="checked" autocomplete="off">성북구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="18" checked="checked" autocomplete="off">송파구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="19" checked="checked" autocomplete="off">양천구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="20" checked="checked" autocomplete="off">영등포구 
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="21" checked="checked" autocomplete="off">용산구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="22" checked="checked" autocomplete="off">은평구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="23" checked="checked" autocomplete="off">종로구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="24" checked="checked" autocomplete="off">중구   
			            </label>                                          
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="25" checked="checked" autocomplete="off">중랑구   
			            </label>
			        </div>                                                            
				</div>                                                                          
				<div class="form-group">
					<div class="label" id="toggle-gender">시터 성별</div>
					<div class="checkbox-group" id="checkbox-gender">
			            <label class="checkbox-label">
			                <input type="checkbox" name="gender" value="male" checked="checked">남성
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="gender" value="female" checked="checked">여성
			            </label>
			        </div>
				</div>
				<div class="form-group">
					<div class="label" id="toggle-age">시터 연령대</div>
					<div class="checkbox-group" id="checkbox-age">
			            <label class="checkbox-label">
			                <input type="checkbox" name="age" value="20" checked="checked">20대
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="age" value="30" checked="checked">30대
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="age" value="40" checked="checked">40대
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="age" value="50" checked="checked">50대
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="age" value="60" checked="checked">60대 이상
			            </label>
			        </div>
				</div>
				<div class="form-group">
					<div class="label" id="toggle-cert">시터 보유 자격증</div>
					<div class="checkbox-group" id="checkbox-cert">
			            <label class="checkbox-label">
			                <input type="checkbox" name="cert" value="1" checked="checked">보육 교사 1급 (특수)
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="cert" value="2" checked="checked">보육 교사 1급
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="cert" value="3" checked="checked">보육 교사 2급 (특수)
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="cert" value="4" checked="checked">보육 교사 2급
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="cert" value="5" checked="checked">특수 교사
			            </label>
			        </div>
				</div>
				<div class="form-group">
					<div class="label" id="toggle-price">전체 돌봄 비용</div>
			        <div class="range-group" id="range-price">
			        	<label class="range-label">
							<input type="range" name="price" min="0" max="1082240" step="50000" value="1340000">
						</label>
						<label class="range-label">
				            <span>0</span>
				            <span id="current-price">0원</span>
				            <span>MAX</span>
			            </label>
			        </div>
				</div>
	
				<button type="submit" class="btn" id="secondary-searh-btn">필터 적용</button>
			</form>
			</div>
		</div>
		
		<!-- 검색 결과 -->
	    <div class="gen-results">
	    	<div class="sub-subject">
	        	<h2>검색 결과 (3)</h2>
	        </div>
	        
	        <!-- 일반 돌봄 각 등록 건 -->
	       	<!-- <form action="./genRegDetail.jsp"> -->
		        <div class="box-preview">
		            <div class="sitter-photo">
		                <img src="./images/sit01.jpg" alt="시터 사진">
		            </div>
		            <div class="sitter-info">
		                <div class="sitter-name">김탄</div>
		                <div class="sitter-details">
		                    <div><img src="" alt="🥉">브론즈 시터</div>		<!-- 대체 텍스트 수정 필요 -->
		                	<div>최근 평점 ⭐4.9 (7건)</div>
		                    <div>전체 평점 ⭐4.76 (123건)</div>
		                	<div>돌봄 등록 일자: 📆2025.03.31.~2025.04.11.</div>
		                    <div>돌봄 등록 시간: ⏰오전 9시 ~ 오후 2시</div>
		                </div>
		                <button type="submit" class="btn gen-btn-small" onclick="openDetailWindow(1)">돌봄 신청</button>
		            </div>
		        </div>
				<div class="box-preview">
		            <div class="sitter-photo">
		                <img src="./images/sit02.jpg" alt="시터 사진">
		            </div>
		            <div class="sitter-info">
		                <div class="sitter-name">차은상</div>
		                <div class="sitter-details">
		                    <div><img src="" alt="🥈">실버 시터</div>	<!-- 대체 텍스트 수정 필요 -->
		                    <div>최근 평점 ⭐4.3 (3건)</div>
		                    <div>전체 평점 ⭐4.56 (290건)</div>
		                	<div>돌봄 등록 일자: 📆2025.03.31.~2025.04.11.</div>
		                    <div>돌봄 등록 시간: ⏰오전 9시 ~ 오후 2시</div>
		                </div>
		                <button type="submit" class="btn gen-btn-small"  onclick="openDetailWindow(2)">돌봄 신청</button>
		            </div>
		        </div>
		        <div class="box-preview">
		            <div class="sitter-photo">
		                <img src="./images/sit03.jpg" alt="시터 사진">
		            </div>
		            <div class="sitter-info">
		                <div class="sitter-name">최영도</div>
		                <div class="sitter-details">
		                    <div><img src="" alt="🌱">신입 시터</div>	<!-- 대체 텍스트 수정 필요 -->
		                    <div>최근 평점 ⭐4.8 (3건)</div>
		                    <div>전체 평점 ⭐4.5 (3건)</div>
		                	<div>돌봄 등록 일자: 📆2025.03.31.~2025.04.11.</div>
		                    <div>돌봄 등록 시간: ⏰오전 9시 ~ 오후 2시</div>
		                </div>
		                <button type="button" class="btn gen-btn-small" onclick="openDetailWindow(3)">돌봄 신청</button>
		            </div>
		        </div>
		    <!-- </form> -->
	    </div>
		
	</div>
</div>

</body>
</html>