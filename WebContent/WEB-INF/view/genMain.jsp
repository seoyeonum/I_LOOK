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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    // 페이지가 로드되면 parentMainFrame.html을 불러오기
    // jQuery
    /* 
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
    	
    	
	});
    */
    
    // 이 페이지 로드 시,
    document.addEventListener('DOMContentLoaded', function()
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
        
    });
    
 	// 날짜 → YYYY-MM-DD 형식으로 변환
    function formatDate(date)
    {
        var year = date.getFullYear();
        var month = String(date.getMonth() + 1).padStart(2, '0');		//-- LPAD 와 같다.
        var day = String(date.getDate()).padStart(2, '0');
        return year + '-' + month + '-' + day;
    }
 	
 	// 시간 차이 검사 함수
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
 
</script>
</head>
<body>

<!-- parentMainFrame.html을 삽입할 위치 -->
<div id="header-container">
	<c:import url="./parentMainFrame.html" charEncoding="UTF-8" />
</div>
<!-- → jstl import 구문으로 변경 -->

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
			    <form action="./genSearchResult.jsp" id="primary-filter-form">
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
					    	</select>
					      	<span>부터</span>
					      	<select id="time-end" required="required">
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
				
				    <button type="submit" class="btn btn-large" id="primary-search-btn">시터 찾기</button>
			    </form>
			</div>
		</div>
		
		<!-- 공지사항 간단 리스트로 보여주기 -->
		<div class="box-main">
			<h2>공지사항</h2>
			공지사항 list 여기에 출력하기		
		</div>
		
		<!-- 현재 시터의 근무 등록 중 시터 이름으로 검색 -->
		<div class="box-main">
			<h2>시터 이름으로 검색</h2>
			<form action="" class="row-items">
				<input type="text" id="search-name" placeholder="(이름을 입력하세요.)"/>
				<button type="submit" class="btn gen-btn-small">시터 찾기</button>
			</form>
		</div>
		
	</div>
</div>

</body>
</html>