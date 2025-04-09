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
<title>등급 확인 페이지</title>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/ILookCSS.css">
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
	
	/* 메인 콘텐츠 */
	.content 
	{
		
	}
	
	.grades .main 
	{
		
	}
	
	.sitter .image 
	{
		border-radius: 100px;
		height: 25%;
		width: 25%;
	}
	
	.sitters .info 
	{
		border-radius: 20px;
		height: 25%;
		width: 25%;
	}
	
	.sitters .sub 
	{
		border: 2px solid black;
		border-radius: 20px;
	}
	
	.rankup .info 
	{
		border: 2px solid black;
		border-radius: 20px;
	}
	
	.grades .info 
	{
		border-radius: 20px;
	}
	
	.name, .standard, .wage
	{
		font-size: 14pt;
		text-align: center;
	}
	
	
</style>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript"
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
	
	
	/* 
	function updatePanelPosition()
	{
		// 사이드바 통째로 가져오기
		var sidebar = document.getElementById('sidebar-container');
		
		// 로고 객체 가져오기
		var logo = document.getElementById('logo');
		
		// getBoundingClientRect()
		// : 뷰포트(viewport) 기준 위치와 크기를 나타내는 DOMRect 객체를 반환
		
		var logoRect = logo.getBoundingClientRect();
		sidebar.style.top = (logoRect.bottom + 240) + 'px';
		sidebar.style.right = (logoRect.left + 1300) + 'px';
		
		//alert(document.documentElement.clientHeight);
	}
	
	// 3. 창 크기 변경 시 사이드 바 위치 조정(로고 밑 + 로고로부터 왼쪽에 있게끔 고정.)
	window.addEventListener('resize', function()
	{
		updatePanelPosition();
	}); 
	*/
	
	
	
	
</script>
</head>

<body>
<div id="wrapper">
	<!--헤더 부분은 공용으로 모든 뷰페이지에 사용하고 메인부분만 변경하는 부분으로 생각했었어 각 뷰페이지에 헤더부분만 같아도 통일감을 가질 것 같아서-->
	<header>
		<div id="logo">
			<img src="./images/logo.png" height="120px;">
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
	<main>
		<div class="main container" style="display: flex;">
			<!-- 사이드 바 컨테이너 -->
			<div class="side-bar-container" style="position: relative; z-index: 8; " id="sidebar-container">
				<div class="side-bar" id="sidebar" >
					<ul class="side-menu">
						<li><a href="" style="font-size: 1.7rem">시터 마이 페이지</a>
							<ul>
								<li><a href="SitterinfoList.jsp" style="">개인정보 수정</a></li>
								<li><a href="GradesCheck.jsp" style="font-weight: bold; color: #1AB223">등급 확인</a></li>
								<li><a href="">근무 등록</a></li>
								<li><a href="GenRegList.jsp">근무 등록 내역 확인</a></li>
								<li><a href="SitterGenReqAnsweredList.jsp">돌봄 제공 내역 확인</a></li>
								<li><a href="CareCompleteList.jsp">돌봄 완료 내역 확인</a></li>
								<li><a href="SitterWithdraw.jsp">회원 탈퇴</a></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<!-- .side-bar-container -->
			
			<div class="content-container" style="">
			<h2>등급 확인 페이지입니다. </h2>
			<div style="font-size:12pt; margin-bottom: 10px;">시터님의 등급을 확인하실 수 있고, 등급과 관련된 정보를 확인하실 수 있습니다.</div>
			<div class="row grades main" style="border: 2px solid #ea9999; border-radius: 20px; display: flex; justify-content: space-around;">
					<div class="sitter image col-md-2">
						<img src="./images/logoimg.png" alt="" height="130" /> <br />
						사진이 들어가는 곳입니다.
					</div>
					<div class="grades rank col-md-2">
						<img src="./images/logoimg.png" alt="" height="130" /> <br />
						OOO님의 등급은 브론즈입니다.
					</div>
					<div class="sitters info col-md-2" style="font-size: 16pt; width: 30%; padding: 20px;">
						가입일: <br />
						그동안 맡은 돌봄 서비스 수: <br />
						전체 평균 점수: <br />
						최근 3개월간 평균 점수:
					</div>
			</div><!-- .grades main -->

			<div class="row grades time" style="margin-top: 40px;">
				<div class="rankup info col-md-12 col-sm-12" style="font-size: 18pt; border: 2px solid #ea9999;
				border-radius: 10px; padding: 20px; width: 50%; margin: 0 25%;">
					총 근무 시간: <br /> 현재 근무 시간: <br /> 다음 등급까지 XXX 시간 남았습니다.
				</div> 
			</div>
				<div class="row grades info" style="margin-top: 40px; margin-bottom: 40px;">
				<div class="grades info" style="border: 2px solid #ea9999; border-radius: 10px; padding: 10px;">
					<div>
						<div style="text-align: center; font-size: 18pt; margin-bottom: 20px;
						border-bottom-style: solid; border-bottom-color: #ea9999; padding-bottom: 10px;">등급별 설명</div>
					</div>
					<div>
						<div style="display: flex; margin-left: 10px; justify-content: space-around; height: 50px;">
							<div class="col-md-2 name" style="background-color: #f4cccc; height: inherit;">등급</div>
							<div class="col-md-2 name" >신입</div>
							<div class="col-md-2 name">브론즈</div>
							<div class="col-md-2 name">실버</div>
							<div class="col-md-2 name">골드</div>
							<div class="col-md-2 name" >플래티넘</div>
						</div>
						<div style="display: flex; margin-left: 10px; justify-content: space-around; height: 80px;">
							<div class=" col-md-2 standard" style="background-color: #f4cccc; ">기준</div>
							<div class="col-md-2 standard" >누적 근무 시간<br />120시간 미만</div>
							<div class="col-md-2 standard" >120시간 이상<br />1,000시간 미만</div>
							<div class="col-md-2 standard" >1,000시간 이상 5000시간 미만</div>
							<div class="col-md-2 standard" >5,000시간 이상 10,000시간 미만</div>
							<div class="col-md-2 standard" >10,000 시간 이상</div>
						</div>
						<div style="display: flex; margin-left: 10px; justify-content: space-around; height: 50px;">
							<div class="col-md-2 wage" style="background-color: #f4cccc;">혜택</div>
							<div class="col-md-2 wage">시급 1배</div>
							<div class="col-md-2 wage">시급 1배</div>
							<div class="col-md-2 wage">시급 1.2배</div>
							<div class="col-md-2 wage">시급 1.5배</div>
							<div class="col-md-2 wage">시급 1.7배</div>
						</div>
						<div style="display: flex; margin-top:20px; border-top-style: solid;
						border-top-color: #ea9999; align-items:center; justify-content: center; padding: 10px;">
							<div style="">
							유의사항	
							</div>
							<div style="padding-top: 10px; ">
								<ul style="margin: 0px;">
									<li style="list-style: disc;">신입은 하루 최대 2시간, 그 외는 하루 최대 8시간까지 근무할 수 있습니다.</li>
									<li style="list-style: disc;">시터는 최대 근무 시간을 넘겼더라도 긴급 돌봄을 지원할 수 있습니다.<br />
									단, 신입은 긴급 돌봄 역시 2시간까지만 근무할 수 있습니다.</li>
								</ul>
							</div>
						</div>
					</div>
				</div>

				</div>
				<!-- row grades info -->
			
			</div><!-- .content.container -->
		</div>
		<!-- .main.container -->
	</main>
</div>
</html>