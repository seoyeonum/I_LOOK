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

 document.addEventListener('DOMContentLoaded', function()
		{
			var firstButton = document.querySelector('.menuBtn.presentPage');
			if (firstButton)
			{
				firstButton.classList.remove('presentPage');
			}
			var button = document.querySelector('#mypage');
			if (button)
			{
				button.classList.add('presentPage');
			}
		});
			
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
			location.href = 'parentwithdraw.action?reason_withdrawed_id='
					+ reason;
		}
	}
</script>
</head>

<body>

	<!-- ✅ 탈퇴 완료 메시지 alert -->
	<c:if test="${not empty param.message}">
		<script>
			alert("${param.message}");
		</script>
	</c:if>

	<!-- 상단 헤더 영역 -->
	<div id="header-container">
		<c:import url="/parentheader.action" />
	</div>

	<!-- 사이드 메뉴 -->
	<div class="sidebar">
		<c:import url="/WEB-INF/view/parentSidebar.jsp"/>
	</div>

	<div class="page-title">
		<h2>부모 정보 수정하기</h2>
	</div>

	<div class="container">
		<div class="modify-content">
			<form action="parentupdate.action" method="post"
				onsubmit="return confirmUpdate();">
				<input type="hidden" name="par_backup_id"
					value="${parent.par_backup_id}" /> <input type="hidden"
					name="par_reg_id" value="${parent.par_reg_id}" />

				<div class="input-field">
					<label for="name">이름 :</label> <input type="text" id="name"
						name="name" value="${parent.name}" required>
				</div>

				<div class="input-field">
					<label for="id">아이디 :</label> <input type="text" id="id" name="id"
						value="${parent.id}" readonly="readonly">
				</div>

				<div class="input-field">
					<label for="pw">비밀번호 :</label> <input type="password" id="pw"
						name="pw" value="${parent.pw}" required>
				</div>

				<div class="input-field">
					<label for="tel">전화번호 :</label> <input type="text" id="tel"
						name="tel" value="${parent.tel}" required>
				</div>
<div class="input-field">
    <label for="zip_code">우편번호 :</label>  
    <input type="text" id="zip_code" name="zip_code" value="${parent.zip_code}" readonly>
    <button type="button" onclick="execDaumPostcode()" class="btn">주소 찾기</button>
</div>

<div class="input-field">
    <label for="road_addr">도로명 주소 :</label>  
    <input type="text" id="road_addr" name="road_addr" value="${parent.road_addr}" readonly>
</div>

<div class="input-field">
    <label for="detailed_addr">상세 주소 :</label>  
    <input type="text" id="detailed_addr" name="detailed_addr" value="${parent.detailed_addr}">
</div>

<!-- 버튼들 전부 btn class로만! -->
<div class="form-buttons">
    <button type="submit" class="btn">수정하기</button>
    <button type="button" class="btn" onclick="showWithdrawReason();">탈퇴하기</button>
</div>

<!-- 탈퇴 사유와 탈퇴 확정도 btn class! -->
<div class="form-buttons" id="withdrawReasonBox" style="display: none;">
    <select id="reason_withdrawed_id" name="reason_withdrawed_id">
        <option value="">-- 탈퇴 사유 선택 --</option>
        <c:forEach var="reason" items="${withdrawReasons}">
            <option value="${reason.reason_withdrawed_id}">${reason.type}</option>
        </c:forEach>
    </select>
    <button type="button" class="btn" onclick="withdrawConfirm();">탈퇴 확정</button>
</div>



	<!-- 주소 API -->
	<script
		src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
		function execDaumPostcode()
		{
			new daum.Postcode(
					{
						oncomplete : function(data)
						{
							document.getElementById('zip_code').value = data.zonecode;
							document.getElementById('road_addr').value = data.roadAddress;
						}
					}).open();
		}
	</script>

</body>
</html>
