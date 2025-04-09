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
<title>genWageUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/WageUpdate.css">
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
			<form action="" method="post" name="genWageUpdateForm"></form>
			<div class="content-body">
				<div class="info-wrapper">
					<div class="info-header">
						<div class="info-cell">이름</div>
						<div class="info-cell">기존 시급</div>
						<div class="info-cell">수정할 시급</div>
					</div>

					<!-- 데이터 행  -->
					<div class="info-row">
						<div class="info-cell">일반 돌봄</div>
						<div class="info-cell">11,000원</div>
						<input type="text" name="genWage" id="genWage" class="txt">
					</div>
				</div>
				
				<!-- 하단 버튼 영역 -->
				<div class="bottom-btn">
					<button type="button" class="btn submit-btn" id="submitBtn">수정하기</button>
					<button type="button" class="btn cancel-btn"
						onclick="location.href='WageList.jsp'">취소</button>
				</div>
			</div>
		</main>
	</div>
</div>

</body>
</html>