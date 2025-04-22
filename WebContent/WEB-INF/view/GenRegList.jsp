<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); //내부적으로 콘텍스트를 지정할 수 있는 경로
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시터의 일반 돌봄 근무 등록 내역 확인</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/ILookCSS.css">
<style type="text/css">

	div
	{
		font-family: 'NoonnuBasicGothicRegular';
	}
	
	.main .container
	{
		
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
	.answerBtn, .reservation-btn, .detailBtn, .rejectBtn
	{
		font-size: 16pt;
       	background-color: #f4cccc; 
       	border: 2px solid #ea9999;
       	border-radius: 10px;
	}
	
	.answerBtn:hover, .reservation-btn:hover, .detailBtn:hover, .rejectBtn:hover
	{
		background-color: #ea9999;
       	border: 2px solid #f4cccc;
	}
	
	.answerBtn:active, .reservation-btn:active, .detailBtn:active, .rejectBtn:active
	{
		color: #ea9999;
       	background-color: #f4cccc; 
       	border: 2px solid #ea9999;
	}	
	
	.reservation-btn, .detailBtn
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

	function moveAlarm()
	{
		window.location.href = "http://localhost:3306/Testproject/Alarm.html";
	}
	
	$().ready(function() 
	{
		// test
		//alert("asdf");
		
		$(".answerBtn").css("display", "none");
		$(".rejectBtn").css("display", "none");
		$("#reject").css("display", "none");
		
		
		// 자기소개글 누르면 나오는 새 창.
		$(".detailBtn").click(function()
		{
			//$(location).attr("href", "sitterregintroduction.action?gen_reg_id=" + $(this).val());
			var popup = window.open("sitterregintroduction.action?gen_reg_id=" + $(this).val(), '자기소개글', 'scrollbars=yes');
		});
		
		$(".reservation-btn").click(function() 
		{
			//test
			//alert("number1");
			
			//alert($("#request_result").val());
			
			//if ($("#request_result").val() == "신청 있음")
			//{
				$(".answerBtn").css("display", "inline");
				$(".rejectBtn").css("display", "inline");
				$("#reject").css("display", "inline");
			//}
			/*
			var str = "";
			var message = "";
			
			if (this.value == 1) 
			{
				str += "<div class='row'>"
					+ "<div class='col-md-1'>고현석</div>"
					+ "<div class='col-md-2'>03.25 ~ 03.30</div>"
					+ "<div class='col-md-2'>동작구</div>"
					+ "<div class='col-md-1'>여아</div>"
					+ "<div class='col-md-1'>4세</div>"
					+ "<div class='col-md-1'>무</div>"
					+ "<div class='col-md-2'>무</div>"
					+ "<div class='col-md-2'>유: <br />계란 알레르기</div>"
					+ "</div>";
				
				$("#detailInfo").html(str);
				
				message = "<div class='col-md-12'>밥은 잘 먹으니 걱정하지 마세요. "
					+ "지나치게 활동적이라 많이 놀아달라고 할 거예요. "
					+ "장난감으로 잘 놀아주시면 감사하겠습니다. "
					+ "RC카 대결해주시면 좋아해요.</div>";
				
				//alert(message);
				$("#message").html(message);
				
				
			}
			*/
			
			//alert($(this).val());
			
			// AJAX 처리 
			var params = "gen_req_id=" + $(this).val();
			
			//alert(params); 	//gen_req_id=GREQ0022
			/*
			id="name">.</div>
			<div class="col-md-2" id="careDays">.</div>
			<div class="col-md-2" id="gu_addr">.</div>
			<div class="col-md-1" id="child_gender">.</div>
			<div class="col-md-1" id="child_age">.</div>
			<div class="col-md-1" id="medical_type">.</div>
			<div class="col-md-2" id="allergie_type">.</div>
			<div class="col-md-2" id="disability_type">.</div>
			*/
			
			$.ajax(
			{
				type: "POST"
				, url : "genregdetail.action"
				, data: params
				, dataType: "html"
				, success: function(data)
				{
					//alert("성공~~~");
					
					$("#data").html(data);
					
					// 예약 버튼과 취소 버튼에 밸류 새기기
					$(".answerBtn").val($(".reservation-btn").val());
					$(".rejectBtn").val($(".reservation-btn").val());
					
					// 거절 사유 밸류
					//$(".rejectReason").val();
				}
				, beforeSend: function(xmlHttpRequest)	//AJAX 요청 서버 전송 직전 실행
				{
					xmlHttpRequest.setRequestHeader("Accept", "text/html; charset=utf-8");	// 받아오는 값을 이렇게 하라고 설정하는 거라 중요함. 잊지 말기. 
				}
				, error: function(e)
				{
					alert(e.responseText);
				}
			});
			
			
			
			
		});
		
		
		$(".answerBtn").click(function()
		{
			if (confirm("정말 예약하시겠습니까?"))
			{
				//alert($(this).val()); >> GREQ0022 >> 성공
				$(location).attr("href", "sittergenreqconfirminsert.action?sit_backup_id=" + $("#sit_backup_id").val() + "&gen_req_id=" + $(this).val());
			}

		});
		
		$(".rejectBtn").click(function()
		{
			if (confirm("정말 거절하시겠습니까?"))
			{
				//alert($("#reject").val());
				//$(location).attr("href", "sittergenreqansweredlist.action?answer=yes&sit_backup_id=" + ${sit_backup_id } + "&gen_req_id=" + $(this).val());
				$(location).attr("href", "sittergenreqcancelinsert.action?sit_backup_id=" + $("#sit_backup_id").val()
						+ "&gen_req_id=" + $(this).val() + "&reason_canceled_id=" + $("#reject").val());
			}
			
		});
		
				
		
	});
</script>
</head>
<body>
<div id="wrapper">
	<!--헤더 부분은 공용으로 모든 뷰페이지에 사용하고 메인부분만 변경하는 부분으로 생각했었어 각 뷰페이지에 헤더부분만 같아도 통일감을 가질 것 같아서-->
	<header>
		<div id="logo">
			<img src="<%=cp %>/images/logo.png" height="120px">
		</div>
		<nav>
			<button type="button" class="menuBtn presentPage" onclick="">홈</button>
			<button type="button" class="menuBtn">스케줄러</button>
			<button type="button" class="menuBtn">일반돌봄서비스</button>
			<button type="button" class="menuBtn">마이페이지</button>
			<button type="button" class="menuBtn" onclick="moveAlarm()">알림함</button>
			<button type="button" class="menuBtn"
				onclick="window.location.href='./project/projectLogin.html'">로그아웃</button>
		</nav>
	</header>
</div>

<main>
<!-- 메인 컨테이너 -->
<div class="main container" style="display: flex;">

	<!-- 사이드 바 컨테이너 -->
	<div class="side-bar-container" >
		<div class="side-bar" >
			<ul class="side-menu" >
				<li><a href="">시터 마이 페이지</a>
					<ul>
						<li><a href="sitterinfolist.action?sit_backup_id=${sit_backup_id }">개인정보 수정</a></li>
						<li><a href="gradescheck.action?sit_backup_id=${sit_backup_id }">등급 확인</a></li>
						<li><a href="genreginsertform.action?sit_backup_id=${sit_backup_id }">근무 등록</a></li>
						<li><a href="genreglist.action?sit_backup_id=${sit_backup_id }" style="font-weight: bold; color: #1AB223">근무 등록 내역 확인</a></li>
						<li><a href="sittergenreqansweredlist.action?sit_backup_id=${sit_backup_id }">돌봄 제공 내역 확인</a></li>
						<li><a href="carecompletelist.action?sit_backup_id=${sit_backup_id }" >돌봄 완료 내역 확인</a></li>
						<li><a href="sitterwithdraw.action?sit_backup_id=${sit_backup_id }">회원 탈퇴</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div> <!-- .side-bar-container -->
	
	<!-- 근무 등록 내역 컨테이너 -->
	<div class="content-container" style="max-width: 1200px; width: 100%;">
		<div style="font-size: 24pt; margin: 20px 10px 10px 0px; text-align: left;">근무 등록 내역 확인</div>
		<div style="font-size: 20pt; text-align: left; margin-bottom: 10px;">
		시터님께서 최근에 올리신 근무 등록 내역을 확인합니다. <br />
		보호자님이 시터님의 근무 등록에 예약하시면 근무 등록은 수정/삭제가 불가능합니다. <br /></div>
		<div id="reservation info" style="margin-bottom:10px; margin-left: -30px; margin-right: auto; ">
			<div class="info table" style="">
				<div class="info thead" style="border-top-left-radius: 10px; border-top-right-radius: 10px;">
					<div class="row">
						<div class="col-md-1">부모 이름</div>
						<div class="col-md-2">돌봄 일시</div>
						<div class="col-md-2">지역</div>
						<div class="col-md-1">아이 성별</div>
						<div class="col-md-1">아이 연령</div>
						<div class="col-md-1">장애 유무</div>
						<div class="col-md-2">지병 유무</div>
						<div class="col-md-2">알레르기 유무</div>
					</div>
				</div>
				
				<div id="data">
			<!-- <div class="info tbody" id="">
					<div class="row" id="detailInfo">
					부모 신청 정보
					</div>
				</div>
				
				<div class="info thead">
					<div class="row">
						<div class="col-md-12" style="text-align: center;"> 전달 메시지</div>
					</div>
				</div>
				<div class="info tbody">
					<div class="row">
						<div class="col-md-12" id="message" style="text-align: left;"> .</div>
					</div>
				</div> -->
				</div>
			</div> <!-- .info.table -->
			
			<div class="answerBtndiv" style="align-items: center;">
			<button class="answerBtn" value="">예약하기</button> 
			<button class="rejectBtn" value="">거절</button>
			<select name="reject" id="reject">
				<c:forEach var="cancel" items="${cancelList }">
					<option class="rejectReason" value="${cancel.reason_canceled_id }">${cancel.type }</option>
				</c:forEach>
			</select>
			</div>
		</div>
	
		
		<h3>'상세 정보' 버튼을 누르면 보호자님이 신청하신 예약의 자세한 내용을 보실 수 있습니다. </h3>
		<div class="reservation table" style="margin-left: -10px; margin-top: 20px; width: 1200px;">
			<div class="reservation thead" style="border-top-left-radius: 10px; border-top-right-radius: 10px; width: 100%; ">
				<div class="row" style="padding-right: 10px;">
					<div class="col-md-1">번호</div>
					<div class="col-md-2">제목</div>
					<div class="col-md-2">근무 가능 날짜</div>
					<div class="col-md-2">근무 가능 시간</div>
					<div class="col-md-1">선호 근무 지역</div>
					<div class="col-md-2">자기소개글</div>
					<div class="col-md-1">상세 정보</div>
					<div class="col-md-1">신청 상태</div>
				</div>   
			</div>
			<div class="reservation tbody" style="padding: 10px 0; padding-right: 10px;">
				<%-- <div class="row" id="number1" >
					<div class="col-md-1">1</div>
					<div class="col-md-1">끈기를 지닌 안예지입니다.</div>
					<div class="col-md-2">04.06 ~ 04.07</div>
					<div class="col-md-2">13:00 ~ 17:00</div>
					<div class="col-md-2">동대문구</div>
					<div class="col-md-2"><button class="detailBtn" value="<%= gen_req_id%>">자세히 보기</button></div>
					<div class="col-md-1"><button class="reservation-btn" value="1">상세 정보</button></div>
					<div class="col-md-1">신청 없음</div>
				</div>
				<div class="row" id="number2">
					<div class="col-md-1">2</div>
					<div class="col-md-1">끈기를 지닌 안예지입니다.</div>
					<div class="col-md-2">04.01 ~ 04.05</div>
					<div class="col-md-2">13:00 ~ 17:00</div>
					<div class="col-md-2">동대문구</div>
					<div class="col-md-2"><button class="detailBtn">자세히 보기</button></div>
					<div class="col-md-1"><button class="reservation-btn" value="2">상세 정보</button></div>
					<div class="col-md-1">신청 없음</div>
				</div>
				<div class="row" id="number3">
					<div class="col-md-1">3</div>
					<div class="col-md-1">끈기를 지닌 안예지입니다.</div>
					<div class="col-md-2">03.25 ~ 03.30</div>
					<div class="col-md-2">13:00 ~ 17:00</div>
					<div class="col-md-2">동대문구</div>
					<div class="col-md-2"><button class="detailBtn">자세히 보기</button></div>
					<div class="col-md-1"><button class="reservation-btn" value="3">상세 정보</button></div>
					<div class="col-md-1">신청 있음</div>
				</div> --%>
			<%-- <c:forEach var="wrpdto" items="${wRPdtoList }"> --%>
			<c:forEach var="reg" items="${regList }" varStatus="status">
				<div class="row" id="${reg.gen_reg_id }" >
					<div class="col-md-1">1</div>
					<div class="col-md-2">${reg.title }</div>
					<div class="col-md-2">${reg.sit_start_date } ~ ${reg.sit_end_date }</div>
					<div class="col-md-2">${reg.sit_start_time }시 ~ ${reg.sit_end_time }시</div>
				 	<div class="col-md-1"> - </div>  
					<div class="col-md-2"><button class="detailBtn" value="${reg.gen_reg_id }" type="button" >자세히 보기</button>
					</div>
					<div class="col-md-1">
					<c:if test="${reg.gen_req_id != null }">
					<button class="reservation-btn" value="${reg.gen_req_id }" type="button">상세 정보</button>
					</c:if>
					</div>
					<div class="col-md-1" >${reg.request_result }</div>
					<input type="hidden" value="${reg.request_result }" id="request_result" style="display: none;"/>
				</div>
			</c:forEach>
			<%-- </c:forEach>  --%>
			</div>
		</div><!-- .reservation-table -->
	</div><!-- .content-container -->
	
</div> <!-- .main container -->

<input type="hidden" value="${sit_backup_id }" id="sit_backup_id" style="display: block;" />


</main>

</body>
</html>