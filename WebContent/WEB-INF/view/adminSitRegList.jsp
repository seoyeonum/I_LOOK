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
<title>adminGenRegList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminGenRegList.css">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
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

					<!-- 날짜 필터 -->
					<div class="filter-group date-filter">
						<select name="currentOnly" id="currentOnlySelect" class="selectField">
						    <option value="true"  selected>진행 중</option>
						    <option value="false">전체</option>
						</select>
					</div>

					<!-- 검색 폼 -->
					<div class="search-form">
						<form action="admingenreglist.action" name="searchForm"
							method="get">
							<select name="searchKey" class="selectFiled">
								<option value="name" ${searchKey == 'name' ? 'selected' : ''}>이름</option>
								<option value="sit_backup_id"
									${searchKey == 'sit_backup_id' ? 'selected' : ''}>시터
									코드</option>
							</select> <input type="text" name="searchValue" class="txt"
								value="${searchValue }"> <input type="submit" value="검색"
								class="btn search-btn">
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
						<c:forEach var="genRegList" items="${genRegList }"
							varStatus="status">
							<div class="info-row">
								<div class="info-cell">${paging.startNum - status.index}</div>
								<div class="info-cell">${genRegList.name }</div>
								<div class="info-cell">${fn:substring(genRegList.start_date, 0, 10) }</div>
								<div class="info-cell">${fn:substring(genRegList.end_date, 0, 10) }</div>
								<div class="info-cell">${genRegList.start_time }</div>
								<div class="info-cell">${genRegList.end_time }</div>
								<div class="info-cell">${genRegList.sit_backup_id }</div>
								<div class="info-cell">${fn:substring(genRegList.reg_date, 0, 10)}</div>
								<div class="info-cell">
									<div class="action-buttons">
										<button type="button" class="btn detail-btn"
											onclick="location.href='<%=cp%>/admingenregdetail.action?gen_reg_id=${genRegList.gen_reg_id}&sit_reg_id=${genRegList.sit_reg_id }'">상세보기</button>
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

					<!-- 페이징 영역 -->
					<div class="page">
						<c:if test="${paging.totalPage >= 1}">
							<c:if test="${paging.startPage > 1}">

								<a href="admingenreglist.action?page=${paging.startPage-1}&searchKey=${searchKey}&searchValue=${searchValue}">&lt;</a>
							</c:if>

							<c:forEach var="p" begin="${paging.startPage}"
								end="${paging.endPage}">
								<c:choose>
									<c:when test="${p == paging.page}">
										<strong>${p}</strong>
									</c:when>
									<c:otherwise>
										<a
											href="admingenreglist.action?page=${p}&searchKey=${searchKey}&searchValue=${searchValue}">${p}</a>
									</c:otherwise>
								</c:choose>
							</c:forEach>

							<c:if test="${paging.endPage < paging.totalPage}">
								<a href="admingenreglist.action?page=${paging.endPage+1}&searchKey=${searchKey}&searchValue=${searchValue}"> > </a>
							</c:if>
						</c:if>
					</div>
				</div>
			</main>
		</div>
	</div>

</body>
</html>