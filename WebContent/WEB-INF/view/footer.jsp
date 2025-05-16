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
<title>footer.jsp</title>
<link rel="stylesheet" type="text/css" href="<%= cp %>/css/footer.css">
</head>
<body>
<div class="footer-container">
	<!-- 푸터 로고 및 회사 정보 -->
	<div class="footer-section company-info">
	    <div class="footer-logo">I.LOOK</div>
	    <p>우리 아이의 행복한 성장을 위한 돌봄 서비스</p>
	    <address>
	        <p>서울특별시 월드컵북로 21 풍성빌딩 2층</p>
	        <p>사업자등록번호: 123-45-67890</p>
	        <p>대표: 김상용</p>
	    </address>
	</div>
	
	<!-- 고객센터 정보 -->
	<div class="footer-section customer-service">
	    <h3>고객센터</h3>
	    <p class="cs-phone">1588-1248</p>
	    <p>평일 09:00 - 18:00</p>
	    <p>점심시간 12:00 - 13:00</p>
	    <p>토,일,공휴일 휴무</p>
	    <button class="btn footer-btn">1:1 문의하기</button>
	</div>
	
	<!-- 서비스 소개 링크 -->
	<div class="footer-section service-links">
	    <h3>서비스 안내</h3>
	    <ul>
	        <li><a href="#">일반 돌봄 서비스</a></li>
	        <li><a href="#">긴급 돌봄 서비스</a></li>
	        <!-- <li><a href="#">특별 활동 서비스</a></li> -->
	        <!-- <li><a href="#">정기 돌봄 신청</a></li> -->
	        <li><a href="#">시터 지원하기</a></li>
	    </ul>
	</div>
	
	<!-- 회사 정보 링크 -->
	<div class="footer-section company-links">
	    <h3>회사 정보</h3>
	    <ul>
	        <li><a href="#">회사 소개</a></li>
	        <li><a href="#">이용약관</a></li>
	        <li><a href="#"><strong>개인정보처리방침</strong></a></li>
	        <li><a href="#">안전보상제도</a></li>
	        <li><a href="<%= cp %>/noticelist.action">공지사항</a></li>
	    </ul>
	</div>
</div>

<!-- 앱 다운로드 및 SNS 링크 -->
<div class="footer-bottom">
    <div class="app-download">
        <p>I.LOOK 앱 다운로드</p>
        <div class="app-buttons">
            <a href="#" class="app-btn"><i class="fab fa-apple"></i> App Store</a>
            <a href="#" class="app-btn"><i class="fab fa-google-play"></i> Google Play</a>
        </div>
    </div>
    <div class="social-links">
        <a href="#"><i class="fab fa-instagram"></i></a>
        <a href="#"><i class="fab fa-facebook"></i></a>
        <a href="#"><i class="fab fa-youtube"></i></a>
        <!-- <a href="#"><i class="fab fa-kakao"></i></a> -->
    </div>
    <div class="copyright">
        &copy; 2025 I_Look All Rights Reserved.
    </div>
</div>

</body>
</html>