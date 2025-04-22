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
					<a href="#">아이 목록 보기</a> <a href="#">신규 아이 등록</a> <a href="#">아이
						정보 수정</a>
				</div>
			</div>

			<!-- 부모 정보 -->
			<div class="menu-item">
				<a href="#"><i class="fa-solid fa-user-group"></i> 부모 정보 관리</a>
				<div class="submenu">
					<a href="#">부모 정보 보기</a> <a href="#">부모 정보 수정</a>
				</div>
			</div>

			<!-- 돌봄 이용 -->
			<div class="menu-item">
				<a href="#"><i class="fa-solid fa-house-chimney-user"></i> 돌봄 이용
					현황</a>
				<div class="submenu">
					<a href="#">현재 이용 내역</a> <a href="#">이용 완료 내역</a>
				</div>
			</div>

		</div>
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