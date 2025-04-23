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
<title>부모 상세정보 페이지</title>
<link rel="stylesheet" type="text/css" href="css/ParentInfo.css">
</head>
<body>

<header>
    <div id="logo">
        <img src="./logo.png" height="120px">
    </div>
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
                <a href="parentinfoview.action">부모 정보 보기</a>
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
    <h2>부모 상세정보</h2>
</div>

<div class="container">
    <div class="modify-content">
        <form action="" method="post">
            <div class="input-field">
                <label for="name">이름 :</label>
                <input type="text" id="name" value="${parent.name}" readonly="readonly">
            </div>

            <div class="input-field">
                <label for="ssn">주민등록번호 :</label>
                <div class="input-with-unit">
                    <input type="text" id="ssn" value="${parent.ssn_first}-${parent.ssn_second}" readonly="readonly">
                </div>
            </div>

            <div class="input-field">
                <label for="id">아이디 :</label>
                <input type="text" id="id" value="${parent.par_reg_id}" readonly="readonly">
            </div>

            <div class="input-field">
                <label for="pw">비밀번호 :</label>
                <input type="password" id="pw" value="********" readonly="readonly">
            </div>

            <div class="input-field">
                <label for="tel">전화번호 :</label>
                <input type="text" id="tel" value="${parent.tel}" readonly="readonly">
            </div>

            <div class="input-field">
                <label for="addr">주소 :</label>
                <input type="text" id="addr" value="${parent.road_addr} ${parent.detailed_addr}" readonly="readonly">
            </div>

            <div class="form-buttons">
                <button type="button" class="btn update-btn" onclick="location.href='parentmypage.action'">메인으로</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
