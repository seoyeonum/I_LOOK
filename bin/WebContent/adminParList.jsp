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
<title>adminParList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/memberManagement.css">
</head>
<body>
<div class="wrap">
	<header>
		<c:import url="adminHeader.jsp"></c:import>
	</header>

	<div class="container">
		<!--사이드바 영역 -->
		<c:import url="memberSidebar.jsp"></c:import>

		 <!-- 메인 콘텐츠 영역 -->
		<main class="main-content">
			<div class="content-header">
				<h1 class="content-title">부모 회원 정보</h1>

				<div class="search-form">
					<form action="" name="searchForm" method="post">
						<select name="searchKey" class="selectFiled">
							<option value="subject">부모 코드</option>
							<option value="name">이름</option>
						</select>
						<input type="text" name="searchValue" class="txt" value="">
						<input type="button" value="검색" class="btn search-btn" onclick="sendIt()">
					</form>
				</div>
			</div>

			<div class="content-body">
				<div class="info-wrapper">
					<div class="info-header">
						<div class="info-cell">번호</div>
						<div class="info-cell">이름</div>
						<div class="info-cell">연락처</div>
						<div class="info-cell">부모 코드</div>
						<div class="info-cell">아이 코드</div>
						<div class="info-cell">가입일</div>
						<div class="info-cell">상세 보기</div>
					</div>

					<!-- 데이터 행 - 실제 사용시 반복문으로 처리 -->
					<div class="info-row">
						<div class="info-cell">1</div>
						<div class="info-cell">김민준</div>
						<div class="info-cell">010-1234-5678</div>
						<div class="info-cell">PBAC00001</div>
                        <div class="info-cell">CREG00001</div>
						<div class="info-cell">2024-11-10</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn" onclick="location.href='adminParDetail.jsp'">상세 보기</button>
							</div>
						</div>
					</div>

					<div class="info-row">
				    	<div class="info-cell">2</div>
						<div class="info-cell">이서연</div>
						<div class="info-cell">010-2345-6789</div>
						<div class="info-cell">PBAC00002</div>
                        <div class="info-cell">CREG00002</div>
						<div class="info-cell">2024-12-22</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn">상세 보기</button>
							</div>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-cell">3</div>
						<div class="info-cell">박지후</div>
						<div class="info-cell">010-3456-7890</div>
						<div class="info-cell">PBAC00003</div>
                        <div class="info-cell">CREG00003</div>
						<div class="info-cell">2025-01-15</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn">상세 보기</button>
							</div>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-cell">4</div>
						<div class="info-cell">최예린</div>
						<div class="info-cell">010-4567-8901</div>
						<div class="info-cell">PBAC00004</div>
                        <div class="info-cell">CREG00004</div>
						<div class="info-cell">2025-02-01</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn">상세 보기</button>
							</div>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-cell">5</div>
						<div class="info-cell">정하준</div>
						<div class="info-cell">010-5678-9012</div>
						<div class="info-cell">PBAC00005</div>
                        <div class="info-cell">CREG00005</div>
						<div class="info-cell">2025-03-05</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn">상세 보기</button>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 페이징 영역 -->
				<div class="page">
					<p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 42</p>
				</div>
			</div>
		</main>
	</div>
</div>
</body>
</html>