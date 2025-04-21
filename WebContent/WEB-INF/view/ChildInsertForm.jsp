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

<div class="page-title">
    <h2>아이 정보 등록하기</h2>
</div>

<div class="container">
    <div class="insert-content">
		<form action="${pageContext.request.contextPath}/childinsert.action" method="post">
            <div class="input-field">
                <label for="name">이름 :</label>
                <input type="text" id="name" name="name" required>
            </div>

            <div class="input-field">
                <label for="ssn_first">주민번호 앞자리 :</label>
                <input type="text" id="ssn_first" name="ssn_first" required>
            </div>

            <div class="input-field">
                <label for="ssn_second">주민번호 뒷자리 :</label>
                <input type="text" id="ssn_second" name="ssn_second" required>
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
                <input type="text" id="blood_type" name="blood_type" required>
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
