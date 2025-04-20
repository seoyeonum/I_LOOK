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
<title>시터 회원가입 페이지</title>
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

        fetch("<c:url value='/CheckDuplicateIdServlet'/>?userId=" + encodeURIComponent(userId))
            .then(res => res.json())
            .then(data => {
                if (data.exists) {
                    messageSpan.style.color = "red";
                    messageSpan.textContent = "이미 사용 중인 아이디입니다.";
                } else {
                    messageSpan.style.color = "green";
                    messageSpan.textContent = "사용 가능한 아이디입니다!";
                }
            })
            .catch(error => {
                console.error("중복 확인 오류:", error);
                messageSpan.style.color = "red";
                messageSpan.textContent = "서버 오류로 확인 실패.";
            });
    }

    // 자격증 추가 필드
    function addCertField() {
        const certArea = document.getElementById("cert-area");
        const certBlock = document.createElement("div");
        certBlock.className = "cert-block";
        certBlock.innerHTML = `
            <select name="cert_type_ids">
                <option value="001">보육 교사 1급 (일반)</option>
                <option value="002">보육 교사 2급 (특수)</option>
                <option value="003">보육 교사 2급 (일반)</option>
                <option value="004">특수 교사 자격증</option>
            </select>
            <input type="file" name="certificates" accept=".pdf,.jpg,.jpeg,.png">
        `;
        certArea.appendChild(certBlock);
    }

    function checkPassword() {
        var password = document.getElementById("password").value;
        var errorMessage = document.getElementById("password-error");
        var passwordPattern = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,16}$/;

        if (!passwordPattern.test(password)) {
            errorMessage.textContent = "비밀번호는 소문자+숫자 6~16자리여야 합니다.";
        } else {
            errorMessage.textContent = "";
        }
    }

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

    function checkPasswordBeforeSubmit() {
        var password = document.getElementById("password").value;
        var confirmPassword = document.getElementById("confirmPassword").value;
        var passwordPattern = /^(?=.*[a-z])(?=.*\d)[a-z\d]{6,16}$/;

        if (!passwordPattern.test(password)) {
            alert("비밀번호는 소문자+숫자 6~16자리로 입력하세요.");
            return false;
        }

        if (password !== confirmPassword) {
            alert("비밀번호가 일치하지 않습니다.");
            return false;
        }

        return true;
    }

    // 연락처 합치기
    window.onload = function () {
        document.getElementById("submit-btn").addEventListener("click", function () {
            const phone = document.getElementById("phone1").value + "-" 
                        + document.getElementById("phone2").value + "-" 
                        + document.getElementById("phone3").value;
            document.getElementById("tel").value = phone;
        });
    }
</script>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>

<body>
<div id="title">I,Look</div>

<form action="<%=cp %>/sitterInsert.action" method="POST" 
      enctype="multipart/form-data" 
      onsubmit="return checkPasswordBeforeSubmit()" class="signup-form">

    <div class="form-section">
        <h2>회원요청</h2>
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
        <label class="required">비밀번호</label>
        <input type="password" class="text" id="password" name="pw" required oninput="checkPassword()">
        <span id="password-error" class="error-message"></span>
    </div>

    <!-- 비밀번호 확인 -->
    <div class="form-group">
        <label class="required">비밀번호 확인</label>
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
            <input type="text" class="text" name="ssn_first" placeholder="앞자리" maxlength="6" required>
            <span class="dash">-</span>
            <input type="password" class="text" name="ssn_second" placeholder="뒷자리" maxlength="7" required>
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

    <!-- 보건증 -->
    <div class="form-group">
        <label class="required">보건증 첨부</label>
        <input type="file" name="healthCert" accept=".pdf,.jpg,.jpeg,.png" required>
    </div>

    <!-- 범죄이력 -->
    <div class="form-group">
        <label class="required">범죄이력 회신서 첨부</label>
        <input type="file" name="crimeRecord" accept=".pdf,.jpg,.jpeg,.png" required>
    </div>

    <!-- 자격증 -->
    <div class="form-group">
        <label>자격증 첨부 (선택, 여러 개 가능)</label>
        <div id="cert-area">
            <div class="cert-block">
                <select name="cert_type_ids">
                    <option value="001">보육 교사 1급 (일반)</option>
                    <option value="002">보육 교사 2급 (특수)</option>
                    <option value="003">보육 교사 2급 (일반)</option>
                    <option value="004">특수 교사 자격증</option>
                </select>
                <input type="file" name="certificates" accept=".pdf,.jpg,.jpeg,.png">
            </div>
        </div>
        <button type="button" onclick="addCertField()">+ 자격증 추가</button>
    </div>

    <!-- ✅ 중복 제거된 가입 버튼 -->
    <div class="form-group">
        <input type="submit" value="가입하기" class="btn" id="submit-btn">
    </div>
</form>

</body>
</html>
