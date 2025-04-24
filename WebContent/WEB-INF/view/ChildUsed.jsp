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
<title>돌봄 이용 내역 열람 페이지</title>
<link rel="stylesheet" href="css/ChildUsed.css">
<script type="text/javascript">

	document.addEventListener('DOMContentLoaded', function () 
			{
	    var firstButton = document.querySelector('.menuBtn.presentPage');
	    if (firstButton) {
	        firstButton.classList.remove('presentPage');
	    }
	    var button = document.querySelector('#mypage');
	    if (button) 
	    {
	        button.classList.add('presentPage');
	    }

    let currentPage = 1;
    const itemsPerPage = 3;

    function paginate() {
        let table = document.getElementById("history-table");
        let rows = table.getElementsByClassName("history-item");
        let start = (currentPage - 1) * itemsPerPage;
        let end = currentPage * itemsPerPage;

        for (let i = 0; i < rows.length; i++) {
            rows[i].style.display = (i >= start && i < end) ? "" : "none";
        }
        updatePaginationButtons(rows.length);
    }

    function updatePaginationButtons(totalItems) {
        let totalPages = Math.ceil(totalItems / itemsPerPage);
        let paginationContainer = document.getElementById("paginationContainer");
        paginationContainer.innerHTML = '';

        let prevBtn = document.createElement("button");
        prevBtn.innerText = "Prev";
        prevBtn.onclick = prevPage;
        prevBtn.disabled = currentPage === 1;
        paginationContainer.appendChild(prevBtn);

        for (let i = 1; i <= totalPages; i++) {
            let pageBtn = document.createElement("button");
            pageBtn.innerText = i;
            pageBtn.onclick = function() {
                currentPage = i;
                paginate();
            };
            if (i === currentPage) pageBtn.style.fontWeight = "bold";
            paginationContainer.appendChild(pageBtn);
        }

        let nextBtn = document.createElement("button");
        nextBtn.innerText = "Next";
        nextBtn.onclick = nextPage;
        nextBtn.disabled = currentPage === totalPages;
        paginationContainer.appendChild(nextBtn);
    }

    function nextPage() {
        currentPage++;
        paginate();
    }

    function prevPage() {
        currentPage--;
        paginate();
    }

    window.onload = paginate;
</script>
</head>
<body>

	<!-- 상단 헤더 영역 -->
	<div id="header-container">
		<c:import url="/parentheader.action" />
	</div>


	<!-- 사이드 메뉴 -->
	<div class="sidebar">
		<c:import url="/parentsidebar.action" />
	</div>

	<div class="title">
		<h2>시터 이용 내역</h2>
	</div>

	<div class="container">
		<!-- 최근 이용 / 현재 이용 중 -->
		<c:if test="${not empty currentUse}">
			<div class="recent-sitter-container">
				<h2 class="page-title">최근 이용 내역 및 현재 이용 상태</h2>
				<div class="recent-sitter-profile">
					<div class="sitter-photo-container">
						<img
							src="<%= cp %>/${currentUse.file_path}.jpg"
							alt="시터 사진"
							onerror="this.onerror=null;this.src='<%= cp %>/resources/uploads/default_sitter.jpg';">
					</div>
					<div class="sitter-info-container">
						<div class="info-item">
							<span class="info-label">현재 상태:</span> <span class="info-value">${currentStatus}</span>
						</div>
						<div class="info-item">
							<span class="info-label">이용 날짜:</span> <span class="info-value">${currentUse.start_date}
								~ ${currentUse.end_date}</span>
						</div>
						<div class="info-item">
							<span class="info-label">아이 이름:</span> <span class="info-value">${currentUse.child_name}</span>
						</div>
						<div class="info-item">
							<span class="info-label">시터 이름:</span> <span class="info-value">${currentUse.sitter_name}</span>
						</div>
						<div class="info-item">
							<span class="info-label">시터 등급:</span> <span class="info-value">${currentUse.sitter_level}</span>
						</div>
					</div>
				</div>
			</div>
		</c:if>

		<!-- 하단 이용 내역 리스트 -->
		<div class="history-section">
			<h2 class="page-list-title">이용 내역</h2>
			<div class="history-list-container">
				<div class="history-item header">
					<span class="history-number">번호</span> <span class="history-date">이용날짜</span>
					<span class="history-time">이용시간</span> <span
						class="history-child-name">아이 이름</span> <span
						class="history-sitter-name">시터 이름</span> <span
						class="history-status">이용 상태</span>
					<!-- ✅ 추가 -->
					<span class="history-btn">상세보기</span>
				</div>

				<div id="history-table" class="history-list-container">
					<c:forEach var="item" items="${useList}" varStatus="status">
						<div class="history-item">
							<span class="history-number">${status.index + 1}</span> <span
								class="history-date"> <span class="start-date">${item.start_date}
									~ </span><br> <span class="end-date">${item.end_date}</span>
							</span> <span class="history-time">${item.work_hours}시간</span>
							<!-- ✅ work_hours 사용 -->
							<span class="history-child-name">${item.child_name}</span> <span
								class="history-sitter-name">${item.sitter_name}</span> <span
								class="history-status">${item.care_status}</span>
							<!-- ✅ 이용 상태 표시 -->
							<button class="details-btn" onclick="location.href='PayRefund.jsp'">상세보기</button>
						</div>
					</c:forEach>
				</div>

				<div id="paginationContainer" class="pagination-controls"></div>
			</div>
		</div>
	</div>

</body>
</html>
