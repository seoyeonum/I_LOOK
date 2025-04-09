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
<title>리뷰 및 별점 페이지</title>
<link rel="stylesheet" href="css/ReviewInsertForm.css">

<script type="text/javascript">
// 페이지가 로드된 후 실행되도록 설정
document.addEventListener('DOMContentLoaded', function() {
    // 별점 기능
    const stars = document.querySelectorAll('.star');
    let selectedRating = 0;

    stars.forEach(star => {
        star.addEventListener('click', () => {
            selectedRating = parseInt(star.getAttribute('data-value'));
            updateStars();
            updateSelectedRating();  // 별점 선택 후 별점 업데이트
            updateRatingValue();     // ratingValue 요소도 업데이트
        });
    });

    function updateStars() {
        stars.forEach(star => {
            if (parseInt(star.getAttribute('data-value')) <= selectedRating) {
                star.classList.add('selected');
            } else {
                star.classList.remove('selected');
            }
        });
    }

    function updateSelectedRating() {
        document.getElementById('selectedRating').textContent = `선택한 별점: ${selectedRating}`;
    }

    function updateRatingValue() {
        document.getElementById('ratingValue').textContent = `별점: ${selectedRating}`;
    }

    // 리뷰 항목 선택 기능
    const reviewButtons = document.querySelectorAll('.review-button');
    let selectedItems = [];

    reviewButtons.forEach(button => {
        button.addEventListener('click', () => {
            const item = button.getAttribute('data-item');

            if (selectedItems.includes(item)) {
                // 이미 선택된 항목이면 선택 해제
                selectedItems = selectedItems.filter(i => i !== item);
                button.classList.remove('selected');
            } else if (selectedItems.length < 3) {
                // 최대 3개까지 선택
                selectedItems.push(item);
                button.classList.add('selected');
            }
            updateSelectedItems();  // 리뷰 항목 선택 후 업데이트
        });
    });

    function updateSelectedItems() {
        const selectedItemsText = selectedItems.length > 0 ? selectedItems.join(', ') : '없음';
        document.getElementById('selectedItems').textContent = `선택한 리뷰 항목: ${selectedItemsText}`;
    }

    // 초기 상태 업데이트 - 페이지 로드 시 기본값 표시
    updateSelectedRating();
    updateRatingValue();
    updateSelectedItems();

    // 제출 버튼 기능
    const submitBtn = document.getElementById('submitBtn');
    submitBtn.addEventListener('click', () => {
        if (selectedRating === 0) {
            alert('별점을 선택해주세요.');
            return;
        }
        if (selectedItems.length === 0) {
            alert('최소 하나의 리뷰 항목을 선택해주세요.');
            return;
        }

        // 제출 후 결과 표시 (예시로 alert 창을 띄움)
        alert(`제출 완료! \n별점: ${selectedRating}점 \n선택된 리뷰 항목: ${selectedItems.join(', ')}`);
    });
});
</script>

</head>
<body>

<header>
    <div id="logo">
        <img src="./logo.png" height="120px">
    </div>
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
	
	    <!-- 아이 정보 -->
	    <div class="menu-item">
	      <a href="#"><i class="fa-solid fa-child"></i> 아이 정보 관리</a>
	      <div class="submenu">
	        <a href="#">아이 목록 보기</a>
	        <a href="#">신규 아이 등록</a>
	        <a href="#">아이 정보 수정</a>
	      </div>
	    </div>
	
	    <!-- 부모 정보 -->
	    <div class="menu-item">
	      <a href="#"><i class="fa-solid fa-user-group"></i> 부모 정보 관리</a>
	      <div class="submenu">
	        <a href="#">부모 정보 보기</a>
	        <a href="#">부모 정보 수정</a>
	      </div>
	    </div>
	
	    <!-- 돌봄 이용 -->
	    <div class="menu-item">
	      <a href="#"><i class="fa-solid fa-house-chimney-user"></i> 돌봄 이용 현황</a>
	      <div class="submenu">
	        <a href="#">현재 이용 내역</a>
	        <a href="#">이용 완료 내역</a>
	      </div>
	    </div>
	  </div>
</div>

 <div id="review-header">
     <h2>별점 및 리뷰</h2>
 </div>

<div id="wrapper">
    <!-- 별점 선택 -->
    <div class="rating-section">
        <h2>별점 부여</h2>
        <div class="stars">
            <span class="star" data-value="1">★</span>
            <span class="star" data-value="2">★</span>
            <span class="star" data-value="3">★</span>
            <span class="star" data-value="4">★</span>
            <span class="star" data-value="5">★</span>
        </div>
        <div id="ratingValue">별점: 0</div>
    </div>

    <!-- 리뷰 항목 선택 -->
    <div class="review-section">
    	<h2>리뷰 선택</h2>
	    <div class="review-options">
	        <button class="review-button" data-item="reveiw1">섬세함</button>
	        <button class="review-button" data-item="reveiw2">따뜻함</button>
	        <button class="review-button" data-item="reveiw3">친절함</button>
	        <button class="review-button" data-item="reveiw4">깨끗함</button>
	    </div>
	    <div id="reviewValue">리뷰: </div>
    </div>

    <!-- 선택된 정보 표시 -->
    <div class="selected-info">
        <div id="selectedRating">선택한 별점: 0</div>
        <div id="selectedItems">선택한 리뷰 항목: 없음</div>
    </div>

    <!-- 제출 버튼 -->
    <div class="submit-section">
        <button id="submitBtn">제출하기</button>
    </div>
</div>

</body>
</html>
