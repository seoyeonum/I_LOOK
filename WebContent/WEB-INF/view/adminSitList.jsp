<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>adminSitList.jsp</title>
    <link rel="stylesheet" type="text/css" href="css/memberManagement.css">
</head>
<body>
<div class="wrap">
    <header>
        <c:import url="adminHeader.jsp"></c:import>
    </header>

    <div class="container">
        <!-- 사이드바 영역 -->
        <c:import url="sidebarMember.jsp"></c:import>

        <!-- 메인 콘텐츠 영역 -->
        <main class="main-content">
            <div class="content-header">
                <h1 class="content-title">시터 회원 정보</h1>

                <div class="search-form">
					<form action="adminsitlist.action" name="searchForm" method="get">
						<select name="searchKey" class="selectFiled">
							<option value="name" ${searchKey == 'name' ? 'selected' : ''}>이름</option>
     							<option value="tel" ${searchKey == 'tel' ? 'selected' : ''}>연락처</option>
						</select> 
						<input type="text" name="searchValue" class="txt" value="${searchValue }">
					    <input type="submit" value="검색" class="btn search-btn">
					</form>
				</div>
       		</div>

            <div class="content-body">
                <div class="info-wrapper">
                    <div class="info-header">
                    	<div class="info-cell">번호</div>
                        <div class="info-cell">이름</div>
                        <div class="info-cell">연락처</div>
                        <div class="info-cell">등급</div>
                        <div class="info-cell">시터 코드</div>
                        <div class="info-cell">가입일</div>
                        <div class="info-cell">상세 보기</div>
                    </div>

                    <!-- 데이터 -->
                    <c:forEach var="list" items="${sitList }" varStatus="status">
                    <div class="info-row">
                    	<div class="info-cell">${paging.startNum - status.index}</div>
                    	<div class="info-cell">${list.name }</div>
                        <div class="info-cell">${list.tel }</div>
                        <div class="info-cell">${list.grade }</div>
                        <div class="info-cell">${list.sit_backup_id }</div>
                        <div class="info-cell">${fn:substring(list.reg_date, 0, 10)}</div>
                        <div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn"
								 onclick="location.href='<%=cp%>/adminsitdetail.action?sit_backup_id=${list.sit_backup_id}'">상세 보기</button>
							</div>
						</div>
                    </div>
                    </c:forEach>

                   
                </div>

                <!-- 페이지 영역 -->
				<div class="page">
					<c:if test="${paging.totalPage >= 1}">
						<c:if test="${paging.startPage > 1}">
							<a href="adminsitlist.action?page=${paging.startPage-1}&searchKey=${searchKey}&searchValue=${searchValue}">&lt;</a>
						</c:if>

						<c:forEach var="p" begin="${paging.startPage}" end="${paging.endPage}">
							<c:choose>
								<c:when test="${p == paging.page}">
									<strong>${p}</strong>
								</c:when>
								<c:otherwise>
									<a href="adminsitlist.action?page=${p}
										&searchKey=${searchKey}&searchValue=${searchValue}">${p}</a>
								</c:otherwise>
							</c:choose>
						</c:forEach>

						<c:if test="${paging.endPage < paging.totalPage}">
							<a href="adminsitlist.action?page=${paging.endPage+1}&searchKey=${searchKey}&searchValue=${searchValue}"> > </a>
						</c:if>
					</c:if>
				</div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
