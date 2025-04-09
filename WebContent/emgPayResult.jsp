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
<title>emgRegInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gen-filter.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	//이 페이지 로드 시,
	document.addEventListener('DOMContentLoaded', function()
	{
		//객체 생성
	    var xmlHttp = new XMLHttpRequest();
		
		// xmlHttp 요청 준비
	    xmlHttp.open('GET', './parentMainFrame.html', true);
	    
	    // xmlHttp 서버 응답 완료 후 아래를 실행
	    xmlHttp.onload = function() {
	    	
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
	            	// 3번째 엘리먼트에 presentPage 클래스 추가 (0부터 시작)
	                buttons[3].classList.add('presentPage');
	            }
	        }
	    };
	    
	    xmlHttp.send();
	    
	});
	
	$(document).ready(function()
	{
		$("#home").click(function()
		{
			// 부모 회원에게 home 은 일반 돌봄 메인
			window.location.href = "./genMain.jsp";
		});
		
		$("#myPage").click(function()
		{
			window.location.href = "./ChildUsed.jsp";
		});
	});
  
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
			<h1>긴급 돌봄 서비스</h1>
		</div>
	</div>
	
	<div id="wrapper-body-req">
		<div class="sub-subject">
			<h2>긴급 돌봄 신청/결제 완료</h2>
		</div>
		
		<!-- 긴급 돌봄 결제 안내 메시지 -->
		<!--
			- 로고 이미지 보여주기
			- 긴급 돌봄 결제 및 신청이 완료되었습니다.
			  시터님의 수락 이후 알림이 발송됩니다.
			- 
		-->
		<div class="sub-body-form">
			<div class="box-req-complete">
				<div class="label complete-subject">긴급 돌봄 결제 및 신청이 완료되었습니다.</div>
	            <div class="result-info">
	            	<div class="logo-complete">
		                <img src="./images/logoimg.png" alt="하트 로고 이미지">
		            </div>
	   			</div>
	            <div class="complete-details">
	            	<ul>
	            		<li>- 긴급 돌봄 요청이 정상적으로 완료되었습니다.</li>
	            		<li>- 긴급 돌봄 희망 이용 시각으로부터 1시간 이전까지 시터님의 요청 지원이 가능합니다.</li>
	            		<li>- 긴급 돌봄 희망 이용 시각으로부터 1시간 이전까지 시터님의 요청 지원이 없을 경우 긴급 돌봄 요청은 자동 취소됩니다.</li>
	            		<li>- 긴급 돌봄 신청 및 예약 내역은 마이페이지>(긴급 돌봄 내역)에서 확인 가능합니다.</li>
	            	</ul>
	            </div>
	            <br>
	            <div class="complete-details">
	            	<button type="button" id="home" class="btn">홈 화면으로 이동</button>
	            	<button type="button" id="myPage" class="btn">예약 내역으로 이동</button>
	            </div> 
	        </div>
		</div>		
	</div>
</div>

</body>
</html>