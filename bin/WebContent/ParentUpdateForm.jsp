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
<title>부모 정보 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="css/ParentUpdateForm.css">
<script>
    // 탈퇴하기 버튼 클릭 시 확인 메시지
    function confirmDelete() {
        if (confirm("정말로 탈퇴하시겠습니까?")) {
            // 탈퇴 처리 로직을 여기에 추가
            alert("탈퇴가 완료되었습니다.");
        }
    }
</script>
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
    <h2>부모 정보 수정하기</h2>
</div>

<div class="container">
	 <div class="modify-content">
	     <form action="" method="post">
	         <div class="input-field">
	             <label for="name">이름 :</label>
	             <input type="text" id="name" name="name" value="김부각">
	         </div>
	         
	         <div class="input-field">
	             <label for="ssn">주민등록번호 :</label>
	             <div class="input-with-unit">
	                 <input type="text" id="ssn" name="ssn" value="123456-1234567" readonly="readonly">
	             </div>
	         </div>
	
	         <div class="input-field">
	             <label for="id">아이디 :</label>
	             <div class="input-with-unit">
	                 <input type="text" id="id" name="id" value="kbg0821" readonly="readonly">
	             </div>
	         </div>
	
	         <div class="input-field">
	             <label for="pw">비밀번호 :</label>
	             <div class="input-with-unit">
	                 <input type="text" id="pw" name="pw" value="********">
	             </div>
	         </div>
	
	         <div class="input-field">
	             <label for="tel">전화번호 :</label>
	             <div class="input-with-unit">
	                 <input type="text" id="tel" name="tel" value="010 - 1234 -5678">
	             </div>
	         </div>
	
	         <div class="input-field">
	             <label for="addr">주소 :</label>
	             <div class="input-with-unit">
	                 <input type="text" id="addr" name="addr" value="경기도 분당시 분당구 판교로50번길">
	             </div>
	         </div>
	
	         <div class="form-buttons">
	             <button type="submit" class="btn update-btn">수정하기</button>
	             <button type="button" class="btn delete-btn" onclick="confirmDelete()">탈퇴하기</button>
	         </div>
	     </form>
	 </div>
</div>

</body>
</html>
