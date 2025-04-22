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
<title>adminSitRegDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminSitRegDetail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		// 주민번호 마스킹 처리
	    var ssnFirst = "${sitInfo.ssn_first}";
	    var ssnSecond = "${sitInfo.ssn_second}";
	   	
	    // 뒷자리 1자리만 보여주고 나머지 마스킹
	    var maskedSecond = ssnSecond.substring(0, 1) + "*".repeat(ssnSecond.length - 1);
	    var maskedSsn = ssnFirst + "-" + maskedSecond;
	
	    document.getElementById("ssn").value = maskedSsn;
	    
		// 자격증, 서류 불러오기
		$(".cert, .doc").click(function()
		{
			// 폴더, 파일명 읽기
			var folder = $(this).data("folder"); 
			var filePath = $(this).data("path");
		    
		    if (filePath)
			{
				var fullUrl = "<%=cp%>/images/" + folder + "/" + filePath;
				
				// 팝업창 사이즈
		        var popupWidth = 800;
		        var popupHeight = 600;
		        
		        // 현재 브라우저 화면 크기
		        var screenWidth = window.screen.width;
		        var screenHeight = window.screen.height;
		        
		        // 가운데 계산
		        var left = (screenWidth - popupWidth) / 2;
		        var top = (screenHeight - popupHeight) / 2;

		        window.open(fullUrl, "_blank", 
		            "width=" + popupWidth + ",height=" + popupHeight + ",top=" + top + ",left=" + left);
			}
		    else
		    {
	            alert("파일 정보가 올바르지 않습니다.");
	        }
		});
		
		
		// 수락 모달 열기
		$(".approve-btn").click(function()
		{
			$("#approveModal").show();
		});
		
		// 거절 모달 열기
		$(".reject-btn").click(function()
		{
		    $("#rejectModal").show();
		});
	});
	
	// 모달 닫기
	function closeModal()
	{
	    $("#rejectModal").hide();
	    $("#approveModal").hide();
	}
</script>
</head>
<body>
	<div class="wrap">
		<header>
			<c:import url="adminHeader.jsp"></c:import>
		</header>

		<div class="container">
			<!-- 사이드바 영역 -->
			<c:import url="sidebarMember.jsp"></c:import>

			<main class="main-content">
				<div class="content-header">
					<div class="content-title">시터 등록 요청 상세정보</div>
				</div>

				<div class="content-body">
					<div class="left-section">
						<div class="profile">
							<img src="<%=cp%>/images/pictures/${sitInfo.file_path}" onerror="this.onerror=null; this.src='<%=cp%>/images/logoimg.png';" style="width: 200px; height: auto;">
						</div>
						<!-- 자격증 정보를 프로필 아래에 배치 -->
						<div class="category-row">
						    <div class="category-title">보유 자격증</div>
						    <div class="category-options">
						    	<c:forEach var="sitCertList" items="${sitCertList }">
						        	<button class="category-button cert" data-folder="certificates" data-path="${sitCertList.file_path}">"${sitCertList.type }"</button>
						        </c:forEach>
						    </div>
						</div>
					</div>

					<div class="info-section">
						<div class="info-row">
							<div class="info-header">시터 코드</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${sitInfo.sit_backup_id }" readonly>
							</div>
						</div>	
						
						<div class="info-row">
							<div class="info-header">회원가입 코드</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${sitInfo.sit_reg_id }" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">이름</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${sitInfo.name }" readonly>
							</div>
						</div>
						
						<div class="info-row">
							<div class="info-header">주민등록번호</div>
							<div class="info-cell">
								<input type="text" class="info-input" id="ssn" value="" readonly>
							</div>
						</div>
						
						<div class="info-row">
							<div class="info-header">연락처</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${sitInfo.tel }" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">우편번호</div>
							<div class="info-cell" style="display: flex;">
								<input type="text" class="address-input" value="${sitInfo.zip_code }" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">주소</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${sitInfo.road_addr }" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">상세주소</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${sitInfo.detailed_addr }" readonly>
							</div>
						</div>
						
						<div class="info-row">
							<div class="info-header">필수 서류</div>
							<div class="info-cell">
								<c:forEach var="sitDocList" items="${sitDocList }">
						        	<button class="category-button doc" data-folder="documents" data-path="${sitDocList.file_path}">${sitDocList.type }</button>
						        </c:forEach>
							</div>
						</div>
					</div>
				</div>
			
				<!-- 하단 버튼 -->
				<c:if test="${param.source == 'req'}">
				    <div class="bottom-btn">
				        <form action="<%=cp%>//sitreginsert.action" method="post">
				            <input type="hidden" name="sit_backup_id" value="${sitInfo.sit_backup_id}">
				            <button type="button" class="btn approve-btn">승인</button>
				            <button type="button" class="btn reject-btn">거절</button>
				        </form>
				     	    <button class="btn cancel-btn" onclick="location.href='<%=cp%>/adminsitreglist.action'">뒤로가기</button>
				    </div>
				</c:if>
				<c:if test="${param.source == 'reject'}">
					<div class="reject-bottom-btn">
						 <button class="btn cancel-btn" onclick="location.href='<%=cp%>/adminsitrejectedlist.action'">뒤로가기</button>
					</div>
				</c:if>
			</main>
		</div>
	</div>
	<!-- 모달창 -->
	<div id="approveModal" style="display: none;">
	    <div class="modal-content">
	        <div class="modal-body">
	            <form action="<%=cp%>/sitreginsert.action" method="post">
	                <input type="hidden" name="sit_backup_id" value="${sitInfo.sit_backup_id}">
	                
	                <div>정말 승인하시겠습니까?</div>
	                
	                <div class="button-group">
	                    <button type="submit" class="btn approve-btn">승인 하기</button>
	                    <button type="button" onclick="closeModal()" class="btn cancel-btn">취소</button>
	                </div>
	            </form>
	        </div>
	    </div>
    </div>
	<!-- 모달창 -->
	<div id="rejectModal" style="display: none;">
	    <div class="modal-content">
	        <div class="modal-header">
	            거절 사유 선택
	        </div>
	        <div class="modal-body">
	            <form action="<%=cp%>/sitregreject.action" method="post">
	                <input type="hidden" name="sit_backup_id" value="${sitInfo.sit_backup_id}">
	                
	                <select name="sit_rejected_reason_id" required class="form-select">
	                    <option value="">-- 사유 선택 --</option>
	                    <c:forEach var="reason" items="${rejectList}">
	                        <option value="${reason.sit_rejected_reason_id}">${reason.reason}</option>
	                    </c:forEach>
	                </select>
	                
	                <div class="button-group">
	                    <button type="submit" class="btn reject-btn">거절하기</button>
	                    <button type="button" onclick="closeModal()" class="btn cancel-btn">취소</button>
	                </div>
	            </form>
	        </div>
	    </div>
	</div>
</body>
</html>