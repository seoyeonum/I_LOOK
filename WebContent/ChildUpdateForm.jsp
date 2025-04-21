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
<title>아이 정보 수정 페이지</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/ChildUpdateForm.css">
<script>
    function confirmUpdate() {
        return confirm("정말로 수정하시겠습니까?");
    }
</script>
</head>
<body>

<%-- ✅ 여기 alert 추가 --%>
<c:if test="${updated}">
    <script>
        alert("수정이 완료되었습니다.");
    </script>
</c:if>

<header>
    <div id="logo">
        <img src="${pageContext.request.contextPath}/logo.png" height="120px">
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
    <h2>아이 정보 수정하기</h2>
</div>

<div class="container">
    <div class="modify-content">
        <form action="${pageContext.request.contextPath}/childupdate.action" method="post" onsubmit="return confirmUpdate();">
            <input type="hidden" name="child_reg_id" value="${child.child_reg_id}" />

            <div class="input-field">
                <label for="name">이름 :</label>
                <input type="text" id="name" name="name" value="${child.name}" readonly="readonly">
            </div>

            <div class="input-field">
                <label for="height">키 :</label>
                <input type="number" id="height" name="height" value="${child.height}" required>
                <span>cm</span>
            </div>

            <div class="input-field">
                <label for="weight">몸무게 :</label>
                <input type="number" id="weight" name="weight" value="${child.weight}" required>
                <span>kg</span>
            </div>

            <div class="input-field">
                <label for="blood_type">혈액형 :</label>
                <input type="text" id="blood_type" name="blood_type" value="${child.blood_type}" readonly="readonly">
                <span>형</span>
            </div>

            <div class="input-field">
                <label for="special_notes">특이사항:</label>
                <textarea id="special_notes" name="special_notes" rows="4" cols="50">${child.special_notes}</textarea>
            </div>

            <div class="input-field">
                <label for="disability_type_id">장애:</label>
                <select name="disability_type_id">
                    <option value="없음">없음</option>
                    <c:forEach var="d" items="${disabilities}">
                        <option value="${d.disability_type_id}" <c:if test="${d.disability_type_id == child.disability_type_id}">selected</c:if>>${d.type}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="input-field">
                <label for="medical_type_id">지병:</label>
                <select name="medical_type_id">
                    <option value="없음">없음</option>
                    <c:forEach var="m" items="${medicals}">
                        <option value="${m.medical_type_id}" <c:if test="${m.medical_type_id == child.medical_type_id}">selected</c:if>>${m.type}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="input-field">
                <label for="allergy_type_id">알레르기:</label>
                <select name="allergy_type_id">
                    <option value="없음">없음</option>
                    <c:forEach var="a" items="${allergies}">
                        <option value="${a.allergy_type_id}" <c:if test="${a.allergy_type_id == child.allergy_type_id}">selected</c:if>>${a.type}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="form-buttons">
                <button type="submit" class="btn update-btn">수정하기</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>