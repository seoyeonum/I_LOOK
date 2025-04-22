<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	String grade = (String)request.getAttribute("grade");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>genRegInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">

<!-- 달력 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
<script src="https://cdn.jsdelivr.net/npm/flatpickr/dist/l10n/ko.js"></script>
<!-- 제이쿼리 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">
/* 기본 스타일 */
* {
    box-sizing: border-box;
}

body {
    margin: 0;
    padding: 0;
    background-color: #f8f9fa;
}

/* 레이아웃 스타일 */
#wrapper {
    position: relative;
    width: 60%;
    min-width: 800px;
    margin: 0 auto;
    padding: 0 20px;
    background-color: #fff;
    box-shadow: 0 0 10px rgba(0,0,0,0.05);
    border-radius: 8px;
}

/* 헤더 스타일 */
#header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    border-bottom: 2px solid #eee;
    padding: 10px 0;
    margin-bottom: 20px;
}

.nav {
    display: flex;
    font-size: 18px;
}

.menuBtn {
    font-size: 16px;
    background: transparent;
    border: none;
    outline: none;
    margin: 0 15px;
    cursor: pointer;
    padding: 5px 10px;
    transition: color 0.3s;
}

.menuBtn:hover {
    color: rgb(226, 140, 153);
}

/* 구분선 스타일 */
.verification {
    width: 100%;
    height: 1px;
    background-color: #eee;
    margin: 15px 0;
}

/* 메인 콘텐츠 영역 */
#main {
    margin: 30px 0;
}

.regTitle {
    margin-bottom: 20px;
}

.regTitle h2 {
    font-size: 24px;
    margin-bottom: 10px;
    color: #333;
}

/* 컨테이너 스타일 */
.container {
    width: 90%;
    margin: 40px auto;
    padding: 20px;
    border: 1px solid #eee;
    border-radius: 8px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

.container-title h3 {
    margin-top: 0;
    margin-bottom: 10px;
    font-size: 20px;
    color: #333;
}

/* 그룹 레이아웃 */
.container-group {
    display: flex;
    justify-content: space-between;
    gap: 20px;
    margin-top: 15px;
}

.container-half {
    flex: 1;
}

.container-group-date {
    flex: 1;
}

/* 패널 라벨 스타일 */
.container-panel {
    margin: 15px 0 10px 0;
    font-weight: bold;
    color: #555;
}

/* 시간 그리드 스타일 */
.TimeGrid {
    display: grid;
    grid-template-columns: repeat(6, 1fr);
    gap: 8px;
    margin-top: 10px;
}

/* 버튼 스타일 */
.timeBtn, .ageBtn {
    background-color: white;
    border: 1px solid #ddd;
    border-radius: 4px;
    cursor: pointer;
    padding: 8px;
    transition: all 0.2s;
}

.timeBtn:hover, .ageBtn:hover {
    background-color: #f5f5f5;
}

.timeBtn.active, .ageBtn.active {
    background-color: #e9ecef;
    border-color: #ced4da;
    color: #495057;
}

/* 선호 연령대 버튼 */
.ageBtn {
    margin-right: 10px;
    margin-bottom: 10px;
    padding: 8px 15px;
}

/* 입력 필드 스타일 */
input[type="text"], textarea, select {
    width: 100%;
    padding: 10px;
    border: 1px solid #ddd;
    border-radius: 4px;
    font-size: 14px;
    margin-bottom: 5px;
}

select {
    width: 200px;
    padding: 8px;
    font-size: 14px;
    margin-right: 10px;
    display: inline-block;
}

textarea {
    resize: vertical;
    min-height: 120px;
}

/* 파일 업로드 스타일 */
input[type="file"] {
    padding: 10px 0;
}

/* 등록 버튼 */
#uploadBtn {
    display: block;
    margin: 30px auto;
    width: 150px;
    padding: 12px;
    font-size: 16px;
    background-color: #fff;
    color: #333;
    border: 1px solid #ddd;
    border-radius: 4px;
    cursor: pointer;
    transition: all 0.3s;
}

#uploadBtn:hover {
    background-color: #f5f5f5;
    border-color: #ccc;
}

/* 주의 사항 */
.required
{
	font-size: small;
	color: red;
}

</style>

