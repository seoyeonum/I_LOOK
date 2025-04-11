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
<title>genPayResult.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gen-filter.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	//이 페이지 로드 시,
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
        
        //---------------------------------------------
		
		$("#home").click(function()
		{
			window.location.href = "./genMain.jsp";
		});
		
		$("#myPage").click(function()
		{
			window.location.href = "./ChildUsed.jsp";
		});
	});
  
</script>
<script type="text/javascript">
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
	
	<div id="wrapper-body-req">
		<div class="sub-subject">
			<h2>일반 돌봄 신청/결제 완료</h2>
		</div>
		
		<!-- 일반 돌봄 결제 안내 메시지 -->
		<!--
			- 로고 이미지 보여주기
			- 일반 돌봄 결제 및 신청이 완료되었습니다.
			  시터님의 수락 이후 알림이 발송됩니다.
			- 
		-->
		<div class="sub-body-form">
			<div class="box-req-complete">
				<div class="label complete-subject">일반 돌봄 결제 및 신청이 완료되었습니다.</div>
	            <div class="result-info">
	            	<div class="logo-complete">
		                <img src="./images/logoimg.png" alt="하트 로고 이미지">
		            </div>
	   			</div>
	            <div class="complete-details">
	            	<ul>
	            		<li>- 일반 돌봄 신청이 정상적으로 완료되었습니다.</li>
	            		<li>- 일반 돌봄 신청으로부터 최대 12시간 이내에 수락 및 거절 알림이 이루어집니다.</li>
	            		<li>- 일반 돌봄 신청 및 예약 내역은 마이페이지>(일반 돌봄 내역)에서 확인 가능합니다.</li>
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