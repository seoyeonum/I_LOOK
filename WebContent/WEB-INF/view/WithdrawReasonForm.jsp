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
<title>부모 탈퇴 페이지</title>
<link rel="stylesheet" type="text/css" href="css/WithdrawReasonForm.css">
</head>
<body>

<header>
    <div id="logo">
        <img src="./logo.png" height="120px"></div>
        <nav>
            <button type="button" class="menuBtn presentPage">홈</button>
            <button type="button" class="menuBtn">로그아웃</button>
            <button type="button" class="menuBtn">스케줄러</button>
            <button type="button" class="menuBtn">긴급돌봄서비스</button>
            <button type="button" class="menuBtn">마이페이지</button>
            <button type="button" class="menuBtn">알림함</button>
        </nav>
</header>

<div class="sidebar">
	<div class="sidebar-title">마이페이지</div>
	  <div class="menu">
	
	    <!-- 아이 정보 -->
	    <div class="menu-item">
	      <a href="#"><i class="fa-solid fa-child"></i> 아이 정보 관리</a>
	      <div class="submenu">
	        <a href="#">아이 목록 보기</a>
	        <a href="#">신규 아이 등록</a>
	        <a href="#">아이 정보 수정</a>
	      </div>
	    </div>
	
	    <!-- 부모 정보 -->
	    <div class="menu-item">
	      <a href="#"><i class="fa-solid fa-user-group"></i> 부모 정보 관리</a>
	      <div class="submenu">
	        <a href="#">부모 정보 보기</a>
	        <a href="#">부모 정보 수정</a>
	      </div>
	    </div>
	
	    <!-- 돌봄 이용 -->
	    <div class="menu-item">
	      <a href="#"><i class="fa-solid fa-house-chimney-user"></i> 돌봄 이용 현황</a>
	      <div class="submenu">
	        <a href="#">현재 이용 내역</a>
	        <a href="#">이용 완료 내역</a>
	      </div>
	    </div>
	  </div>
</div>

<div class="page-title">
    <h2>회원 탈퇴하기</h2>
</div>
  

 <div class="withdraw-list">
  	<div class="next-title">
    	<h2>다음에 또 만나요 ~♬</h2>
	</div>
	
  	<div class="images">
  		<img alt="회원 이미지" src="./logoimg.png" class="profile-image">
  		
  	</div>
<div class="form-buttons">
    <button type="submit" class="btn">메인 페이지로 이동</button>
    <button type="submit" class="btn">회원가입</button>
</div>

  	
 </div>

</body>
</html>