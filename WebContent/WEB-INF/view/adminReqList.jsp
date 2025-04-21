<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	
</script>
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
				<!-- 타이틀 영역 -->
				<div class="content-header">
					<h1 class="content-title">예약 신청 내역</h1>
				</div>

				<!-- 필터 영역 -->
				<form action="adminreqlist.action" method="get" name="searchForm">
					<div class="content-filter-area">
						<div class="content-filter">
							<!-- 돌봄 유형 필터 -->
							<div class="filter-group care-type-filter">
								<label><input type="radio" name="careType" value="normal"
									<c:if test="${careType == 'normal'}">checked</c:if>>일반돌봄</label>
								<label><input type="radio" name="careType" value="emergency"
									<c:if test="${careType == 'emergency'}">checked</c:if>>긴급돌봄</label>
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
									<option value="week">1주일</option>
									<option value="month">1개월</option>
									<option value="3month">3개월</option>
									<option value="allDay">전체보기</option>
								</select>
							</div>
							<div id="customDate" style="display: none;">
						    <label>시작일: <input type="date" name="startDate" id="startDate" value="${startDate}"></label>
						    <label>종료일: <input type="date" name="endDate" id="endDate" value="${endDate}"></label>
							</div>
						
							<!-- 검색 폼 -->
							<div class="search-form">
								<select name="searchKey" class="selectFiled">
									<option value="par_name">부모 이름</option>
									<option value="par_backup_id">부모 코드</option>
								</select> 
								<input type="text" name="searchValue" class="txt" value="">
								<input type="submit" value="검색" class="btn search-btn">
							</div>
						</div>
					</div>
				</form>
				
				<div class="content-body">
					<div class="info-wrapper">
						<div class="info-header">
							<div class="info-cell">번호</div>
							<div class="info-cell">예약 번호</div>
							<div class="info-cell">상태</div>
							<div class="info-cell">부모 이름</div>
							<div class="info-cell">예약일</div>
							<div class="info-cell">결제상태</div>
							<div class="info-cell">상세보기</div>
							<div class="info-cell">삭제</div>
						</div>

						<!-- 데이터 행 -->
						<c:forEach var="list" items="${list }" varStatus="status">
							<div class="info-row">
								<div class="info-cell">${paging.startNum - status.index }</div>
								<div class="info-cell">${list.gen_req_id }</div>
								<div class="info-cell">${list.status }</div>
								<div class="info-cell">${list.par_name }</div>
								<div class="info-cell">${fn:substring(list.req_date, 0, 10)}</div>
								<div class="info-cell">${list.pay_status }</div>
								<div class="info-cell">
									<div class="action-buttons">
										<button type="button" class="btn detail-btn"
											onclick="location.href='<%=cp%>admingenreqdetail.action?gen_req_id=
											${list.gen_req_id}&careType=${careType}'">상세보기</button>
									</div>
								</div>
								<div class="info-cell">
									<div class="action-buttons">
										<button type="button" class="btn delete-btn">삭제</button>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>

					<!-- 페이지 영역 -->
					<div class="page">
						<c:if test="${paging.totalPage >= 1}">
							<c:if test="${paging.startPage > 1}">
								<a href="adminreqlist.action?page=${p}&careType=${careType}&searchKey=${searchKey}&searchValue=${searchValue}">&lt;</a>
							</c:if>
						
							<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
								<c:choose>
									<c:when test="${p == paging.page}">
										<strong>${p}</strong>
									</c:when>
									<c:otherwise>
										<a href="adminreqlist.action?page=${p}&careType=${careType}
											&searchKey=${searchKey}&searchValue=${searchValue}">${p}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${paging.endPage < paging.totalPage}">
								<a href="adminreqlist.action?page=${paging.endPage+1}&searchKey=${searchKey}&searchValue=${searchValue}"> > </a>
							</c:if>
						</c:if>
					</div>
				</div>
			</main>
		</div>
	</div>

</body>
</html>