<script>
	
	$(document).ready(function()
	{
		
		// 시작 날짜 선택
		var startDate = flatpickr("#startDate", 
		{
		    dateFormat: "Y-m-d H:i",	  // 시간나오려면 Y-m-d H:i
		    locale: "ko",
		   	enableTime: true,      // 시간 선택 가능
			time_24hr: true,
			
		});
		
		// 종료 날짜 선택
		var endDate = flatpickr("#endDate", 
		{
		    dateFormat: "Y-m-d",	  
		    locale: "ko"
		});
		
		// 하나만 선택가능, 선택 후 배경색 변환
	    $(".startTimeBtn").click(function() 
	    {
	    	
	        $(".startTimeBtn").removeClass("active");
	        $(this).addClass("active");
	        var selectedTime = $(this).val();
			$("#start_time").val(selectedTime);
	    });

		// 끝나는 시간 버튼
	    $(".endTimeBtn").click(function() 
	    {
	        $(".endTimeBtn").removeClass("active");
	        $(this).addClass("active");
	        var selectedTime = $(this).val();
			$("#end_time").val(selectedTime);
	    });
	    
	    // 나이 버튼
	    $(".ageBtn").click(function() 
	    {
	        $(".ageBtn").removeClass("active");
	        $(this).addClass("active");
	        var preferedAge = $(this).val();
			$("#age_type_id").val(preferedAge);
	    });
	    
	    
	    //------------------------------------------------
	    
		// 날짜 선택 제한
    	
     	// Date() → 오늘 날짜 객체 생성
        var today = new Date();
        
        // 오늘로부터 4일 후 (최소 날짜)
        var minDate = new Date(today);
        minDate.setDate(today.getDate() + 4);
        
        // 오늘로부터 93일 후 (최대 날짜)
        var maxDate = new Date(today);
        maxDate.setDate(today.getDate() + 93);
        
        // 최소, 최대 날짜 설정
        var minDateStr = formatDate(minDate);
        var maxDateStr = formatDate(maxDate);
        
        // 시작 날짜와 종료 날짜 입력 → min, max 속성 설정
        $('#start_date').attr('min', minDateStr);
        $('#start_date').attr('max', maxDateStr);
        $('#end_date').attr('min', minDateStr);
        $('#end_date').attr('max', maxDateStr);
        
        // 시작 날짜 선택 시 종료 날짜는 최소값 표기
        $('#start_date').on('change', function()
        {
            var startDate = $(this).val();
            $('#end_date').attr('min', startDate);
            
            // 만약 종료 날짜가 새로운 시작 날짜보다 이전이면 종료 날짜를 시작 날짜와 같게 설정
            if ($('#end_date').val() < startDate)
            {
                $('#end_date').val(startDate);
            }
            
            // 날짜 계산해서 31일 이상이면 선택 못하게 막기.
            var startDate = $('#start_date').val();
            var endDate = $('#end_date').val();
            
            //alert(startDate);
            //alert(endDate - startDate);
            if (getDateDiff(startDate, endDate) >= 31)
			{
				alert("시터는 근무 기간을 31일 이상 설정할 수 없습니다.");
				$('#start_date').val(endDate);
			}
            
        });
        //---------------------------------------------------------------------
        
        
        // 자기소개 글자 제한
        $("#introduction").keyup(function()
		{
        	charLimit("#introduction", "#limit2", 500);	
		});
        
        // 제목 글자 제한
        $("#title").keyup(function()
		{
        	charLimit("#title", "#limit", 33);	
		});
        //---------------------------------------------------------------
        
        
	    // 등록 버튼 누르면 벌어지는 일.
	    $("#uploadBtn").click(function()
		{
	    	// 제목 적으세요
	    	if (!$("#title").val())
			{
	    		alert("제목을 작성해 주십시오.");
				return;	
			}
	    	
	    	
	    	// 근무 시작 + 종료일 안 선택함
	    	if (!$("#end_date").val() || !$("#start_date").val())
			{
	    		alert("근무 날짜를 선택해 주십시오.");
	    		// 종료
				return;
			}
	    	
	    	
	    	// 근무 시간 무결성 검사 실패
			if (!checkTimeDiff())
			{
				// 종료
				return;
			}
	    	
	    	
	    	// 선호 연령대 안 선택함
	    	if (!$("#age_type_id").val())
			{
	    		alert("선호 연령대를 선택해 주십시오.");
	    		// 종료
				return;
			}
	    	
	    	
	    	// 선호 근무 지역 안 선택함.
	    	if (!$("#si_addr").val() || !$("#gu_addr").val() )
			{
	    		alert("선호 지역을 선택해 주십시오.");
	    		// 종료
				return;
			}
	    	
	    	
	    	if ($("#introduction").val().length > 500)
			{
				alert("자기소개는 500자를 초과해 작성하실 수 없습니다.");
				return;
			}
	    	
	    	// 모든 걸 통과해야 제출할 수 있음.
			$("#genRegInsert").submit();
			
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
 		
        // 두 시각이 모두 선택되었다면
        if ($('#start_time').val() && $('#end_time').val())
        {
            // 시간 계산
            var startHour = parseInt($('#start_time').val());
            var endHour = parseInt($('#end_time').val());
            var hourDiff = endHour - startHour;
            
            //alert(startHour);
            //alert(endHour);
            
            // 시간을 이상하게 선택했다면(시작 시간이 15시인데 끝나는 시간이 11시)
            if (hourDiff < 1)
			{
				alert("최소 1시간 이상은 근무하셔야 합니다.");
				return false;
			}
            
            // 시간 차가 8시간 초과라면
            if (hourDiff > 8)
            {
                // 경고 표시
            	alert("8시간을 초과해 근무하실 수 없습니다.");
                return false;
            }
            
         	// 신입인지 아닌지 계산
	    	var grade = "<%= grade %>";
	    	
			// 만약 신입이라면 시간 차이 계산
			if (grade == "신입" && hourDiff > 2)
			{
				// 경고 표시
				alert("신입 등급은 2시간을 초과해 근무하실 수 없습니다.");
				return false;
			}
            
			return true;
        }
        
        alert("근무 시간을 선택해 주십시오.");
        return false;
    }
	
 	function getDateDiff(d1, d2)
	{
 		const date1 = new Date(d1);
		const date2 = new Date(d2);
		
		const diffDate = date2.getTime() - date1.getTime();
		
		return Math.abs(diffDate / (1000 * 60 * 60 * 24));  
								/* 밀리세컨 * 초 * 분 * 시 = 일 */	
	}
 	
	function charLimit(id, displayId, maxlength)
	{
		var len = $(id).val().length; 	//입력된 값의 길이 확인
    	var remain = maxlength - len;				// 남은 값
    	
    	$(displayId).html(len);
    	
    	if (remain <=10 && remain >= 1)
		{
			$(displayId).css("color", "orange");		// h1 이 주황색으로 
		}
    	else if (remain <= 0)
		{
			$(displayId).css("color", "red");
		}
    	else
    	{
			$(displayId).css("color", "black");
    	}
	}
 	
 	
 	
	
</script>

</head>
<body>
    <div id="wrapper">
        <!-- 상단 -->
        <div id="header">
            <div id="logo">
            	<a href="sitterMain.jsp">
                	<img src="<%=cp %>/images/logo.png" height="120px"> 
                </a>
            </div>
            <div class="nav">
                <button type="button" class="menuBtn">홈</button>
                <button type="button" class="menuBtn">로그아웃</button>
                <button type="button" class="menuBtn">스케줄러</button>
                <button type="button" class="menuBtn">근무 등록</button>
                <button type="button" class="menuBtn">마이페이지</button>
                <button type="button" class="menuBtn">알림함</button>
            </div>
        </div>
        
        <!-- 본문 -->
        <div id="main">
        	<form id="genRegInsert" action="genreginsert.action" <%-- enctype="multipart/form-data" method="post" --%> method="post">
	        	<div class="regTitle">
		        	<h2 class="title">근무 등록</h2>
     		        	<span class="required">* 표시는 필수 입력 항목입니다.</span>
			        <div class="verification"></div>
	       		</div>
	       		
	       		<!-- 제목 -->
	       		<div class="container">
	       			<div class="container-title">
	       				<h3>제목 &nbsp;<span class="required">*</span></h3>
	       				<div class="verification"></div>
	       			</div>
	       			
	       			<div class="container-panel">제목 작성</div>
	        		<div class="intro-area">
	        			<input type="text" id="title" name="title" maxlength="33"/>
		        		<div class="char-limit" style="display: flex;">33자 제한이 존재합니다. 현재 &nbsp;<span id="limit" >0</span>자 쓰셨습니다.</div>
        			</div>
       			</div>
	       		
		        <!-- 달력 날짜/시간 선택 -->
	        	<div class="container">
	        		<div class="container-title">
	        			<h3>근무 날짜&nbsp;<span class="required">*</span></h3>
	        			<div class="verification"></div>
	        		</div>
	        		
	        		<!-- 한 줄에 반반씩 넣을 컨테이너 -->
	        		<div class="container-group">
	        		
	        			<!-- 근무 시작 구역 -->
	        			<div class="container-half">
			        		<div class="container-panel">근무 시작일</div>
			            	<input type="date" id="start_date" name="start_date" required="required">
			            
				            <div class="container-panel">근무 시작 시간</div>
				        	<div class="TimeGrid start-time">
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="8">08:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="9">09:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="10">10:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="11">11:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="12">12:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="13">13:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="14">14:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="15">15:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="16">16:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="17">17:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" name="start_time" value="18">18:00</button>
				        	</div>                      
		           		</div>
		           		
		            	<!-- 종료 구역 -->
			            <div class="container-group-date">
			        		<div class="container-panel">근무 종료일</div>
			            	<input type="date" id="end_date" name="end_date" required="required" >
			          
				            <div class="container-panel">근무 종료 시간</div>
				        	<div class="TimeGrid end-time">
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="-" disabled="disabled">08:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="9">09:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="10">10:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="11">11:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="12">12:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="13">13:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="14">14:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="15">15:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="16">16:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="17">17:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="18">18:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" name="end_time" value="19">19:00</button>
				        	</div>                                        
			            </div>
			            
		            </div> <!-- container-half -->
	        	</div> <!-- end container -->
	        	
	        	<!-- 선호 연령대 -->
	        	<div class="container">
	        		<div class="container-title">
	        			<h3>선호 연령대&nbsp;<span class="required">*</span></h3>
	        			<div class="verification"></div>
	        		</div>
	        		
	        		<div class="container-panel">연령 선택</div>
	        		<div class="age-buttons">
	        			<c:forEach var="ages" items="${agesList }">
			        		<button type="button" class="ageBtn" name="age_type_id" value="${ages.age_type_id }">${ages.type }</button>
	        			</c:forEach>
	        		</div>
	        	</div>
	        	
	        	<!-- 선호 지역 -->
				<div class="container">
	        		<div class="container-title">
	        			<h3>선호 지역&nbsp;<span class="required">*</span></h3>
	        			<div class="verification"></div>
	        		</div>
	        		
	        		<div class="container-panel">선호 지역 선택</div>
	        		<div class="location-selects">
		        		<select id="si_addr" name="si_addr">
		        			<option value="">시 선택</option>
		        			<option value="1">서울특별시</option>
		        		</select>
						<select id="gu_addr" name="region_id">
								<option value="" selected="selected">구 선택</option>
		        			<c:forEach var="region"  items="${regionList }">
								<option value="${region.region_id }">${region.name }</option>
		        			</c:forEach>
						</select>
					</div>
	        	</div>

	        	<!-- <!-- 사진 첨부
	        	<div class="container">
	        		<div class="container-title">
	        			<h3>사진 업로드</h3>
	        			<div class="verification"></div>
	        		</div>
	        		
	        		<div class="container-panel">사진</div>
	        		<div class="file-upload">
						<input type="file" name="uploadFile" id="uploadFile">
					</div>
	        	</div>    -->
	        	
	        	<!-- 자기소개 -->
	        	<div class="container">
	        		<div class="container-title">
	        			<h3>자기소개</h3>
	        			<div class="verification"></div>
	        		</div>
	        		
	        		<div class="container-panel">자기소개 작성</div>
	        		<div class="intro-area">
		        		<textarea id="introduction" name="introduction" rows="6" cols="60" 
		        		maxlength="500" placeholder="자기소개를 입력하세요"></textarea>
		        		<div class="char-limit" style="display: flex;">500자 제한이 존재합니다. 현재 &nbsp;<span id="limit2" >0</span>자 쓰셨습니다.</div>
	        		</div>
	        	</div>
	        	
	        	
	        	<!-- 히든 필드 -->
	        	<input type="hidden" name="start_time" id="start_time">
        		<input type="hidden" name="end_time" id="end_time">
				<input type="hidden" name="age_type_id" id="age_type_id">		
				<input type="hidden" name="sit_backup_id" id="sit_backup_id" value="${sit_backup_id }">		
	        	
	        	<!-- 등록 버튼 -->
	        	<button type="button" id="uploadBtn">등록하기</button>
        	</form> 

        </div> <!-- end main -->
    </div> <!-- end wrapper -->
	
</body>
</html>