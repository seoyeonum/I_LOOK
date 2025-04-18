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
<title>시터 개인 정보 열람 페이지</title>
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
	
	/* 폼 */
	.form-group
	{
		display: flex;
		font-size: 14pt;
	}
	
	span
	{
		font-size: 10pt;
	}
	
	.form-control
	{
		margin-left: 10px;
		margin-right: 10px;
		width: 50%;
	}
	
	.category
	{
		 background-color: #ffe4e1;
		 height: 50px;
		 align-content: center;
		 padding-left: 10px;
		 border-radius: 10px; 
	}
	
	/* 버튼 */
	.resultBtn
	{
		display: flex;
		flex-direction: row-reverse;
	}
	
	.confirmBtn, .modifyBtn, .resetBtn, .certBtn, .bankBtn
	{
		height: 50%;
		font-size: 16pt;
		background-color: #f4cccc; 
       	border: 2px solid #ea9999;
       	border-radius: 10px;
	}
	
	.confirmBtn:hover, .modifyBtn:hover, .resetBtn:hover, .certBtn:hover, .bankBtn:hover
	{
		background-color: #ea9999;
       	border: 2px solid #f4cccc;
	}
	
	.confirmBtn:active, .modifyBtn:active, .resetBtn:active, .certBtn:active, .bankBtn:active
	{
		color: #ea9999;
       	background-color: #f4cccc; 
       	border: 2px solid #ea9999;
	}
	
	.modifyBtn
	{
		margin-left: 5px;
	}
	
	.resetBtn
	{
		margin-right: 5px;
	}


</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>


</head>
<body>
<div id="wrapper">
        <!--헤더 부분은 공용으로 모든 뷰페이지에 사용하고 메인부분만 변경하는 부분으로 생각했었어 각 뷰페이지에 헤더부분만 같아도 통일감을 가질 것 같아서-->
        <header>
            <div id="logo">
                <img src="./images/logo.png" height="120px">
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
	<div class="side-bar-container">
		<div class="side-bar" >
			<ul class="side-menu" >
				<li><a href="">시터 마이 페이지</a>
					<ul>
						<li><a href="sitterinfolist.action?sit_backup_id=${list.sit_backup_id }" style="font-weight: bold; color: #1AB223">개인정보 수정</a></li>
						<li><a href="gradescheck.action?sit_backup_id=${list.sit_backup_id }">등급 확인</a></li>
						<li><a href="genreginsertform.action?sit_backup_id=${list.sit_backup_id }">근무 등록</a></li>
						<li><a href="genreglist.action?sit_backup_id=${list.sit_backup_id }" >근무 등록 내역 확인</a></li>
						<li><a href="sittergenreqansweredlist.action?sit_backup_id=${list.sit_backup_id }">돌봄 제공 내역 확인</a></li>
						<li><a href="carecompletelist.action?sit_backup_id=${list.sit_backup_id }" >돌봄 완료 내역 확인</a></li>
						<li><a href="sitterwithdraw.action?sit_backup_id=${list.sit_backup_id }">회원 탈퇴</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>

	<div class="info modify container" >
		<div class="info modify item">
			<form action="form-inline" method="get" onsubmit="">
			<h2 class="category">개인정보 수정하기</h2>
			<br />
			<div class="form-group">
			이름:  <input type="text" class="form-control" value="${list.name }" />
			</div>
			<hr />
			<div class="form-group">
			아이디: <input type="text" class="form-control" readonly="readonly" value="${list.id }" />
			<span class="errMsg">아이디는 변경할 수 없습니다.</span>
			</div>
			<hr />
			<div class="form-group" >
			비밀번호: <input type="password" class="form-control" value="${list.pw }" />
			<span>비밀번호는 영어 대소문자, 숫자 조합으로 8자 이상 16자 이하로 입력해 주십시오.</span>
			</div>
			<hr />
			<div class="form-group" >
			주민등록번호: 
			<input type="number" class="form-control" readonly="readonly" name="ssn_first" value="${list.ssn_first }" /> - <input type="password" class="form-control" name="ssn_second"readonly="readonly" value=${list.ssn_second } />
			</div>
			<hr />
			<div class="form-group" >
			전화번호: <input type="tel" class="form-control" value="${list.tel }" />
			<button type="button" class="confirmBtn">인증하기</button>
			</div>
			<hr />
			<div class="form-group">
			은행 종류: &nbsp;
			<select>
				<c:forEach var="acctdto" items="${banklist }" >
					<option value="${acctdto.bank_type_id }" selected="selected" ${acctdto.type == bank.bank_type ? 'selected="selected"' : '' }>${acctdto.type }</option>
				</c:forEach>
			</select>			
			<br />
			</div>
			<div class="form-group">			
			은행 계좌: <input type="text" class="form-control" value="${bank.acct_number }" /> <span>예시: 110-111-111111</span> &nbsp;
			<button type="button" class="bankBtn">연결하기</button>
			</div>
			<hr />
			<div  class="form-group" >
			현재 지닌 자격증: 
			</div>
			<div class="form-group" >
			자격증 등록: <input type="file" class="form-control"/>
			<button type="button" class="certBtn">등록하기</button>
			</div>
			<hr />
			<div  class="form-group" >
			현재 지닌 보증 서류: 
			</div>
			<div class="form-group" >
			서류 등록: <input type="file" class="form-control"/>
			<button type="button" class="certBtn">등록하기</button>
			</div>
			
			<br /><br />
			<br />
			<br />
			<br />
			<h2 class="category">주소 수정하기</h2>
			<br />
			<div class="form-group">
			도로명 주소: <input type="text" class="form-control" value="${list.road_addr }" />
			</div>
			<hr />
			<div class="form-group" >
			상세주소: <input type="text" class="form-control" value="${list.detailed_addr }" />
			</div>
			<hr />
			<div class="form-group">
			우편번호: <input type="text" class="form-control" value="${list.zip_code }" />
			</div>
			
			
			<div class="resultBtn">
			<button class="modifyBtn col-md-2" type="submit">수정하기</button><button class="resetBtn col-md-2" type="reset">취소</button>
			</div>
			</form>
			<br />
			<br />
			<br />
			</div>
		</div>
</div>
</main>




</body>
</html>