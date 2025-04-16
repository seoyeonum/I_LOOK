<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wageList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/WageList.css">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#genWageUpdateBtn").click(function()
		{
			$(location).attr("href", "wageupdateform.action?type=gen&id=" + $(this).val());
		});
		
		$("#emgWageUpdateBtn").click(function()
		{
			$(location).attr("href", "wageupdateform.action?type=emg&id=" + $(this).val());
		});
		
	});

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
			<div class="content-header">
				<h1 class="content-title">시급 정보</h1>
			</div>

			<div class="content-body">
				<div class="info-wrapper">
					<div class="info-header">
						<div class="info-cell">이름</div>
						<div class="info-cell">시급</div>
						<div class="info-cell">마지막 변경일</div>
						<div class="info-cell">수정</div>
					</div>

					<!-- 일반돌봄 시급 조회  -->
					<div class="info-row">
						<div class="info-cell">일반 돌봄</div>
						<div class="info-cell"><fmt:formatNumber value="${genWage.gen_min_wage }" groupingUsed="true"/></div>
						<div class="info-cell">${fn:substring(genWage.changed_date, 0, 10)}</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" id="genWageUpdateBtn" class="btn update-btn"
								 value="${genWage.gen_min_wage_id }">수정</button>
							</div>
						</div>
					</div>
					
					<!-- 긴급돌봄 시급 조회  -->
					<div class="info-row">
						<div class="info-cell">긴급 돌봄</div>
						<div class="info-cell"><fmt:formatNumber value="${emgWage.emg_min_wage }" groupingUsed="true"/></div>
						<div class="info-cell">${fn:substring(emgWage.changed_date, 0, 10)}</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" id="emgWageUpdateBtn" class="btn update-btn" 
								 value="${emgWage.emg_min_wage_id }">수정</button>
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