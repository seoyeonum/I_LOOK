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
<title>adminGenReqDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminGenRegDetail.css"> 
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
</head>
<body>
<div class="wrap">
	<header>
		<c:import url="adminHeader.jsp"></c:import>
	</header>

	<div class="container">
		<!-- 사이드바 영역 -->
        <c:import url="sidebarService.jsp"></c:import>

		<main class="main-content">
			<div class="content-header">
				<div class="content-title">일반돌봄 신청 상세 정보</div>
			</div> 	
				
			<div class="content-body">
				<!-- 왼쪽 컬럼 - 사진과 자기소개 -->
				<div class="left-column">
					
					<!-- 자기소개 영역 -->
					<div class="intro-section">
						<div class="intro-header">메시지</div>
						<textarea readonly>${genReq.message}</textarea>
					</div>
				</div>
				
				<!-- 오른쪽 컬럼 - 상세 정보 -->
				<div class="right-column">
					<div class="info-row">
						<div class="info-header">예약 코드</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${genReq.gen_req_id}" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">근무 등록 코드</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${genReq.gen_reg_id}" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">부모 코드</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${genReq.par_backup_id}" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">아이 코드</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${genReq.child_backup_id}" readonly>
						</div>
					</div>
					<div class="info-row">
						<div class="info-header">부모 이름</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${genReq.par_name}" readonly>
						</div>
					</div>
					<div class="info-row">
						<div class="info-header">아이 이름</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${genReq.child_name}" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이용 시작일</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${fn:substring(genReq.start_date, 0, 10)}" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이용 종료일</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="${fn:substring(genReq.end_date, 0, 10)}" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이용 시작 시간</div>
						<div class="info-cell">
							<c:set var="startTime" value="${genReq.start_time}" />
							<input type="text" class="info-input" value="${startTime lt 10 ? '0' : ''}${startTime}:00" readonly>
						</div>
					</div>
					
					<div class="info-row">
						<div class="info-header">이용 종료 시간</div>
						<div class="info-cell">
							<c:set var="endTime" value="${genReq.end_time}" />
							<input type="text" class="info-input" value="${endTime lt 10 ? '0' : ''}${endTime}:00" readonly>
						</div>
					</div>
					<div class="info-row">
						<div class="info-header">포인트 사용</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="-1,000P" readonly>
						</div>
					</div>
					<div class="info-row">
						<div class="info-header">결제 금액</div>
						<div class="info-cell">
							<input type="text" class="info-input" value="￦20,000" readonly>
						</div>
					</div>
				</div>
			</div>   
			
			<!-- 하단 버튼 영역 -->
			<div class="bottom-btn">
				<button class="btn cancel-btn" onclick="location.href='<%=cp%>/adminreqlist.action'">뒤로가기</button>
			</div>
			
		</main> 
	</div>
</div>

<footer class="footer">
	<c:import url="/footer.action"/>
</footer>
</body>
</html>