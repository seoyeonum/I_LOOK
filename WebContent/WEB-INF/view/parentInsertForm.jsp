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
<title>부모 회원가입 페이지</title>
<link rel="stylesheet" href="css/parentInsertForm.css">
<script type="text/javascript">
	

    // 카카오 주소 API를 위한 함수
    function searchAddress() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 도로명 주소를 폼에 입력
                document.getElementById("address").value = data.roadAddress;
                document.getElementById("postcode").value = data.zonecode; // 우편번호 입력
                document.getElementById("detailAddress").focus(); // 상세주소 입력란에 포커스
            }
        }).open();
    }

    // 아이디 중복 검사
    function checkId() {
        const userId = document.getElementById("userId").value.trim();
        const messageSpan = document.getElementById("id-check-message");

        if (userId === "") {
            alert("아이디를 입력해주세요!");
            return;
        }

        fetch("<c:url value='/checkId.action'/>?userId=" + encodeURIComponent(userId))
        .then(res => res.json())
        .then(data => {
            if (data === "duplicate") {
                messageSpan.style.color = "red";
                messageSpan.textContent = "이미 사용 중인 아이디입니다.";
            } else {
                messageSpan.style.color = "green";
                messageSpan.textContent = "사용 가능한 아이디입니다!";
            }
        })
        .catch(error => {
            console.error("중복 확인 중 오류 발생:", error);
            messageSpan.style.color = "red";
            messageSpan.textContent = "서버 오류로 중복 확인에 실패했습니다.";
        });

    }

    // 비밀번호 검증
    function checkPassword() {
        var password = document.getElementById("password").value;
        var errorMessage = document.getElementById("password-error");
        var passwordPattern = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,16}$/;

        if (!passwordPattern.test(password)) {
            errorMessage.textContent = "비밀번호는 소문자와 숫자를 결합하여 6자리에서 16자리로 입력해야 합니다.";
        } else {
            errorMessage.textContent = "";
        }
    }

    // 비밀번호 일치 여부 확인
    function checkPasswordMatch() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var errorMessage = document.getElementById("error-message");

        if (password !== confirmPassword) {
            errorMessage.textContent = "비밀번호가 일치하지 않습니다.";
        } else {
            errorMessage.textContent = "";
        }
    }

    // 제출 전 체크 (아이디 중복 확인 포함)
    function checkPasswordBeforeSubmit() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var passwordPattern = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,16}$/;

        if (!passwordPattern.test(password)) {
            alert("비밀번호는 소문자와 숫자를 결합하여 6자리에서 16자리로 입력해야 합니다.");
            return false;
        }

        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }
        // 전화번호 합치기
        const phone1 = document.getElementById("phone1").value.trim();
        const phone2 = document.getElementById("phone2").value.trim();
        const phone3 = document.getElementById("phone3").value.trim();
        document.getElementById("tel").value = phone1 + "-" + phone2 + "-" + phone3;

        return true;
    }
    

</script>

<script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<style>
    .info-text {
        font-size: 0.9em;
        color: #777;
    }
    #cert-list {
        list-style: disc;
        margin-left: 20px;
        padding: 5px 0;
        font-size: 0.9em;
    }
</style>
</head>
<body>

<div id="title">I,Look</div>

<form action="<c:url value='/parentInsert.action'/>" method="POST" onsubmit="return checkPasswordBeforeSubmit()" class="signup-form">
    <div class="form-section">
        <h2>회원가입</h2>
    </div>

    <!-- 아이디 -->
    <div class="form-group">
        <label class="required" for="userId">아이디</label>
        <div class="input-container">
            <input type="text" class="text" id="userId" name="id" required>
            <button type="button" class="duplicate-check" onclick="checkId()">중복체크</button>
        </div>
        <span id="id-check-message"></span>
    </div>

    <!-- 비밀번호 -->
    <div class="form-group">
        <label class="required" for="password">비밀번호</label>
        <input type="password" class="text" id="password" name="pw" required oninput="checkPassword()">
        <span id="password-error" class="error-message"></span>
    </div>

    <!-- 비밀번호 확인 -->
    <div class="form-group">
        <label class="required" for="confirmPassword">비밀번호 확인</label>
        <input type="password" class="text" id="confirmPassword" required oninput="checkPasswordMatch()">
        <span id="error-message" class="error-message"></span>
    </div>

    <!-- 이름 -->
    <div class="form-group">
        <label class="required">이름</label>
        <input type="text" class="text" name="name" required>
    </div>

    <!-- 주민등록번호 -->
    <div class="form-group">
        <label class="required">주민등록번호</label>
        <div class="ssn-container">
            <input type="text" class="text" name="ssn_first" placeholder="앞자리 6자리" maxlength="6" required>
            <span class="dash">-</span>
            <input type="password" class="text" name="ssn_second" placeholder="뒷자리 7자리" maxlength="7" required>
        </div>
    </div>

    <!-- 연락처 -->
    <div class="form-group">
        <label>연락처</label>
        <div class="phone-container">
            <input type="text" class="text" id="phone1" maxlength="3">
            <span class="dash">-</span>
            <input type="text" class="text" id="phone2" maxlength="4">
            <span class="dash">-</span>
            <input type="text" class="text" id="phone3" maxlength="4">
        </div>
        <!-- 숨겨진 tel 필드 -->
        <input type="hidden" name="tel" id="tel">
    </div>

    <!-- 주소 -->
    <div class="form-group">
        <label>주소</label>
        <div class="address-container">
            <input type="text" id="postcode" name="zip_code" readonly>
            <button type="button" onclick="searchAddress()">주소 검색</button>
        </div>
        <div class="address-container">
            <input type="text" id="address" name="road_addr" readonly>
        </div>
    </div>

    <!-- 상세주소 -->
    <div class="form-group">
        <label>상세주소</label>
        <input type="text" class="text" id="detailAddress" name="detailed_addr" placeholder="상세주소 입력">
    </div>

    <!-- 가입 버튼 -->
    <div class="form-group">
        <input type="submit" value="가입하기" class="btn" id="submit-btn">
    </div>
</form>

</body>
</html>
