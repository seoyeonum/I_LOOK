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
<script>
    // 주민번호 앞자리와 뒷자리 유효성 검사
    function validateForm() {
        const ssnFirst = document.getElementById("ssn_first").value;
        const ssnSecond = document.getElementById("ssn_second").value;

        const ssnFirstPattern = /^[0-9]{6}$/;
        const ssnSecondPattern = /^[1-4][0-9]{6}$/;

        if (!ssnFirstPattern.test(ssnFirst)) {
            alert("주민번호 앞자리는 6자리 숫자여야 합니다.");
            return false;
        }

        if (!ssnSecondPattern.test(ssnSecond)) {
            alert("주민번호 뒷자리는 7자리 숫자이며, 첫 숫자는 1~4 사이여야 합니다.");
            return false;
        }

        return true;
    }
</script>
</head>
<body>

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
    <h2>아이 정보 등록하기</h2>
</div>

<div class="container">
    <div class="insert-content">
        <form action="${pageContext.request.contextPath}/childinsert.action" method="post" onsubmit="return validateForm();">
            <div class="input-field">
                <label for="name">이름 :</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="input-field">
                <label for="ssn_first">주민번호 앞자리 :</label>
                <input type="text" id="ssn_first" name="ssn_first" required maxlength="6">
            </div>

            <div class="input-field">
                <label for="ssn_second">주민번호 뒷자리 :</label>
                <input type="text" id="ssn_second" name="ssn_second" required maxlength="7">
            </div>

            <div class="input-field">
                <label for="height">키 :</label>
                <input type="number" id="height" name="height" required>
            </div>

            <div class="input-field">
                <label for="weight">몸무게 :</label>
                <input type="number" id="weight" name="weight" required>
            </div>

            <div class="input-field">
                <label for="blood_type">혈액형 :</label>
                <select id="blood_type" name="blood_type" required>
                    <option value="">선택하세요</option>
                    <option value="A">A</option>
                    <option value="B">B</option>
                    <option value="O">O</option>
                    <option value="AB">AB</option>
                </select>
            </div>

            <div class="input-field">
                <label for="disability_type_id">장애 :</label>
                <select name="disability_type_id">
                    <option value="없음">없음</option>
                    <c:forEach var="d" items="${disabilities}">
                        <option value="${d.disability_type_id}">${d.type}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="input-field">
                <label for="medical_type_id">지병 :</label>
                <select name="medical_type_id">
                    <option value="없음">없음</option>
                    <c:forEach var="m" items="${medicals}">
                        <option value="${m.medical_type_id}">${m.type}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="input-field">
                <label for="allergy_type_id">알레르기 :</label>
                <select name="allergy_type_id">
                    <option value="없음">없음</option>
                    <c:forEach var="a" items="${allergies}">
                        <option value="${a.allergy_type_id}">${a.type}</option>
                    </c:forEach>
                </select>
            </div>

            <div class="input-field">
                <label for="special_notes">특이사항 :</label>
                <textarea name="special_notes" rows="4" cols="50"></textarea>
            </div>

            <div class="form-buttons">
                <button type="submit">등록하기</button>
            </div>
        </form>
    </div>
</div>

</body>
</html>
