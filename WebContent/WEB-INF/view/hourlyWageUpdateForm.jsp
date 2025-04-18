<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>wageUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/WageUpdate.css">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		// 폼 제출 시 유효성 검사
		$("#submitBtn").click(function()
		{
			var wage = $("#wage").val().trim();
			var error = $("#wageError");
			
			if (wage == "")
			{
				error.text("시급을 입력하세요.")
				error.show();
				$("#wage").focus();
				return
			}
			
			 // 2. 숫자만 입력됐는지 확인 (정수 or 소수 둘 다 가능)
	        if (!/^\d+(\.\d+)?$/.test(wage)) 
	        {
	            error.text("숫자만 입력 가능합니다.");
	            error.show();
	            $("#wage").focus();
	            return;
	        }
			
			// 이상없으면 폼 제출
	        error.hide();
	        $("#wageUpdateForm").submit();
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
			<form action="wageupdate.action" method="post" id="wageUpdateForm"  name="wageUpdateForm">
			<div class="content-body">
				<div class="info-wrapper">
					<div class="info-header">
						<div class="info-cell">이름</div>
						<div class="info-cell">기존 시급</div>
						<div class="info-cell">수정할 시급</div>
					</div>
					
					<c:if test="${type eq 'gen'}">
				    <div class="info-row">
				        <div class="info-cell">일반 돌봄</div>
				        <div class="info-cell">
				            <fmt:formatNumber value="${genWage.gen_min_wage}" groupingUsed="true"/>
				        </div>
				        <div class="info-cell">
				            <input type="text" class="txt" name="gen_min_wage" id="wage" value="${genWage.gen_min_wage}" />
							<div id="wageError" class="error"></div>
				            <input type="hidden" name="gen_min_wage_id" value="${genWage.gen_min_wage_id}" />
				            <input type="hidden" name="type" value="${type }" />
				        </div>
				    </div>
					</c:if>
				
					<c:if test="${type eq 'emg'}">
				    <div class="info-row">
				        <div class="info-cell">긴급 돌봄</div>
				        <div class="info-cell">
				            <fmt:formatNumber value="${emgWage.emg_min_wage}" groupingUsed="true"/>
				        </div>
				        <div class="info-cell">
				             <input type="text" class="txt" name="emg_min_wage" id="wage" value="${emgWage.emg_min_wage}" />
				            <div id="wageError" class="error"></div>
				            <input type="hidden" name="emg_min_wage_id" value="${emgWage.emg_min_wage_id}" />
				            <input type="hidden" name="type" value="${type }" />
				        </div>	
				    </div>
					</c:if>
				</div>
				
				<!-- 하단 버튼 영역 -->
				<div class="bottom-btn">
					<button type="button" class="btn submit-btn" id="submitBtn">수정하기</button>
					<button type="button" class="btn cancel-btn"
					 onclick="location.href='<%=cp%>/wagelist.action'">취소</button>
				</div>
			</div>
			</form>
		</main>
	</div>
</div>

</body>
</html>