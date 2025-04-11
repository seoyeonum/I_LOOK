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
<title>adminSitViolList.jsp</title>
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
				<h1 class="content-title">시터 위반 내역</h1>

				<div class="search-form">
					<form action="" name="searchForm" method="post">
						<select name="searchKey" class="selectFiled">
							<option value="name">이름</option>
							<option value="subject">시터 코드</option>
						</select>
						<input type="text" name="searchValue" class="txt" value="">
						<input type="button" value="검색" class="btn search-btn" onclick="sendIt()">
					</form>
				</div>
			</div>

			<div class="content-body">
				<div class="info-wrapper">
					<div class="info-header-viol">
						<div class="info-cell">번호</div>
						<div class="info-cell">이름</div>
						<div class="info-cell">시터 코드</div>
						<div class="info-cell">위반 코드</div>
						<div class="info-cell">위반 내용</div>
						<div class="info-cell">위반일</div>
					</div>

					<!-- 데이터 행 - 실제 사용시 반복문으로 처리 -->
					<div class="info-row-viol">
						<div class="info-cell">1</div>
						<div class="info-cell">김수지</div>
						<div class="info-cell">SBAC00001</div>
						<div class="info-cell">SVIO00001</div>
						<div class="info-cell">부재</div>
						<div class="info-cell">2025-04-01</div>
					</div>

					<div class="info-row-viol">
						<div class="info-cell">2</div>
						<div class="info-cell">배두나</div>
						<div class="info-cell">SBAC00002</div>
						<div class="info-cell">SVIO00002</div>
						<div class="info-cell">폭행 행위</div>
						<div class="info-cell">2025-04-03</div>
					</div>
					
					<!-- 예시 데이터(실제 구현시 삭제) - 스크롤 확인용 -->
					<div class="info-row-viol">
						<div class="info-cell">3</div>
						<div class="info-cell">하리보</div>
						<div class="info-cell">SBAC00003</div>
						<div class="info-cell">SVIO00003</div>
						<div class="info-cell">폭언</div>
						<div class="info-cell">2025-04-05</div>
					</div>
					
					<div class="info-row-viol">
						<div class="info-cell">4</div>
						<div class="info-cell">이영희</div>
						<div class="info-cell">SBAC00004</div>
						<div class="info-cell">SVIO00004</div>
						<div class="info-cell">지각</div>
						<div class="info-cell">2025-04-06</div>
					</div>
					
					<div class="info-row-viol">
						<div class="info-cell">5</div>
						<div class="info-cell">박철수</div>
						<div class="info-cell">SBAC00005</div>
						<div class="info-cell">SVIO00005</div>
						<div class="info-cell">폭행 행위ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ</div>
						<div class="info-cell">2025-04-03</div>
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