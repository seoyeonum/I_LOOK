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
	document.addEventListener('DOMContentLoaded', function () 
			{
	    var firstButton = document.querySelector('.menuBtn.presentPage');
	    if (firstButton) {
	        firstButton.classList.remove('presentPage');
	    }
	    var button = document.querySelector('#mypage');
	    if (button) 
	    {
	        button.classList.add('presentPage');
	    }


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

<!-- 상단 헤더 영역 -->
<div id="header-container">
    <c:import url="/parentheader.action"/>
</div>

<!-- 사이드 메뉴 -->
<div class="sidebar">
    <c:import url="/parentsidebar.action"/>
</div>

<div class="page-title">
    <h2>아이 정보 등록하기</h2>
</div>

<div class="container">
    <div class="insert-content">
        <form action="childinsert.action" method="post" onsubmit="return validateForm();">
            <div class="input-field">
                <label for="name">이름 :</label>
                <input type="text" id="name" name="name" required>
            </div>

<div class="input-field">
    <label for="ssn_first">주민등록번호 :</label>  
    <input type="text" id="ssn_first" name="ssn_first" required maxlength="6" style="width:100px;">
    <span>-</span>
    <input type="text" id="ssn_second" name="ssn_second" required maxlength="7" style="width:100px;">
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
    <button type="submit" class="btn pretty-btn">등록하기</button>
</div>

        </form>
    </div>
</div>

</body>
</html>
