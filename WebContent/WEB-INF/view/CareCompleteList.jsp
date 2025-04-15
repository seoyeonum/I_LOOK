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
<title>시터의 돌봄 완료 페이지</title>
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
	

</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">

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

<div id="wrapper">
        <!--헤더 부분은 공용으로 모든 뷰페이지에 사용하고 메인부분만 변경하는 부분으로 생각했었어 각 뷰페이지에 헤더부분만 같아도 통일감을 가질 것 같아서-->
        <header>
            <div id="logo">
                <img src="<%=cp %>/images/logo.png" height="120px">
            </div>
            <nav>
                <button type="button" class="menuBtn presentPage">홈</button>
                <button type="button" class="menuBtn">스케줄러</button>
                <button type="button" class="menuBtn">긴급돌봄서비스</button>
                <button type="button" class="menuBtn">마이페이지</button>
                <button type="button" class="menuBtn">알림함</button>
                <button type="button" class="menuBtn">로그아웃</button>
            </nav>
        </header>
</div>

<main>
<div class="main container" style="display: flex;">
	<div class="side-bar-container" >
		<div class="side-bar" >
			<ul class="side-menu" >
				<li><a href="">시터 마이 페이지</a>
					<ul>
						<li><a href="sitterinfolist.action">개인정보 수정</a></li>
						<li><a href="gradescheck.action?">등급 확인</a></li>
						<li><a href="">근무 등록</a></li>
						<li><a href="genreglist.action">근무 등록 내역 확인</a></li>
						<li><a href="sittergenreqansweredlist.action">돌봄 제공 내역 확인</a></li>
						<li><a href="carecompletelist.action" style="font-weight: bold; color: #1AB223">돌봄 완료 내역 확인</a></li>
						<li><a href="sitterwithdraw.action">회원 탈퇴</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div> <!-- .side-bar-container -->
	
	<div class="content-container" >
	
		<div class="subject" style="font-size: 24pt; margin: 30px;">돌봄 완료 내역 리스트</div>
		<div class="subsubject" style="font-size: 18pt; margin: 10px 10px 10px 10px;">
		시터님이 돌봄을 완료하신 리스트를 시간 제한 없이 보여드립니다. <br />
		무한히 확인 가능합니다. 
		</div>

		<form action="">
		<div class="chooseMode">		
		<label>일반 돌봄 <input type="radio" name="caretype" value="" checked="checked" /></label> &nbsp;
		<label>긴급 돌봄 <input type="radio" name="caretype" value=""  /></label>
		</div>
		</form>
		
		<div class="reservation table" style="margin-left: -10px;">
			<div class="reservation thead" style="border-top-left-radius: 10px; border-top-right-radius: 10px; width: inherit;">
				<div class="row">
					<div class="col-md-1">번호</div>
					<div class="col-md-2">예약 신청 날짜</div>
					<div class="col-md-2">예약 이용 날짜</div>
					<div class="col-md-2">지역</div>
					<div class="col-md-1">아이<br />성별</div>
					<div class="col-md-2">아이 연령</div>
					<div class="col-md-2">상세 정보</div>
				</div>   
			</div>
			<%-- <div class="reservation tbody" style="padding: 10px 0; width: inherit;">
				<div class="row" id="number1" >
					<div class="col-md-1">1</div>
					<div class="col-md-2">2025.03.30</div>
					<div class="col-md-2">04.06 ~ 04.07</div>
					<div class="col-md-1">강남구</div>
					<div class="col-md-1">남아</div>
					<div class="col-md-2">3세</div>
					<div class="col-md-2"><button class="reservation-btn" value="1">상세 정보</button></div>
				</div>
				<div class="row" id="number2">
					<div class="col-md-1">2</div>
					<div class="col-md-2">2025.03.28</div>
					<div class="col-md-2">04.01 ~ 04.05</div>
					<div class="col-md-1">동작구</div>
					<div class="col-md-1">여아</div>
					<div class="col-md-2">4세</div>
					<div class="col-md-2"><button class="reservation-btn" value="2">상세 정보</button></div>
				</div>
				<div class="row" id="number3">
					<div class="col-md-1">3</div>
					<div class="col-md-2">2024.03.20</div>
					<div class="col-md-2">03.25 ~ 03.30</div>
					<div class="col-md-1">동작구</div>
					<div class="col-md-1">남아</div>
					<div class="col-md-2">1세</div>
					<div class="col-md-2"><button class="reservation-btn" value="3">상세 정보</button></div>
				</div>
			</div> --%>
			
			<c:choose>
				<c:when test="">
				
				</c:when>
				
				<c:otherwise>
					<c:forEach var="carelist" items="${completeList }">
					<div class="row" id="${carelist.gen_req_id }">
						<div class="col-md-1">1</div>
						<div class="col-md-2">${carelist.req_date }</div>
						<div class="col-md-2">${carelist.par_start_date } ~ ${carelist.par_end_date }</div>
						<div class="col-md-2">${carelist.gu_addr }</div>
						<div class="col-md-1">${carelist.child_gender }</div>
						<div class="col-md-2">${carelist.child_age }세</div>
						<div class="col-md-2"><button class="reservation-btn" value="${carelist.gen_req_id }">상세 정보</button></div>
					</div>
			</c:forEach>
				</c:otherwise>		
			</c:choose>
			
		</div><!-- .reservation-table -->
	</div><!-- .content-container -->

	
</div> <!-- .main container -->

</main>

</body>
</html>