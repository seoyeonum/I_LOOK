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
<title>gradeList.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/gradeList.css">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$(".update-btn").click(function()
		{
			$(location).attr("href", "gradeupdateform.action?grade_id=" + $(this).val());
		});
		
		$(".delete-btn").click(function()
		{
			if (confirm("정말 삭제하시겠습니까?")) 
		    {
		        $(location).attr("href", "gradedelete.action?grade_id=" + $(this).val());
		    }
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
				<h1 class="content-title">등급 정보</h1>

				<div class="insert-form">
					<button type="button" class="btn" onclick="location.href='<%=cp%>/gradeinsertform.action'">등급 추가</button>

				</div>
			</div>

			<div class="content-body">
				<div class="info-wrapper">
					<div class="info-header">
						<div class="info-cell">등급 이름</div>
						<div class="info-cell">최소 누적 근무 시간</div>
						<div class="info-cell">최대 누적 근무 시간</div>
						<div class="info-cell">일 최대 근무 시간</div>
						<div class="info-cell">시급 배수</div>
						<div class="info-cell">등급 이미지</div>
						<div class="info-cell">수정</div>
						<div class="info-cell">삭제</div>
					</div>
					
					<!-- 데이터 출력 부분 -->
					<c:forEach var="grade" items="${grade }">
					
					<div class="info-row">
						<div class="info-cell">${grade.name }</div>
						<div class="info-cell">${grade.min_range }시간</div>
						<div class="info-cell">
						    <c:choose>
						        <c:when test="${grade.max_range == -1}"> - </c:when>
						        <c:otherwise>${grade.max_range}시간</c:otherwise>
						    </c:choose>
						</div>
						<div class="info-cell">${grade.daily_max_time }시간</div>
						<div class="info-cell">${grade.grade_pay }</div>
						<div class="info-cell">
							<img alt="${grade.name } 이미지" src="<%= cp %>/images/grades/${grade.file_path }.gif" class="info-cell-img" width="50px" height="50px">
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn update-btn" value="${grade.grade_id }">수정</button>
							</div>
						</div>
						<div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn delete-btn" value="${grade.grade_id }">삭제</button>
							</div>
						</div>
					</div>
					</c:forEach>
				</div>
			</div><!-- end content-body -->
		</main>
	</div>
</div>

</body>
</html>