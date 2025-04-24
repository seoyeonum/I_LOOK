<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 및 별점 페이지</title>
<link rel="stylesheet" href="css/ReviewInsertForm.css">

<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
    const stars = document.querySelectorAll('.star');
    let selectedRating = 0;

    const reviewButtons = document.querySelectorAll('.review-button');
    let selectedItems = [];

    const ratingInput = document.getElementById('ratingInput');
    const selectedItemsInput = document.getElementById('selectedItemsInput');
    const selectedRatingText = document.getElementById('selectedRating');
    const selectedItemsText = document.getElementById('selectedItems');

    // ⭐ 별점 선택
    stars.forEach(star => {
        star.addEventListener('click', () => {
            selectedRating = parseInt(star.getAttribute('data-value'));
            updateStars();
            updateSelectedRating();
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
        selectedRatingText.textContent = `선택한 별점: ${selectedRating}`;
        document.getElementById('ratingValue').textContent = `별점: ${selectedRating}`;
        ratingInput.value = selectedRating;
    }

    // ⭐ 리뷰 항목 선택
    reviewButtons.forEach(button => {
        button.addEventListener('click', () => {
            const item = button.getAttribute('data-item');
            if (selectedItems.includes(item)) {
                selectedItems = selectedItems.filter(i => i !== item);
                button.classList.remove('selected');
            } else if (selectedItems.length < 3) {
                selectedItems.push(item);
                button.classList.add('selected');
            }
            updateSelectedItems();
        });
    });

    function updateSelectedItems() {
        const selectedItemsStr = selectedItems.length > 0 ? selectedItems.join(', ') : '없음';
        selectedItemsText.textContent = `선택한 리뷰 항목: ${selectedItemsStr}`;
        selectedItemsInput.value = selectedItems.join(',');
    }

    // ⭐ 제출 시 체크
    document.getElementById('submitBtn').addEventListener('click', function(event) {
        if (selectedRating === 0) {
            alert('별점을 선택해주세요.');
            return;
        }
        if (selectedItems.length === 0) {
            alert('최소 하나의 리뷰 항목을 선택해주세요.');
            return;
        }
        document.getElementById('reviewForm').submit();
    });
});
</script>
</head>

<body>

<!-- ===== 네비게이션 / 사이드바는 그대로 ===== -->
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
                <a href="#">현재 이용 내역</a>
                <a href="#">이용 완료 내역</a>
            </div>
        </div>
    </div>
</div>

<!-- =================== 리뷰 작성 폼 =================== -->
<div id="review-header">
    <h2>별점 및 리뷰</h2>
</div>

<div id="wrapper">
    <form action="reviewinsert.action" method="post" id="reviewForm">
        <input type="hidden" name="gen_confirmed_id" value="${gen_confirmed_id}">
        <input type="hidden" id="ratingInput" name="rating" value="0">
        <input type="hidden" id="selectedItemsInput" name="selectedItems" value="">

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
		        <button type="button" class="review-button" data-item="1">섬세함</button>
		        <button type="button" class="review-button" data-item="2">따뜻함</button>
		        <button type="button" class="review-button" data-item="3">친절함</button>
		        <button type="button" class="review-button" data-item="4">깨끗함</button>
		    </div>
		</div>


        <!-- 선택된 정보 표시 -->
        <div class="selected-info">
            <div id="selectedRating">선택한 별점: 0</div>
            <div id="selectedItems">선택한 리뷰 항목: 없음</div>
        </div>

        <!-- 제출 버튼 -->
        <div class="submit-section">
            <button type="button" id="submitBtn">제출하기</button>
        </div>
    </form>
</div>

</body>
</html>
