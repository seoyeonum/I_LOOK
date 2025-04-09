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
<title>gradeUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gradeUpdateForm.css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
</script>
</head>
<body>
	<div class="wrap">
		<header>
			<c:import url="adminHeader.jsp"></c:import>
		</header>
		<div class="container">
			<!-- 사이드바 영역 -->
			<c:import url="serviceSidebar.jsp"></c:import>
			<main class="main-content">
				<div class="content-header">
					<div class="content-title">등급 정보 수정</div>
				</div>

				<!-- form 태그 추가 -->
				<form action="" method="post" id="gradeUpdateForm" enctype="multipart/form-data">
					<div class="content-body">
						<!-- 왼쪽 컬럼 - 등급 이미지 업로드 -->
						<div class="left-column">
							<div class="image">
								<span class="grade-image">등급 사진</span>
								<div class="image-preview" id="imagePreview">
									<img src="" alt="등급 이미지 미리보기" id="previewImage" />
								</div>
							</div>

							<div class="intro-section">
								<div class="intro-header">등급 사진 업로드</div>
								<input type="file" name="gradeImage" id="gradeImage"
									accept="image/*" style="display: none;">
								<button type="button" class="btn upload-btn">업로드</button>
							</div>
						</div>

						<!-- 오른쪽 컬럼 - 입력 정보 -->
						<div class="right-column">
							<div class="info-row">
								<div class="info-header">등급 이름</div>
								<div class="info-cell">
									<input type="text" name="gradeName" id="gradeName"
										class="info-input" placeholder="등급 이름을 입력하세요">
								</div>
							</div>

							<div class="info-row">
								<div class="info-header">취소 누적 근무 시간</div>
								<div class="info-cell">
									<input type="text" name="workHours" id="workHours"
										class="info-input" placeholder="예: 20000">
								</div>
							</div>

							<div class="info-row">
								<div class="info-header">일 최대 근무 시간</div>
								<div class="info-cell">
									<input type="text" name="maxHours" id="maxHours"
										class="info-input" placeholder="예: 8">
								</div>
							</div>

							<div class="info-row">
								<div class="info-header">시급 배수</div>
								<div class="info-cell">
									<input type="text" name="payMultiplier" id="payMultiplier"
										class="info-input" placeholder="예: 2.0">
								</div>
							</div>
						</div>
					</div>

					<!-- 하단 버튼 영역 -->
					<div class="bottom-btn">
						<button type="button" class="btn submit-btn" id="submitBtn">수정하기</button>
						<button type="button" class="btn cancel-btn"
							onclick="location.href='gradeList.jsp'">취소</button>
					</div>
				</form>
			</main>
		</div>
	</div>
</body>
</html>