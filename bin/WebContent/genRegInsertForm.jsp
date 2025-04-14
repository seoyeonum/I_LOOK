<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
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
			$("#startTime").val(selectedTime);
	    });

	    $(".endTimeBtn").click(function() 
	    {
	        $(".endTimeBtn").removeClass("active");
	        $(this).addClass("active");
	        var selectedTime = $(this).val();
			$("#endTime").val(selectedTime);
	    });
	    
	    $(".ageBtn").click(function() 
	    {
	        $(".ageBtn").removeClass("active");
	        $(this).addClass("active");
	        var preferedAge = $(this).val();
			$("#preferedAge").val(preferedAge);
	    });
	   
	});
	
</script>

</head>
<body>
    <div id="wrapper">
        <!-- 상단 -->
        <div id="header">
            <div id="logo">
            	<a href="sitterMain.jsp">
                	<img src="<%=cp %>/imgs/logo.png" height="120px"> 
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
        	<form action="sitterGeneralRegisterInsertForm.action" enctype="multipart/form-data" method="post">
	        	<div class="regTitle">
		        	<h2 class="title">근무 등록</h2>
			        <div class="verification"></div>
	       		</div>
	       		
		        <!-- 달력 날짜/시간 선택 -->
	        	<div class="container">
	        		<div class="container-title">
	        			<h3>근무 날짜</h3>
	        			<div class="verification"></div>
	        		</div>
	        		
	        		<!-- 한 줄에 반반씩 넣을 컨테이너 -->
	        		<div class="container-group">
	        		
	        			<!-- 근무 시작 구역 -->
	        			<div class="container-half">
			        		<div class="container-panel">근무 시작일</div>
			            	<input type="text" id="startDate" name="startDate" placeholder="날짜 선택">
			            
				            <div class="container-panel">근무 시작 시간</div>
				        	<div class="TimeGrid start-time">
				        		<button type="button" class="timeBtn startTimeBtn" value="08:00">08:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="09:00">09:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="10:00">10:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="11:00">11:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="12:00">12:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="13:00">13:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="14:00">14:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="15:00">15:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="16:00">16:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="17:00">17:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="18:00">18:00</button>
				        		<button type="button" class="timeBtn startTimeBtn" value="19:00">19:00</button>
				        	</div>                      
		           		</div>
		           		
		            	<!-- 종료 구역 -->
			            <div class="container-group-date">
			        		<div class="container-panel">근무 종료일</div>
			            	<input type="text" id="endDate" name="endDate" placeholder="날짜 선택">
			          
				            <div class="container-panel">근무 종료 시간</div>
				        	<div class="TimeGrid end-time">
				        		<button type="button" class="timeBtn endTimeBtn" value="08:00">08:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="09:00">09:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="10:00">10:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="11:00">11:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="12:00">12:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="13:00">13:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="14:00">14:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="15:00">15:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="16:00">16:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="17:00">17:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="18:00">18:00</button>
				        		<button type="button" class="timeBtn endTimeBtn" value="19:00">19:00</button>
				        	</div>                                        
			            </div>
		            </div> <!-- container-half -->
	        	</div> <!-- end container -->
	        	
	        	<!-- 선호 연령대 -->
	        	<div class="container">
	        		<div class="container-title">
	        			<h3>선호 연령대</h3>
	        			<div class="verification"></div>
	        		</div>
	        		
	        		<div class="container-panel">연령 선택</div>
	        		<div class="age-buttons">
		        		<button type="button" class="ageBtn" value="1">영아(0~2세)</button>
		        		<button type="button" class="ageBtn" value="2">유아(2~5세)</button>
		        		<button type="button" class="ageBtn" value="3">학령전 아동(5~7세)</button>
		        		<button type="button" class="ageBtn" value="4">아동(7세~)</button>
	        		</div>
	        	</div>
	        	
	        	<!-- 선호 지역 -->
				<div class="container">
	        		<div class="container-title">
	        			<h3>선호 지역</h3>
	        			<div class="verification"></div>
	        		</div>
	        		
	        		<div class="container-panel">선호 지역 선택</div>
	        		<div class="location-selects">
		        		<select id="sigungu" name="sigungu">
		        			<option value="">시 선택</option>
		        			<option value="1">서울특별시</option>
		        		</select>
						<select id="dong" name="dong">
							<option value="">구 선택</option>
							<option value="1">강남구</option>
							<option value="2">송파구</option>
						</select>
					</div>
	        	</div>

	        	<!-- 사진 첨부 -->
	        	<div class="container">
	        		<div class="container-title">
	        			<h3>사진 업로드</h3>
	        			<div class="verification"></div>
	        		</div>
	        		
	        		<div class="container-panel">사진</div>
	        		<div class="file-upload">
						<input type="file" name="uploadFile" id="uploadFile">
					</div>
	        	</div>   
	        	
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
		        		<div class="char-limit">500자 제한</div>
	        		</div>
	        	</div>
	        	
	        	<!-- 히든 필드 -->
	        	<input type="hidden" name="startTime" id="startTime">
        		<input type="hidden" name="endTime" id="endTime">
				<input type="hidden" name="preferedAge" id="preferedAge">		
	        	
	        	<!-- 등록 버튼 -->
	        	<button type="submit" id="uploadBtn">등록하기</button>
        	</form> 
        </div> <!-- end main -->
    </div> <!-- end wrapper -->
	
</body>
</html>