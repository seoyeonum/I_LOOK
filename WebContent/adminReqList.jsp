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
<title>adminReqList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminReqList.css">
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
				<!-- 타이틀 영역 -->
				<div class="content-header">
					<h1 class="content-title">예약 신청 내역</h1>
				</div>

				<!-- 필터 영역 -->
				<div class="content-filter-area">
					<div class="content-filter">
						<!-- 돌봄 유형 필터 -->
						<div class="filter-group care-type-filter">
							<label><input type="radio" name="careType" value="general" checked>일반돌봄</label> 
							<label><input type="radio" name="careType" value="emergency" checked>긴급돌봄</label>
						</div>

						<!-- 예약 상태 필터 -->
						<div class="filter-group status-filter">
							<select name="reservationStatus" class="selectField">
								<option value="all">예약 상태: 전체</option>
								<option value="request">예약 신청</option>
								<option value="confirmed">예약 확정</option>
								<option value="completed">예약 완료</option>
								<option value="canceled">예약 취소</option>
							</select>
						</div>

						<!-- 날짜 필터 -->
						<div class="filter-group date-filter">
							<select name="dateRange" class="selectField">
								<option value="week">기본 1주일</option>
								<option value="today">1일</option>
								<option value="month">1개월</option>
								<option value="3month">3개월</option>
								<option value="custom">사용자 지정</option>
							</select>
						</div>
						
						<!-- 날짜 사용자 지정 -->
						<div id="customDate" style="display: none; margin-top: 10px;">
							<label>시작일: <input type="date" name="startDate" id="startDate"></label>
							<label>종료일: <input type="date" name="endDate" id="endDate"></label>
						</div>
						
						<!-- 검색 폼 -->
						<div class="search-form">
							<form action="" name="searchForm" method="post">
								<select name="searchKey" class="selectFiled">
									<option value="name">이름</option>
									<option value="subject">부모 코드</option>
									<option value="subject">시터 코드</option>
								</select> <input type="text" name="searchValue" class="txt" value="">
								<input type="button" value="검색" class="btn search-btn"
									onclick="sendIt()">
							</form>
						</div>
					</div>
				</div>

				<div class="content-body">
					<div class="info-wrapper">
						<div class="info-header">
							<div class="info-cell">번호</div>
							<div class="info-cell">예약 번호</div>
<<<<<<< HEAD
							<div class="info-cell">돌봄 유형</div>
=======
>>>>>>> origin/develop
							<div class="info-cell">상태</div>
							<div class="info-cell">부모 이름</div>
							<div class="info-cell">시터 이름</div>
							<div class="info-cell">예약일</div>
							<div class="info-cell">결제상태</div>
							<div class="info-cell">상세보기</div>
							<div class="info-cell">삭제</div>
						</div>

						<!-- 데이터 행 - 실제 사용시 반복문으로 처리 -->
						<div class="info-row">
							<div class="info-cell">3</div>
							<div class="info-cell">GREQ00002</div>
<<<<<<< HEAD
							<div class="info-cell">일반</div>
=======
>>>>>>> origin/develop
							<div class="info-cell">예약 신청</div>
							<div class="info-cell">김민준</div>
							<div class="info-cell">이시연</div>
							<div class="info-cell">2025-04-05</div>
							<div class="info-cell">미결제</div>
							<div class="info-cell">
								<div class="action-buttons">
									<button type="button" class="btn detail-btn"
										onclick="location.href='adminGenReqDetail.jsp'">상세보기</button>
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
							<div class="info-cell">EREQ00002</div>
<<<<<<< HEAD
							<div class="info-cell">긴급</div>
=======
>>>>>>> origin/develop
							<div class="info-cell">예약 신청</div>
							<div class="info-cell">홍길동</div>
							<div class="info-cell">임꺽정</div>
							<div class="info-cell">2025-04-03</div>
							<div class="info-cell">결제완료</div>
							<div class="info-cell">
								<div class="action-buttons">
									<button type="button" class="btn detail-btn"
										onclick="location.href='adminGenReqDetail.jsp'">상세보기</button>
								</div>
							</div>
							<div class="info-cell">
								<div class="action-buttons">
									<button type="button" class="btn delete-btn">삭제</button>
								</div>
							</div>
						</div>

						<div class="info-row">
							<div class="info-cell">1</div>
							<div class="info-cell">GREQ00001</div>
<<<<<<< HEAD
							<div class="info-cell">일반</div>
=======
>>>>>>> origin/develop
							<div class="info-cell">예약 확정</div>
							<div class="info-cell">고지섭</div>
							<div class="info-cell">풋사과</div>
							<div class="info-cell">2025-04-03</div>
							<div class="info-cell">결제완료</div>
							<div class="info-cell">
								<div class="action-buttons">
									<button type="button" class="btn detail-btn"
										onclick="location.href='adminGenReqDetail.jsp'">상세보기</button>
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