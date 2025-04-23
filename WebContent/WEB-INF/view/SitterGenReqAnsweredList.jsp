<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); //내부적으로 콘텍스트를 지정할 수 있는 경로
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봄 제공 최근 내역 리스트</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/ILookCSS.css">
<style type="text/css">

	div
	{
		font-family: 'NoonnuBasicGothicRegular';
	}
	
	/* 사이드 바 */
	.side-bar-container
	{
		align-content: center;
		margin-top: 2%; 
		margin-left: -20%;
		margin-right: 5%;
		margin-bottom: 10%;
	}
	
	.side-bar
	{
		width: 330px;
		border: 2px solid #ea9999;
		border-radius: 10px;
		background-color: white;
	}
	
	.side-bar ul
	{
		margin-bottom: 0;
	}
      
	.side-bar ul > li > a 
	{
		display: block;
		color: black;
		font-size: 1.4rem;
		font-weight: bold;
		padding-top: 20px;
		padding-bottom: 20px;
		padding-left: 50px;
		padding-right: 10px; 
		font-family: 'NoonnuBasicGothicRegular';
	}
      
	.side-menu ul, li
	{
		list-style: none;
	}
	
	.side-menu a:hover
	{
		color: #ea9999;
		border-radius: 10px;
		text-decoration: underline;
	}
	
	.side-menu a
	{
		text-decoration: none;
	}
	
	.side-menu 
	{
		padding-left: 0px;
		width: 300px;
	}
	
	/* 주제부 설명 글씨 */
	h1, h2
	{
		text-align: left;
		margin-left: -30px; 
	}
	
	/* 버튼 */
	.confirm-btn, .answerBtn, .reservation-btn
	{
		font-size: 16pt;
       	background-color: #f4cccc; 
       	border: 2px solid #ea9999;
       	border-radius: 10px;
	}
	
	.confirm-btn:hover, .answerBtn:hover, .reservation-btn:hover
	{
		background-color: #ea9999;
       	border: 2px solid #f4cccc;
	}
	
	.confirm-btn:active, .answerBtn:active, .reservation-btn:active
	{
		color: #ea9999;
       	background-color: #f4cccc; 
       	border: 2px solid #ea9999;
	}
	
	.reservation-btn
	{
		font-size: 10pt;
	}
	
	
	/* 테이블 */
	.content-container, .reservation-table
	{
		text-align: center;
	}
	
	.content-container
	{
		font-size: 14pt;
	}
	
	.content-container
	{
		text-wrap: wrap;
	}
	
	.reservation
	{
		border-radius: 10px;
	}
	
	.table
	{
		border: 1px solid #ea9999;
		border-radius: 10px;
		
	}
	
	.thead
	{
		background-color: #f4cccc;
	}
	

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

	//이 페이지 로드 시,
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
	    var button = document.querySelector('#mypage');
	    // 만약 버튼이 존재하면
	    if (button)
	    {
	        // 'presentPage' 클래스 추가
	        button.classList.add('presentPage');
	    }
	});

	function moveAlarm()
	{
		window.location.href = "http://localhost:3306/Testproject/Alarm.html";
	}
	
	$().ready(function() 
	{
		// test
		//alert("asdf");
		
		$(".reservation-btn").click(function() 
		{
			var popup = window.open("pargenreqdetail.action?gen_req_id=" + this.value, '일반 돌봄 상세 정보', 'scrollbars=yes');
		});

	});
</script>
</head>
<body>
<div id="header-container">
	<c:import url="/sitterheader.action"/>
</div>

<main>
<div class="main container" style="display: flex;">
	<div class="side-bar-container" >
		<div class="side-bar" >
			<ul class="side-menu" >
				<li><a href="">시터 마이 페이지</a>
					<ul>
						<li><a href="sitterinfolist.action?sit_backup_id=${sit_backup_id }" >개인정보 수정</a></li>
						<li><a href="gradescheck.action?sit_backup_id=${sit_backup_id }">등급 확인</a></li>
						<li><a href="genreginsertform.action?sit_backup_id=${sit_backup_id }">근무 등록</a></li>
						<li><a href="genreglist.action?sit_backup_id=${sit_backup_id }" >근무 등록 내역 확인</a></li>
						<li><a href="sittergenreqansweredlist.action?sit_backup_id=${sit_backup_id }" style="font-weight: bold; color: #1AB223">돌봄 제공 내역 확인</a></li>
						<li><a href="carecompletelist.action?sit_backup_id=${sit_backup_id }" >돌봄 완료 내역 확인</a></li>
						<li><a href="sitterwithdraw.action?sit_backup_id=${sit_backup_id }">회원 탈퇴</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div> <!-- .side-bar-container -->
	
	
	<div class="content-container" >
	<h1>돌봄 제공 최근 내역 리스트</h1>
	<h2>최근 3개월 동안 시터님이 예약에 대해 답변하신 내역과 돌봄 서비스를 수행하신 내역을 보여 드립니다. <br />
	돌봄 이용이 완료된 건은 '돌봄 완료 내역 페이지'에서 확인하실 수 있습니다. 
	</h2>
		
		<div class="reservation table" style="margin-left: -10px; margin-top: 20px;">
			<div class="reservation thead" style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
				<div class="row">
					<div class="col-md-1">번호</div>
					<div class="col-md-2">예약 신청 날짜</div>
					<div class="col-md-2">예약 이용 날짜</div>
					<div class="col-md-1">지역</div>
					<div class="col-md-1">아이 성별</div>
					<div class="col-md-1">아이 연령</div>
					<div class="col-md-2">상세 정보</div>
					<div class="col-md-2">예약 상태</div>
				</div>   
			</div>
			<div class="reservation tbody" style="padding: 10px 0;">
				<%-- <div class="row" id="number1">
					<div class="col-md-1">1</div>
					<div class="col-md-2">2025.03.30</div>
					<div class="col-md-2">04.06 ~ 04.07</div>
					<div class="col-md-1">강남구</div>
					<div class="col-md-1">남아</div>
					<div class="col-md-1">3세</div>
					<div class="col-md-2"><button class="reservation-btn" value="1">상세 정보</button></div>
					<div class="col-md-2">돌봄 중단</div>
				</div> --%>
				<c:forEach var="answer" items="${answerList }">
					<div class="row" id="${answer.gen_req_id }">
						<div class="col-md-1">1</div>
						<div class="col-md-2">${answer.req_date }</div>
						<div class="col-md-2">${answer.par_start_date } ~ ${answer.par_end_date }</div>
						<div class="col-md-1">${answer.gu_addr }</div>
						<div class="col-md-1">${answer.child_gender }</div>
						<div class="col-md-1">${answer.child_age }</div>
						<div class="col-md-2"><button class="reservation-btn" value="${answer.gen_req_id }">상세 정보</button></div>
						<div class="col-md-2">${answer.request_result }</div>
					</div>
				</c:forEach>
				
			</div>
		</div><!-- .reservation-table -->
	</div><!-- .content-container -->
</div> <!-- .main container -->

	

</main>

</body>
</html>