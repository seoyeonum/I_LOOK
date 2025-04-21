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
<title>아이 등록 페이지</title>
<link rel="stylesheet" type="text/css" href="css/ChildInsertForm.css">
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
    <h2>아이 정보 등록하기</h2>
</div>

<div class="container">
    <div class="insert-content">
        <form action="" method="post">
            <div class="input-field">
                <label for="name">이름 :</label>
                <input type="text" id="name" name="name" value="김창식">
            </div>
            
            <div class="input-field">
                <label for="age">나이 :</label>
                <div class="input-with-unit">
                    <input type="number" id="age" name="age" value="4">
                    <span>세</span>
                </div>
            </div>
    
            <div class="input-field">
                <label for="height">키 :</label>
                <div class="input-with-unit">
                    <input type="number" id="height" name="height" value="110">
                    <span>cm</span>
                </div>
            </div>
    
            <div class="input-field">
                <label for="weight">몸무게 :</label>
                <div class="input-with-unit">
                    <input type="number" id="weight" name="weight" value="20">
                    <span>kg</span>
                </div>
            </div>
    
            <div class="input-field">
                <label for="blood">혈액형 :</label>
                <div class="input-with-unit">
                    <input type="text" id="blood" name="blood" value="A">
                    <span>형</span>
                </div>
            </div>
    
            <div class="input-field">
                <label for="disability">장애:</label>
                <div class="input-with-unit">
                    <select id="disability" name="disability">
                        <option value="없음">없음</option>
                        <option value="select1">자폐 스펙트럼 장애</option>
                        <option value="select2">뇌성마비 </option>
                        <option value="select3">지적장애</option>
                    </select>
                </div>
            </div>
            
            <div class="input-field">
                <label for="disease">지병:</label>
                <div class="input-with-unit">
                    <select id="disease" name="disease">
                        <option value="없음">없음</option>
                        <option value="select1">면역결핍 질환</option>
                        <option value="select2">심장병</option>
                        <option value="select3">감기</option>
                    </select>
                </div>
            </div>
            
            <div class="input-field">
                <label for="allergy">알레르기:</label>
                <div class="input-with-unit">
                    <select id="allergy" name="allergy">
                        <option value="없음">없음</option>
                        <option value="select1">꽃가루 알레르기</option>
                        <option value="select2">우유 알레르기</option>
                        <option value="select3">꽃가루 알레르기</option>
                    </select>
                </div>
            </div>

            <div class="input-field">
                <label for="remarks" id="remarks">특이사항:</label>
                <div class="input-with-unit">
                    <textarea id="remark-text" name="remarks" rows="4" cols="50"></textarea>
                </div>
            </div>
    
            <div class="form-buttons">
                <button type="submit" class="btn update-btn">등록하기</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>