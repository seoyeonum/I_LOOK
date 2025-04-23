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
                    <form action="" name="searchForm" method="get">
                        <select name="searchKey" class="selectFiled">
                            <option value="name">이름</option>
                            <option value="sitterCode">시터 코드</option>
                        </select>
                        <input type="text" name="searchValue" class="txt" value="">
                        <input type="button" value="검색" class="btn search-btn" onclick="sendIt()">
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

                    <!-- 반복문으로 들어갈 예시 데이터 -->
                    <div class="info-row">
                    	<div class="info-cell">1</div>
                    	<div class="info-cell">이시현</div>
                        <div class="info-cell">010-0000-0000</div>
                        <div class="info-cell">브론즈</div>
                        <div class="info-cell">SREG00001</div>
                        <div class="info-cell">2025-04-01</div>
                        <div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn" onclick="location.href='adminSitDetail.jsp'">상세 보기</button>
							</div>
						</div>
                    </div>

                    <div class="info-row">
                    	<div class="info-cell">2</div>
                    	<div class="info-cell">최지은</div>
                        <div class="info-cell">010-1111-2222</div>
                        <div class="info-cell">실버</div>
                        <div class="info-cell">SREG00002</div>
                        <div class="info-cell">2025-04-02</div>
                        <div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn">상세 보기</button>
							</div>
						</div>
                    </div>
                    
                    <!-- 예시용 추가 데이터 -->
                    <div class="info-row">
                    	<div class="info-cell">3</div>
                    	<div class="info-cell">오연서</div>
                        <div class="info-cell">010-3333-4444</div>
                        <div class="info-cell">신입</div>
                        <div class="info-cell">SREG00003</div>
                        <div class="info-cell">2025-04-03</div>
                        <div class="info-cell">
							<div class="action-buttons">
								<button type="button" class="btn detail-btn">상세 보기</button>
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
