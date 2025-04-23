<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<header>
    <div id="logo"><img src="<%= cp %>/logo.png" height="120px"></div>
    <nav>
        <button type="button" class="menuBtn presentPage">홈</button>
        <button type="button" class="menuBtn">로그아웃</button>
        <button type="button" class="menuBtn">스케줄러</button>
        <button type="button" class="menuBtn">긴급돌봄서비스</button>
        <button type="button" class="menuBtn">마이페이지</button>
        <button type="button" class="menuBtn">알림함</button>
    </nav>
</header>

<div class="sidebar">
    <div class="sidebar-title">마이페이지</div>
    <div class="menu">
        <div class="menu-item">
            <a href="#"><i class="fa-solid fa-child"></i> 아이 정보 관리</a>
            <div class="submenu">
                <a href="#">아이 목록 보기</a>
                <a href="#">신규 아이 등록</a>
                <a href="#">아이 정보 수정</a>
            </div>
        </div>
        <div class="menu-item">
            <a href="#"><i class="fa-solid fa-user-group"></i> 부모 정보 관리</a>
            <div class="submenu">
                <a href="#">부모 정보 보기</a>
                <a href="#">부모 정보 수정</a>
            </div>
        </div>
        <div class="menu-item">
            <a href="#"><i class="fa-solid fa-house-chimney-user"></i> 돌봄 이용 현황</a>
            <div class="submenu">
                <a href="sitterusehistory.action">현재 이용 내역</a>
                <a href="#">이용 완료 내역</a>
            </div>
        </div>
    </div>
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
				    <img src="<%= cp %>/resources/uploads/${currentUse.sitter_name}.jpg"
				         alt="시터 사진"
				         onerror="this.onerror=null;this.src='<%= cp %>/resources/uploads/default_sitter.jpg';">
                </div>
                <div class="sitter-info-container">
                    <div class="info-item">
                        <span class="info-label">현재 상태:</span> <span class="info-value">${currentStatus}</span>
                    </div>
                    <div class="info-item">
                        <span class="info-label">이용 날짜:</span> 
                        <span class="info-value">${currentUse.start_date} ~ ${currentUse.end_date}</span>
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
                <span class="history-number">번호</span>
                <span class="history-date">이용날짜</span>
                <span class="history-time">이용시간</span>
                <span class="history-child-name">아이 이름</span>
                <span class="history-sitter-name">시터 이름</span>
                <span class="history-btn">상세보기</span>
            </div>
            <div id="history-table" class="history-list-container">
                <c:forEach var="item" items="${useList}" varStatus="status">
                    <div class="history-item">
                        <span class="history-number">${status.index + 1}</span>
                        <span class="history-date">
                            <span class="start-date">${item.start_date} ~ </span><br>
                            <span class="end-date">${item.end_date}</span>
                        </span>
                        <span class="history-time">${item.total_hours}시간</span>
                        <span class="history-child-name">${item.child_name}</span>
                        <span class="history-sitter-name">${item.sitter_name}</span>
                        <button class="details-btn">상세보기</button>
                    </div>
                </c:forEach>
            </div>
            <div id="paginationContainer" class="pagination-controls"></div>
        </div>
    </div>
</div>

</body>
</html>
