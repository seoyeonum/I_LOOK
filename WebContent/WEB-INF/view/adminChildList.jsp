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
    <title>adminChildList.jsp</title>
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
                <h1 class="content-title">아이 정보</h1>

                <div class="search-form">
                    <form action="" name="searchForm" method="post">
                        <select name="searchKey" class="selectFiled">
                            <option value="childCode">아이 코드</option>
                            <option value="childName">이름</option>
                            <option value="parentCode">부모 코드</option>
                        </select>
                        <input type="text" name="searchValue" class="txt" value="">
                        <input type="button" value="검색" class="btn search-btn" onclick="sendIt()">
                    </form>
                </div>
            </div>

            <div class="content-body">
                <div class="info-wrapper">
                    <div class="info-header-child">
                    	<div class="info-cell">번호</div>
                        <div class="info-cell">이름</div>
                        <div class="info-cell">나이</div>
                        <div class="info-cell">성별</div>
                        <div class="info-cell">부모 코드</div>
                        <div class="info-cell">아이 코드</div>
                        <div class="info-cell">등록일</div>
                        <div class="info-cell">상세 보기</div>
                    </div>

                    <!-- 예시 데이터 (실제 사용 시 DB 연동하여 반복문으로 처리) -->
                    <div class="info-row-child">
                    	<div class="info-cell">1</div>
                        <div class="info-cell">김민수</div>
                        <div class="info-cell">5</div>
                        <div class="info-cell">남</div>
                        <div class="info-cell">PBAC00001</div>
                        <div class="info-cell">CREG00001</div>
                        <div class="info-cell">2025-04-01</div>
                        <div class="info-cell">
                            <div class="action-buttons">
                                <button type="button" class="btn detail-btn">상세보기</button>
                            </div>
                        </div>
                    </div>

                    <div class="info-row-child">
                    	<div class="info-cell">2</div>
                        <div class="info-cell">김혜원</div>
                        <div class="info-cell">7</div>
                        <div class="info-cell">여</div>
                        <div class="info-cell">PBAC00002</div>
                        <div class="info-cell">CREG00002</div>
                        <div class="info-cell">2025-04-02</div>
                        <div class="info-cell">
                            <div class="action-buttons">
                                <button type="button" class="btn detail-btn">상세보기</button>
                            </div>
                        </div>
                    </div>

                    <!-- 스크롤 혹은 리스트 확인용 예시 더미 데이터 -->
                    <div class="info-row-child">
                    	<div class="info-cell">3</div>
                        <div class="info-cell">박정우</div>
                        <div class="info-cell">4</div>
                        <div class="info-cell">남</div>
                        <div class="info-cell">PBAC00003</div>
                        <div class="info-cell">CREG00003</div>
                        <div class="info-cell">2025-04-03</div>
                        <div class="info-cell">
                            <div class="action-buttons">
                                <button type="button" class="btn detail-btn">상세보기</button>
                            </div>
                        </div>
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
