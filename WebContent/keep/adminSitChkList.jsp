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
    <title>adminSitChkList.jsp</title>
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
                <h1 class="content-title">시터 등록 요청 내역</h1>

                <div class="search-form">
                    <form action="" name="searchForm" method="post">
                        <select name="searchKey" class="selectFiled">
                            <option value="sitterName">이름</option>
                            <option value="requestCode">요청 코드</option>
                        </select>
                        <input type="text" name="searchValue" class="txt" value="">
                        <input type="button" value="검색" class="btn search-btn" onclick="sendIt()">
                    </form>
                </div>
            </div>

            <div class="content-body">
                <div class="info-wrapper">
                    <div class="info-header-sitReg">
                    	<div class="info-cell">번호</div>
                        <div class="info-cell">이름</div>
                        <div class="info-cell">연락처</div>
                        <div class="info-cell">등록 요청 코드</div>
                        <div class="info-cell">필수 서류</div>
                        <div class="info-cell">신청일</div>
                        <div class="info-cell">처리</div>
                    </div>

                    <!-- 예시 데이터 -->
                    <div class="info-row-sitReg">
                    	<div class="info-cell">1</div>
                        <div class="info-cell">정하영</div>
                        <div class="info-cell">010-1111-2222</div>
                        <div class="info-cell">REQ00001</div>
                        <div class="info-cell">서류1 / 서류2</div>
                        <div class="info-cell">2025-04-01</div>
                        <div class="info-cell">승인</div>
                    </div>
                    
                    <div class="info-row-sitReg">
                    	<div class="info-cell">2</div>
                        <div class="info-cell">김경희</div>
                        <div class="info-cell">010-3333-4444</div>
                        <div class="info-cell">REQ00002</div>
                        <div class="info-cell">서류1 / 서류2</div>
                        <div class="info-cell">2025-04-02</div>
                       <div class="info-cell">거절</div>
                    </div>
                </div>

                <!-- 페이징 영역 -->
                <div class="page">
                    <p>1 Prev 21 22 23 24 25 26 27 28 29 30 Next 42</p>
                </div>
            </div>
        </main>
    </div>
</div>
</body>
</html>
