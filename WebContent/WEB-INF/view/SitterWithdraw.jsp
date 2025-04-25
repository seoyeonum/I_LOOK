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
<title>시터 탈퇴 페이지</title>
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
		margin-left: 0%;
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
	.main .content
	{
		display: flex;
	}
	
	.withdraw.info.body
	{
		margin-top: 1%;
	}
	
	.withdraw.info.body ul > li
	{
		list-style: circle;
	}
	
	.withdraw.info.head
	{
		background-color: #f4cccc;
		width: 80%;
		border-radius: 10px;
		height: 6%;
	}
	
	h2
	{
		padding: 1%;
	}
	
	.body
	{
		font-size: 16pt;
	}
	
	/* 버튼 */
	.withdrawBtn
	{
		font-size: 16pt;
		background-color: #f4cccc; 
		border: 2px solid #ea9999;
		border-radius: 10px;
		margin-left: 5px;
	}
	
	.withdrawBtn:hover
	{
		background-color: #ea9999;
		border: 2px solid #f4cccc;
	}
	
	.withdrawBtn:active
	{
		color: #ea9999;
		background-color: #f4cccc; 
		border: 2px solid #ea9999;
	}
	
	.resetBtn
	{
		font-size: 16pt;
		background-color: #eeeeee; 
		border: 2px solid black;
		border-radius: 10px;
		margin-right: 5px;
	}
	
	.resetBtn:hover
	{
		background-color: #bcbcbc;
		border: 2px solid black;
	}
	
	.resetBtn:active
	{
		color: #ffffff;
		background-color: #bcbcbc; 
		border: 2px solid #eeeeee;
	}

      
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">


 
</script>
</head>

<body>
<div id="wrapper">
	<c:import url="/sitterheader.action"/>
</div>

<main>
<div class="main content"  style="display: flex;">
	<div class="side-bar-container" >
		<div class="side-bar" >
			<ul class="side-menu" >
				<li><a href="">시터 마이 페이지</a>
					<ul>
						<li><a href="sitterinfolist.action?sit_backup_id=${list.sit_backup_id }" >개인정보 수정</a></li>
						<li><a href="gradescheck.action?sit_backup_id=${list.sit_backup_id }">등급 확인</a></li>
						<li><a href="genreginsertform.action?sit_backup_id=${list.sit_backup_id }">근무 등록</a></li>
						<li><a href="genreglist.action?sit_backup_id=${list.sit_backup_id }" >근무 등록 내역 확인</a></li>
						<li><a href="sittergenreqansweredlist.action?sit_backup_id=${list.sit_backup_id }" >돌봄 제공 내역 확인</a></li>
						<li><a href="carecompletelist.action?sit_backup_id=${list.sit_backup_id }" >돌봄 완료 내역 확인</a></li>
						<li><a href="sitterwithdraw.action?sit_backup_id=${list.sit_backup_id }" style="font-weight: bold; color: #1AB223">회원 탈퇴</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
	
	<div class="withdraw info container">
		<div class="withdraw info head" style="">
		<h2>시터 회원 탈퇴 안내</h2>
		</div> <!-- .withdraw .info .head -->
		<div class="withdraw info body">
		고객님께서 탈퇴를 원하시다니 저희의 서비스가 많이 부족했나 봅니다.<br />
		불편하거나 답답했던 이유를 말씀해주신다면 확인하고 최대한 반영하도록 하겠습니다. <br />
		시터님께서 어디를 가시든 응원하겠습니다.
		</div> 
		
		<div class="withdraw info head" >
		<h2>정말로 탈퇴하시겠습니까?</h2>
		</div>
			<div class="withdraw info body">
			탈퇴하신다 해도 개인정보는 즉시 사라지지 않습니다. <br />
			또한 시터님이 쌓아오신 돌봄 기록 역시 남아 다음 기록을 기다릴 것입니다. <br /> 
			개인정보는 3년 후 삭제됩니다. 삭제되는 정보는 다음과 같습니다.
			<ul>
				<li>비밀번호</li>
				<li>이름</li>
				<li>주민번호</li>
				<li>전화번호</li>
				<li>주소</li>
				<li>상세주소</li>
				<li>우편번호</li>
				<li>사진</li>
			</ul>
			유지되는 정보는 다음과 같습니다. 
			<ul>
				<li>아이디</li>
				<li>활동 기록</li>
				<li>시터 신청 날짜</li>
				<li>시터 승인 일자</li>
			</ul>
			</div> 
			
		<form action="" class="" style="font-size: 16pt;">
		비밀번호 입력: <input type="password" style="border-color: white"/><br />
		탈퇴 사유<br />
		<label>입금이 늦다. <input type="checkbox" value=""/></label><br />
		<label>매칭 시스템이 마음에 들지 않았다. <input type="checkbox" value=""/></label> <br />
		<label>이유3 <input type="checkbox" value=""/></label><br />
		<label>이유4 <input type="checkbox" value=""/></label><br />
		<div class="withdraw info button" style="display: flex; flex-direction: row-reverse; margin-top: 20px; margin-right: 20%;">
		<button class="withdrawBtn" type="submit" >탈퇴하기</button> <button class="resetBtn" type="reset">취소</button>
		</div>
		</form>
	</div>
</div>


</main>
</body>
</html>