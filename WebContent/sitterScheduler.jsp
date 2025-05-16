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
<title>시터 돌봄 일정표</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
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
      
	.side-menu ul, .side-menu li
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
	
	/* 버튼 */
	.confirm-btn, .confirm-btn, .reservation-btn
	{
		font-size: 16pt;
       	background-color: #f4cccc; 
       	border: 2px solid #ea9999;
       	border-radius: 10px;
	}
	
	.confirm-btn:hover, .confirm-btn:hover, .reservation-btn:hover
	{
		background-color: #ea9999;
       	border: 2px solid #f4cccc;
	}
	
	.confirm-btn:active, .confirm-btn:active, .reservation-btn:active
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
	.reservation
	{
		text-align: center;
	}
	
	.content-container
	{
		font-size: 14pt;
		text-wrap: wrap;
		width: 150%;
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
	
	/* 스케줄을 위한 달력 */

	/*#2 */
	* 
	{
		margin: 0;
		padding: 0;
	  	box-sizing: border-box;
	}
	 
	/*#3 */
	.material-icons 
	{
	  	/* button 요소에 기본적으로 설정되는 스타일 속성 초기화 */
	  	border: none;
	  	outline: none;
	  	background-color: transparent;
	  	padding: 0;
	 	cursor: pointer;
	}
	
	.material-icons
	{
		margin: 0 10px 10px 10px;
	}
	
	/*#5 */
	.wrapper 
	{
		margin-top: 50px;
		width: 450px;
		background: #fff;
		border-radius: 10px;
		padding: 25px;
	}
	 
	/*#6*/
	.wrapper .nav 
	{
		display: flex;
		align-items: center;
		justify-content: space-between;
		margin-bottom: 30px;
	}
	
	.wrapper .nav .current-date 
	{
		font-size: 24px;
		font-weight: 600;
	}
	
	.wrapper .nav button 
	{
		width: 38px;
		height: 38px;
		font-size: 30px;
		color: #878787;
	}
	
	/*#7*/
	.calendar ul 
	{
		display: flex;
		list-style: none;
		flex-wrap: wrap;
		text-align: center;
	}
	.calendar .weeks li 
	{
		font-weight: 500;
	}
	.calendar .days 
	{
		margin-bottom: 20px;
	}
	.calendar ul li 
	{
		/*#8*/
		width: calc(100% / 7);
		/*#9*/
		position: relative;
	}
	.calendar .days li 
	 {
		/*#10*/
		z-index: 1;
		margin-top: 30px;
		cursor: pointer;
	}
	 
	/*#11*/
	.days li.inactive 
	{
		color: #aaa;
	}
	
	.days li.active 
	{
		color: #fff;
	}
	.calendar .days li::before 
	{
		position: absolute;
		content: '';
		height: 40px;
		width: 40px;
		top: 50%;
		left: 50%;
		transform: translate(-50%, -50%);
		border-radius: 50%;
		z-index: -1;
	}
	.days li:hover::before 
	{
		background: #f2f2f2;
	}
	.days li.active::before 
	{
		background: #008aff;
	}
	.days li.care1
	{
		background: #ea9999;
	}
	
	/* 스케줄 상세정보 */
	.schedule
	{
		margin-left: 50px;
		display: block;
		align-items: center;
		justify-content: center;
		width: 400px;
		height: 600px;
		border: 2px solid #ea9999;
		border-radius: 10px;
	}
	
	/* 안쪽의 표 */
	.parent-info
	{
		position: relative;
	}
	
	.key
	{
		background-color: #f4cccc;
		border-right: 2px solid #ea9999;
	}
	
	tr
	{
		border: 2px solid #ea9999;
	}
	
	td
	{
		padding: 10px 10px 10px 10px;
	}
	
	.test1
	{
		background: #aaaa aa;
	}
	
	.test2
	{
		background: #bbbbbb;
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
	
	let date = new Date();				// 자동으로 현지 기준 오늘 객체 생성
	let currYear = date.getFullYear();	// 올해
	currMonth = date.getMonth() + 1;	// 이번 달의 인덱스값(0부터 시작) + 1
	
	var staticCurrYear = date.getFullYear();
	var staticCurrMonth = date.getMonth();

	$().ready(function() 
	{
		// test
		//alert("asdf");
		
		$(".reservation-btn").click(function() 
		{
			var popup = window.open("pargenreqdetail.action?gen_req_id=" + this.value, '일반 돌봄 상세 정보', 'scrollbars=yes');
		});
		
		$(".current-date").html(currYear + "년 " + currMonth + "월");
		
		renderCalendar();
		
		$(document.getElementsByClassName("material-icons").item(0)).click(function()
		{
			//alert("asdf");
			
			// 아이디 밸류값 확인
			// 마이너스면 이전 달
			// 플러스면 다음 달
			
			currMonth = currMonth - 1;
			$(".current-date").html(currYear + "년 " + currMonth + "월");
			renderCalendar();
			
		});
		
		$(document.getElementsByClassName("material-icons").item(1)).click(function()
		{
			currMonth = currMonth + 1;
			$(".current-date").html(currYear + "년 " + currMonth + "월");
			renderCalendar();
			
		});
		
	});

	function renderCalendar()
	{
		//currMonth = date.getMonth() + 1;
		let lastDateofMonth = new Date(currYear, currMonth, 0).getDate();	// 이번 달 막날의 숫자
		let firstDayofMonth = new Date(currYear, currMonth-1, 1).getDay();	// 이번 달 첫날의 요일
		let lastDayofMonth = new Date(currYear, currMonth-1, lastDateofMonth).getDay();		// 이번 달 막날의 요일
		let lastDateofLastMonth = new Date(currYear, currMonth-1, 0).getDate();			// 저번 달 막날의 숫자
		
		var days = document.querySelector(".days");
		
		var a = 0;
		
		let liTag = '';
		
		for (let i = firstDayofMonth; i > 0; i--)
			liTag += "<li class='inactive'>" + (lastDateofLastMonth -i +1) + "</li>";
	    for (let i = 1; i <= lastDateofMonth; i++) 
	    {
	    	if ((date.getMonth()+1) == currMonth && date.getFullYear() == currYear && i > 10 && i < 20)
	    	{
	    		if (i == date.getDate() && (date.getMonth()+1) == currMonth && date.getFullYear() == currYear)
				{
	    			liTag += "<li class='acitve'>" + i + "</li>";
				}
	    		else
	    			liTag += "<li class='care1'>" + i + "</li>";
	    	}
	    	else if (i == date.getDate() && (date.getMonth()+1) == currMonth && date.getFullYear() == currYear)
			{
				liTag += "<li class='active'>" + i + "</li>";
			}
	    	else
	    		liTag += "<li>" + i + "</li>";
		}
	    for (var i = lastDayofMonth; i < 6; i++)
			liTag += "<li class='inactive'>" + ++a + "</li>";
	    
	    
		days.innerHTML = liTag;
	} 
	

</script>
</head>
<body>
<!-- <div id="wrapper"> -->
<!--헤더 부분은 공용으로 모든 뷰페이지에 사용하고 메인부분만 변경하는 부분으로 생각했었어 각 뷰페이지에 헤더부분만 같아도 통일감을 가질 것 같아서-->
<div id="header-container">
	<c:import url="/sitterheader.action"/>
</div>
<!-- </div> -->


<main>
<div class="main container" style="display: flex; align-items: center;">
	<div class="side-bar-container" >
		<div class="side-bar" >
			<ul class="side-menu" >
				<li><a href="sitterinfolist.action?sit_backup_id=${sit_backup_id }">시터 마이 페이지</a>
					<ul>
						<li><a href="sitterinfolist.action?sit_backup_id=${sit_backup_id }">개인정보 수정</a></li>
						<li><a href="gradescheck.action?sit_backup_id=${sit_backup_id }">등급 확인</a></li>
						<li><a href="sitterscheduler.action?sit_backup_id=${sit_backup_id }"  style="font-weight: bold; color: #1AB223">시터 스케줄러</a></li>
						<li><a href="genreginsertform.action?sit_backup_id=${sit_backup_id }">근무 등록</a></li>
						<li><a href="genreglist.action?sit_backup_id=${sit_backup_id }">근무 등록 내역 확인</a></li>
						<li><a href="sittergenreqansweredlist.action?sit_backup_id=${sit_backup_id }">돌봄 제공 내역 확인</a></li>
						<li><a href="carecompletelist.action?sit_backup_id=${sit_backup_id }">돌봄 완료 내역 확인</a></li>
						<li><a href="sitterwithdraw.action?sit_backup_id=${sit_backup_id }">회원 탈퇴</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div> <!-- .side-bar-container -->

	<div class="wrapper">
    <header style="box-shadow: none;">
        <div class="nav">
          <button class="material-icons" id="minus"> - </button>
          <p class="current-date"></p>
          <button class="material-icons" id="plus"> + </button>
        </div>
      </header>
      <div class="calendar">
        <ul class="weeks">
          <li>일</li>
          <li>월</li>
          <li>화</li>
          <li>수</li>
          <li>목</li>
          <li>금</li>
          <li>토</li>
        </ul>
        <ul class="days" id="days">
        <!-- 
          <li class="inactive">30</li>
          <li class="">1</li>
          		:
          <li>31</li>
           -->
        </ul>
      </div>
    </div>

	<div class="test1 test2" style="width: 10px; height: 10px;"></div>
	<div class="schedule">
		<table class="parent-info">
			<tbody class="info-tbody">
				<tr>
					<td class="key">예약 신청 날짜</td>
					<td>-</td>
				</tr>
				<tr>
					<td class="key">신청자 이름</td>
					<td>-</td>
				</tr>
				<tr>
					<td class="key">돌봄 시간</td>
					<td>- 시 ~ -시</td>
				</tr>
				<tr>
					<td class="key">도로명 주소</td>
					<td>-</td>
				</tr>
				<tr>
					<td class="key">상세 주소</td>
					<td>-</td>
				</tr>
				<tr>
					<td class="key">아이 이름</td>
					<td>-</td>
				</tr>
				<tr>
					<td class="key">아이 연령</td>
					<td>3세</td>
				</tr>
				<tr>
					<td class="key">특이사항</td>
					<td>-</td>
				</tr>
				<tr>
					<td class="key">전달 메시지</td>
					<td>-</td>
				</tr>
			</tbody>
		</table>
		<button class="reservation-btn">일반 돌봄 상세 정보 확인</button>
	</div>

</div>
</main>

</body>
</html>