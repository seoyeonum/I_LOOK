<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>돌봄 완료 내역</title>
<link rel="stylesheet" href="css/CareCompleted.css">
<script type="text/javascript">
    let currentPage = 1;
    const itemsPerPage = 8;

    function paginate() {
        let rows = document.getElementsByClassName("booking-item");
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

    function nextPage() { currentPage++; paginate(); }
    function prevPage() { currentPage--; paginate(); }
    window.onload = paginate;
</script>
</head>
<body>

<header>
    <div id="logo"><img src="<%= cp %>/logo.png" height="120px"></div>
    <nav>
        <button class="menuBtn presentPage">홈</button>
        <button class="menuBtn">로그아웃</button>
        <button class="menuBtn">스케줄러</button>
        <button class="menuBtn">긴급돌봄서비스</button>
        <button class="menuBtn">마이페이지</button>
        <button class="menuBtn">알림함</button>
    </nav>
</header>
        
<div class="sidebar">
    <div class="sidebar-title">마이페이지</div>
    <div class="menu">
        <div class="menu-item"><a href="#">아이 정보 관리</a></div>
        <div class="menu-item"><a href="#">부모 정보 관리</a></div>
        <div class="menu-item">
            <a href="#">돌봄 이용 현황</a>
            <div class="submenu">
                <a href="#">현재 이용 내역</a>
                <a href="#">이용 완료 내역</a>
            </div>
        </div>
    </div>
</div>

<div id="finish-header"><h2>돌봄 완료 내역</h2></div>

<div class="booking-list">
    <div class="booking-header">
        <div class="column">번호</div>
        <div class="column">시터 이름</div>
        <div class="column">예약 날짜</div>
        <div class="column">예약 시간</div>
        <div class="column">이용 상태</div>
        <div class="column">리뷰</div>
    </div>

    <div id="bookingTable">
        <c:choose>
            <c:when test="${not empty careDoneList}">
                <c:forEach var="item" items="${careDoneList}" varStatus="status">
                    <div class="booking-item">
                        <div class="column">${status.index + 1}</div>
                        <div class="column">${item.sitter_name}</div>
                        <div class="column">
                            <fmt:parseDate var="start" value="${item.start_date}" pattern="yyyy-MM-dd" />
                            <fmt:parseDate var="end" value="${item.end_date}" pattern="yyyy-MM-dd" />
                            <fmt:formatDate value="${start}" pattern="yyyy년 MM월 dd일" /> ~
                            <fmt:formatDate value="${end}" pattern="yyyy년 MM월 dd일" />
                        </div>
                        <div class="column">${item.work_hours}시간</div>
                        <div class="column">${item.care_status}</div>
                        <div class="column">
                            <button type="button" onclick="location.href='reviewform.action?gen_req_id=${item.gen_req_id}&care_type=${item.care_type}'">리뷰 작성</button>
                        </div>
                    </div>
                </c:forEach>
            </c:when>
            <c:otherwise>
                <div class="booking-item">
                    <div class="column" style="width:100%; text-align:center;">완료된 돌봄 내역이 없습니다.</div>
                </div>
            </c:otherwise>
        </c:choose>
    </div>

    <div id="paginationContainer" class="pagination-controls"></div>
</div>

</body>
</html>
