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
<title>adminGenRegList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminGenRegList.css">
</head>
<body>

<div class="wrap">
	<header>
		<c:import url="adminHeader.jsp"></c:import>
	</header>

	<div class="container">
		<!--사이드바 영역 -->
		<c:import url="sidebarService.jsp"></c:import>

		 <!-- 메인 콘텐츠 영역 -->
		<main class="main-content">
			<div class="content-header">
				<h1 class="content-title">근무 등록 내역</h1>

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
					<div class="info-header">
						<div class="info-cell">번호</div>
						<div class="info-cell">이름</div>
						<div class="info-cell">시작일</div>
						<div class="info-cell">종료일</div>
						<div class="info-cell">시작 시간</div>
						<div class="info-cell">종료 시간</div>
						<div class="info-cell">시터 코드</div>
						<div class="info-cell">등록일</div>
						<div class="info-cell">상세보기</div>
						<div class="info-cell">삭제</div>
					</div>

					<!-- 데이터 행 - 실제 사용시 반복문으로 처리 -->
					<div class="info-row">
						<div class="info-cell">1</div>
						<div class="info-cell">김철수</div>
						<div class="info-cell">2025-04-10</div>
						<div class="info-cell">2025-04-20</div>
						<div class="info-cell">08:00</div>
						<div class="info-cell">11:00</div>
						<div class="info-cell">SBAC00001</div>
						<div class="info-cell">2025-04-01</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn" onclick="location.href='adminGenRegDetail.jsp'">상세보기</button>
							</div>
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn delete-btn">삭제</button>
							</div>
						</div>
					</div>

					<div class="info-row">
						<div class="info-cell">2</div>
						<div class="info-cell">배두나</div>
						<div class="info-cell">2025-04-20</div>
						<div class="info-cell">2025-04-30</div>
						<div class="info-cell">13:00</div>
						<div class="info-cell">19:00</div>
						<div class="info-cell">SBAC00002</div>
						<div class="info-cell">2025-04-05</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn">상세보기</button>
							</div>
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn delete-btn">삭제</button>
							</div>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-cell">3</div>
						<div class="info-cell">홍길동</div>
						<div class="info-cell">2025-05-15</div>
						<div class="info-cell">2025-05-20</div>
						<div class="info-cell">10:00</div>
						<div class="info-cell">19:00</div>
						<div class="info-cell">SBAC00003</div>
						<div class="info-cell">2025-05-05</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn">상세보기</button>
							</div>
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn delete-btn">삭제</button>
							</div>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-cell">4</div>
						<div class="info-cell">풋사과</div>
						<div class="info-cell">2025-03-20</div>
						<div class="info-cell">2025-03-30</div>
						<div class="info-cell">17:00</div>
						<div class="info-cell">19:00</div>
						<div class="info-cell">SBAC00004</div>
						<div class="info-cell">2025-03-05</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn">상세보기</button>
							</div>
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn delete-btn">삭제</button>
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