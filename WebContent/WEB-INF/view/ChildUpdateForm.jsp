
</head><%@ page contentType="text/html; charset=UTF-8"%>
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
	// 수정 확인
	function confirmUpdate()
	{
		return confirm("정말로 수정하시겠습니까?");
	}

	// 탈퇴 사유 선택 박스 보이기
	function showWithdrawReason()
	{
		document.getElementById('withdrawReasonBox').style.display = 'block';
	}

	// 탈퇴 확정 실행
	function withdrawConfirm()
	{
		var reason = document.getElementById('reason_withdrawed_id').value;
		if (reason === "")
		{
			alert("탈퇴 사유를 선택해주세요.");
			return;
		}
		if (confirm("정말로 탈퇴하시겠습니까?"))
		{
			location.href = 'parentwithdraw.action?reason_withdrawed_id=' + reason;
		}
	}
</script>
</head>

<body>

<!-- ✅ 탈퇴 완료 메시지 alert -->
<c:if test="${not empty param.message}">
	<script>alert("${param.message}");</script>
</c:if>

<header>
	<div id="logo">
		<img src="${cp}/logo.png" height="120px">
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
		<div class="menu-item">
			<a href="#"><i class="fa-solid fa-child"></i> 아이 정보 관리</a>
			<div class="submenu">
				<a href="#">아이 목록 보기</a>
				<a href="#">신규 아이 등록</a>
				<a href="#">아이 정보 수정</a>
			</div>
		</div>
		<div class="menu-item">
			<a href="#"><i class="fa-solid fa-user-group"></i> 부모 정보 관리</a>
			<div class="submenu">
				<a href="#">부모 정보 보기</a>
				<a href="#">부모 정보 수정</a>
			</div>
		</div>
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
		<form action="parentupdate.action" method="post" onsubmit="return confirmUpdate();">
			<input type="hidden" name="par_backup_id" value="${parent.par_backup_id}" />
			<input type="hidden" name="par_reg_id" value="${parent.par_reg_id}" />

			<div class="input-field">
				<label for="name">이름 :</label>
				<input type="text" id="name" name="name" value="${parent.name}" required>
			</div>

			<div class="input-field">
				<label for="id">아이디 :</label>
				<input type="text" id="id" name="id" value="${parent.id}" readonly="readonly">
			</div>

			<div class="input-field">
				<label for="pw">비밀번호 :</label>
				<input type="password" id="pw" name="pw" value="${parent.pw}" required>
			</div>

			<div class="input-field">
				<label for="tel">전화번호 :</label>
				<input type="text" id="tel" name="tel" value="${parent.tel}" required>
			</div>

			<div class="input-field">
				<label for="zip_code">우편번호 :</label>
				<input type="text" id="zip_code" name="zip_code" value="${parent.zip_code}" readonly>
				<button type="button" onclick="execDaumPostcode()">주소 찾기</button>
			</div>

			<div class="input-field">
				<label for="road_addr">도로명 주소 :</label>
				<input type="text" id="road_addr" name="road_addr" value="${parent.road_addr}" readonly>
			</div>

			<div class="input-field">
				<label for="detailed_addr">상세 주소 :</label>
				<input type="text" id="detailed_addr" name="detailed_addr" value="${parent.detailed_addr}">
			</div>

			<div class="form-buttons">
				<button type="submit" class="btn update-btn">수정하기</button>
				<button type="button" class="btn delete-btn" onclick="showWithdrawReason();">탈퇴하기</button>
			</div>
		</form>

		<!-- ✅ 탈퇴 사유 박스 (처음에는 안 보이게) -->
		<div id="withdrawReasonBox" style="display: none; margin-top: 20px;">
			<label for="reason_withdrawed_id">탈퇴 사유 선택:</label>
			<select id="reason_withdrawed_id" name="reason_withdrawed_id">
				<option value="">-- 탈퇴 사유 선택 --</option>
				<option value="001">서비스가 만족스럽지 않음</option>
				<option value="002">다른 서비스를 이용 중</option>
				<option value="003">일시적으로 이용 중단</option>
				<option value="004">개인 사정</option>
				<option value="999">기타</option>
			</select>
			<button type="button" class="btn delete-btn" onclick="withdrawConfirm();">탈퇴 확정</button>
		</div>
	</div>
</div>

<!-- 주소 API -->
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	function execDaumPostcode()
	{
		new daum.Postcode({
			oncomplete: function(data)
			{
				document.getElementById('zip_code').value = data.zonecode;
				document.getElementById('road_addr').value = data.roadAddress;
			}
		}).open();
	}
</script>

</body>
</html>

<body>

<c:if test="${updated}">
    <script>
        alert("수정이 완료되었습니다.");
    </script>
</c:if>

<header>
    <div id="logo">
        <img src="/logo.png" height="120px">
    </div>
    <nav>
        <button type="button" class="menuBtn presentPage">홈</button>
        <button type="button" class="menuBtn">로그아웃</button>
        <button type="button" class="menuBtn">스케줄러</button>
        <button type="button" class="menuBtn">기단건복서비스</button>
        <button type="button" class="menuBtn">마이페이지</button>
        <button type="button" class="menuBtn">알림함</button>
    </nav>
</header>

<div class="sidebar">
    <div class="sidebar-title">마이페이지</div>
    <div class="menu">
        <div class="menu-item">
            <a href="#"><i class="fa-solid fa-child"></i> 아이 정보 관리</a>
            <div class="submenu">
                <a href="#">아이 목록 보기</a>
                <a href="#">신글 아이 등록</a>
                <a href="#">아이 정보 수정</a>
            </div>
        </div>
        <div class="menu-item">
            <a href="#"><i class="fa-solid fa-user-group"></i> 부모 정보 관리</a>
            <div class="submenu">
                <a href="#">부모 정보 보기</a>
                <a href="#">부모 정보 수정</a>
            </div>
        </div>
        <div class="menu-item">
            <a href="#"><i class="fa-solid fa-house-chimney-user"></i> 동본 이용 현황</a>
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
        <form action="childupdate.action" method="post" onsubmit="return confirmUpdate();">
            <input type="hidden" name="child_backup_id" value="${child.child_backup_id}" />

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

            <!-- 지병 -->
            <div class="input-field">
                <label for="medical_type_id">지병:</label>
                <select id="medical_type_id" name="medical_type_id">
                    <option value="없음">없음</option>
                    <c:forEach var="m" items="${medicals}">
                        <option value="${m.medical_type_id}" 
                            <c:if test="${m.medical_type_id eq child.medical_type_id}">selected</c:if>>
                            ${m.type}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- 알레르기 -->
            <div class="input-field">
                <label for="allergy_type_id">알레르기:</label>
                <select id="allergy_type_id" name="allergy_type_id">
                    <option value="없음">없음</option>
                    <c:forEach var="a" items="${allergies}">
                        <option value="${a.allergy_type_id}" 
                            <c:if test="${a.allergy_type_id eq child.allergy_type_id}">selected</c:if>>
                            ${a.type}
                        </option>
                    </c:forEach>
                </select>
            </div>

            <!-- 장애 -->
            <div class="input-field">
                <label for="disability_type_id">장애:</label>
                <select id="disability_type_id" name="disability_type_id">
                    <option value="없음">없음</option>
                    <c:forEach var="d" items="${disabilities}">
                        <option value="${d.disability_type_id}" 
                            <c:if test="${d.disability_type_id eq child.disability_type_id}">selected</c:if>>
                            ${d.type}
                        </option>
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
