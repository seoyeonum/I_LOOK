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
<title>sitterHeader.jsp</title>
<link rel="stylesheet" type="text/css" href="<%= cp %>/css/mainFrame.css">
<link rel="stylesheet" type="text/css" href="<%= cp %>/css/notify.css">
<script src="<%= cp %>/js/notify.js" defer></script>
</head>
<body>
<div id="wrapper">
    <!-- 헤더 부분은 공용으로 모든 뷰페이지에 사용(메인 부분만 변경) -->
    <!-- 각 뷰페이지 헤더 부분 같도록 하여 통일감 주기 위함 -->
    <!-- 단, 관리자와 부모/시터 회원간의 헤더 항목 다르게 표시해야 함 -->
    <header>
        <div id="logo">
            <img src="<%= cp %>/images/logo.png" height="120px">
        </div>
        <nav>
            <button type="button" class="menuBtn presentPage" id="emg"
            onclick="window.location.href='<%=cp%>/emgmain.action'">홈</button>
            <button type="button" class="menuBtn" id="noticeList">공지사항</button>
            <button type="button" class="menuBtn" id="schedule">스케줄러</button>
            <button type="button" class="menuBtn" id="gen"
            onclick="window.location.href='<%=cp%>/genreginsertform.action'">일반돌봄서비스</button>
            <button type="button" class="menuBtn" id="mypage"
            onclick="window.location.href='<%=cp%>/sitterinfolist.action'">마이페이지</button>
            <button type="button" class="menuBtn" id="notify-btn">
                알림함
                <span id="notify-badge">3</span>
            </button>
            <button type="button" class="menuBtn"
            onclick="window.location.href='<%=cp%>/logout.action'">로그아웃</button>
        </nav>
  	</header>
</div>

<!-- 알림창 패널 -->
<div id="notify-panel">
    <div id="notify-header">
        <div id="notify-title">알림</div>
        <div id="notify-actions">
            <button id="read-all-btn">모두 읽음 표시</button>
            <button id="close-notify">닫기</button>
        </div>
    </div>
    <ul id="notify-body">
        <!-- 예시 알림 -->
        <li class="notify-item unread">
            <div class="notify-title">긴급 돌봄 요청이 수락되었습니다</div>
            <div class="notify-content">김탄 시터님이 4월 10일 긴급 돌봄 요청을 수락하셨습니다.</div>
            <div class="notify-date">2025-04-05 14:30</div>
        </li>
        <li class="notify-item unread">
            <div class="notify-title">결제가 완료되었습니다</div>
            <div class="notify-content">3월 25일 일반 돌봄 서비스 결제가 완료되었습니다.</div>
            <div class="notify-date">2025-04-04 09:15</div>
        </li>
        <li class="notify-item unread">
            <div class="notify-title">일정 변경 알림</div>
            <div class="notify-content">4월 12일 돌봄 일정이 변경되었습니다. 확인해주세요.</div>
            <div class="notify-date">2025-04-03 17:45</div>
        </li>
        <li class="notify-item">
            <div class="notify-title">새로운 공지사항이 등록되었습니다</div>
            <div class="notify-content">서비스 이용 안내 공지사항이 등록되었습니다.</div>
            <div class="notify-date">2025-04-01 11:20</div>
        </li>
        <li class="notify-item">
            <div class="notify-title">후기가 등록되었습니다</div>
            <div class="notify-content">이용하신 서비스에 대한 후기를 작성해주세요.</div>
            <div class="notify-date">2025-03-28 16:10</div>
        </li>
    </ul>
</div>

</body>
</html>