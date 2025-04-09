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
<title>WageList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/WageList.css">
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
				<h1 class="content-title">시급 정보</h1>
			</div>

			<div class="content-body">
				<div class="info-wrapper">
					<div class="info-header">
						<div class="info-cell">이름</div>
						<div class="info-cell">시급</div>
						<div class="info-cell">수정</div>
					</div>

					<!-- 데이터 행  -->
					<div class="info-row">
						<div class="info-cell">일반 돌봄</div>
						<div class="info-cell">11,000원</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn update-btn" onclick="location.href='genWageUpdateForm.jsp'">수정</button>
							</div>
						</div>
					</div>
					<div class="info-row">
						<div class="info-cell">긴급 돌봄</div>
						<div class="info-cell">15,000원</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn update-btn" onclick="location.href='genWageUpdateForm.jsp'">수정</button>
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