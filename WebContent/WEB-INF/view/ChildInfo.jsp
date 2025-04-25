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
<title>아이 상세정보 페이지</title>
<link rel="stylesheet" type="text/css" href="css/ChildInfo.css">
<script type="text/javascript">
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
</script>
</head>
<body>

	<!-- 상단 헤더 영역 -->
	<div id="header-container">
		<c:import url="/parentheader.action" />
	</div>

	<div class="sidebar">
		<c:import url="/parentsidebar.action"></c:import>
	</div>

	<!-- 상단 생략 (header, sidebar 동일) -->

	<div class="page-title">
		<h2>아이 상세 정보</h2>
	</div>

	<div class="container">
		<div class="modify-content">
			<form>
				<!-- 이름 -->
				<div class="input-field">
					<label for="name">이름 :</label> <input type="text" id="name"
						name="name" value="${child.name}" readonly="readonly">
				</div>

				<!-- 생년월일 → 나이는 서버에서 계산해서 모델에 담아 전달하는 게 좋습니다. -->
				<div class="input-field">
					<label for="age">나이 :</label>
					<div class="input-with-unit">
						<input type="number" id="age" name="age" value="${age}"
							readonly="readonly"> <span>세</span>
					</div>
				</div>

				<!-- 키 -->
				<div class="input-field">
					<label for="height">키 :</label>
					<div class="input-with-unit">
						<input type="number" id="height" name="height"
							value="${child.height}" readonly="readonly"> <span>cm</span>
					</div>
				</div>

				<!-- 몸무게 -->
				<div class="input-field">
					<label for="weight">몸무게 :</label>
					<div class="input-with-unit">
						<input type="number" id="weight" name="weight"
							value="${child.weight}" readonly="readonly"> <span>kg</span>
					</div>
				</div>

				<!-- 혈액형 -->
				<div class="input-field">
					<label for="blood">혈액형 :</label>
					<div class="input-with-unit">
						<input type="text" id="blood" name="blood"
							value="${child.blood_type}" readonly="readonly"> <span>형</span>
					</div>
				</div>

				<!-- 장애 -->
				<div class="input-field">
					<label for="disability">장애:</label> <input type="text"
						id="disability" name="disability" value="${child.disability}"
						readonly="readonly">
				</div>

				<!-- 지병 -->
				<div class="input-field">
					<label for="disease">지병:</label> <input type="text" id="disease"
						name="disease" value="${child.disease}" readonly="readonly">
				</div>

				<!-- 알레르기 -->
				<div class="input-field">
					<label for="allergy">알레르기:</label> <input type="text" id="allergy"
						name="allergy" value="${child.allergy}" readonly="readonly">
				</div>


				<!-- 특이사항 -->
				<div class="input-field">
					<label for="remarks">특이사항:</label>
					<div class="input-with-unit">
						<textarea id="remark-text" name="remarks" rows="4" cols="50"
							readonly="readonly">${child.special_notes}</textarea>
					</div>
				</div>

				<!-- 메인으로 이동 -->
				<div class="form-buttons">
					<button type="button" class="btn update-btn"
						onclick="location.href='parentmypage.action'">메인으로</button>
				</div>
			</form>
		</div>
	</div>

</body>
</html>