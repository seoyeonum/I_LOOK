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
<title>gradeList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/gradeList.css">
</head>
<body>

<div class="wrap">
	<header>
		<c:import url="adminHeader.jsp"></c:import>
	</header>

	<div class="container">
		<!--사이드바 영역 -->
		<c:import url="serviceSidebar.jsp"></c:import>

		 <!-- 메인 콘텐츠 영역 -->
		<main class="main-content">
			<div class="content-header">
				<h1 class="content-title">등급 정보</h1>

				<div class="insert-form">
					<form action="gradeInsertForm.jsp" name="insertForm" method="post">
						<button type="submit" class="btn">등급 추가</button>
					</form>
				</div>
			</div>

			<div class="content-body">
				<div class="info-wrapper">
					<div class="info-header">
						<div class="info-cell">등급 이름</div>
						<div class="info-cell">최소 누적 근무 시간</div>
						<div class="info-cell">일 최대 근무 시간</div>
						<div class="info-cell">시급 배수</div>
						<div class="info-cell">등급 이미지</div>
						<div class="info-cell">수정</div>
						<div class="info-cell">삭제</div>
					</div>

					<!-- 데이터 행 - 실제 사용시 반복문으로 처리 -->
					<div class="info-row">
						<div class="info-cell">신입</div>
						<div class="info-cell">0시간</div>
						<div class="info-cell">2시간</div>
						<div class="info-cell">1.0</div>
						<div class="info-cell">
							<img alt="신입 이미지" src="imgs/newbie.gif" class="info-cell-img" width="50px" height="50px">
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn update-btn" onclick="location.href='gradeUpdateForm.jsp'">수정</button>
							</div>
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn delete-btn">삭제</button>
							</div>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-cell">브론즈</div>
						<div class="info-cell">120시간</div>
						<div class="info-cell">8시간</div>
						<div class="info-cell">1.0</div>
						<div class="info-cell">
							<img alt="브론즈 이미지" src="imgs/bronze.gif" class="info-cell-img" width="50px" height="50px">
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn update-btn" onclick="location.href='gradeUpdateForm.jsp'">수정</button>
							</div>
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn delete-btn">삭제</button>
							</div>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-cell">실버</div>
						<div class="info-cell">1000시간</div>
						<div class="info-cell">8시간</div>
						<div class="info-cell">1.2</div>
						<div class="info-cell">
							<img alt="실버 이미지" src="imgs/silver.gif" class="info-cell-img" width="50px" height="50px">
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn update-btn" onclick="location.href='gradeUpdateForm.jsp'">수정</button>
							</div>
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn delete-btn">삭제</button>
							</div>
						</div>
					</div>
					<div class="info-row">
						<div class="info-cell">골드</div>
						<div class="info-cell">5000시간</div>
						<div class="info-cell">8시간</div>
						<div class="info-cell">1.5</div>
						<div class="info-cell">
							<img alt="골드 이미지" src="imgs/gold.gif" class="info-cell-img" width="50px" height="50px">
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn update-btn" onclick="location.href='gradeUpdateForm.jsp'">수정</button>
							</div>
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn delete-btn">삭제</button>
							</div>
						</div>
					</div>
					<div class="info-row">
						<div class="info-cell">플래티넘</div>
						<div class="info-cell">10000시간</div>
						<div class="info-cell">8시간</div>
						<div class="info-cell">1.7</div>
						<div class="info-cell">
							<img alt="플래티넘 이미지" src="imgs/platinum.gif" class="info-cell-img" width="50px" height="50px">
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn update-btn" onclick="location.href='gradeUpdateForm.jsp'">수정</button>
							</div>
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn delete-btn">삭제</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>
	</div>
</div>

</body>
</html>