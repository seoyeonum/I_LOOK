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
<title>adminInfo.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminInfo.css">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		// 비밀번호 마스킹
		$(".pw").each(function() 
		{
	        var pw = $(this).data("pw");
	        if (pw.length >= 1) 
	        {
	            var maskedPw = pw.substring(0, 1) + "*".repeat(pw.length - 1);
	            $(this).val(maskedPw);
	        }
	    });
		
		// 업데이트 폼으로 이동
		$(".update-btn").click(function()
		{
			$(location).attr("href", "admininfoupdateform.action?admin_reg_id=" + $(this).val());
		});
	});

</script>

</head>
<body>

<div class="wrap">
	<header>
		<c:import url="/WEB-INF/view/adminHeader.jsp"></c:import>
	</header>
	
	
	<div class="container">
		<!--사이드바 영역 -->
		<c:import url="/WEB-INF/view/sidebarMypage.jsp"></c:import>

		<!-- 메인 콘텐츠 영역 -->
		<main class="main-content">
			<div class="content-header">
				<h1 class="content-title">관리자 정보</h1>
			</div>
			
			<c:forEach var="admin" items="${admin }">
			<div class="content-body">
				<div class="info-section">
					<div class="info-row">
						<div class="info-header">아이디</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${admin.id }" readonly>
						</div>
					</div>

					<div class="info-row">
						<div class="info-header">비밀번호</div>
						<div class="info-cell">
							<input type="text" class="info-input pw" data-pw="${admin.pw}" id="pw_${admin.admin_reg_id}" readonly>

						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">은행명</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${admin.bank_name }" readonly>
						</div>
					</div>
					<div class="info-row">
						<div class="info-header">계좌번호</div>
						<div class="info-cell">
							<%-- <input type="text" class="info-input" value="${admin.admin_acct_code }" readonly> --%>
							<input type="text" class="info-input" value="${admin.acct_number }" readonly>
						</div>
					</div>
					
					<div class="bottom-btn">
						<button type="button" class="btn update-btn" value="${admin.admin_reg_id }" >수정</button>
					</div>
					
				</div>
			</div>
			</c:forEach>
		</main>
	</div>
	
</div>

</body>
</html>