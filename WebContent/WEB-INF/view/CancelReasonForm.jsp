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
<title>돌봄 이용 내역 취소 페이지</title>
<link rel="stylesheet" href="css/CancelReasonForm.css">
<script type="text/javascript">

    // "기타" 항목 체크 시 텍스트 입력 필드 표시
    function toggleOtherInput() 
    {
        var otherRadio = document.getElementById('reason4');
        var otherInput = document.getElementById('otherReason');
        
        if (otherRadio.checked) 
        {
            otherInput.style.display = 'block';
        } 
        else 
        {
            otherInput.style.display = 'none';
        }
    }

    // 예약 취소 버튼 클릭 시 확인 팝업 표시
    document.addEventListener('DOMContentLoaded', function () 
    {
    document.getElementById('cancelBtn').addEventListener('click', function () 
    {
		 // 선택된 사유 확인
		 const selectedReason = document.querySelector('input[name="reason"]:checked');
		 
		 if (!selectedReason) 
		 {
		     alert('취소 사유를 선택해 주세요.');
		     return;
		 }
		
		 // "기타" 사유가 선택되었으면, 입력된 텍스트도 확인
		 if (selectedReason.value === "기타" && document.getElementById('otherReason').value === '') 
		 {
		     alert('기타 사유를 입력해 주세요.');
		     return;
		 }
		
		 // 알림창 띄우기
		 const confirmation = confirm('정말로 예약을 취소하시겠습니까?');
		
		 if (confirmation) 
		 {
		     // 예약 취소 후 메인 페이지로 이동
		     alert('예약이 취소되었습니다.');
		     window.location.href = "index.html"; // 여기서 index.html은 메인 페이지로 이동하는 경로입니다. 실제 경로로 변경해주세요.
		 }
	});

    // 돌아가기 버튼 클릭 시 메인 페이지로 이동
    document.getElementById('backBtn').addEventListener('click', function() 
    {
        window.location.href = "index.html"; // 돌아갈 페이지 경로 설정
    });
});
</script>
</head>
<body>

<header>
	<div id="logo">
    	<img src="./logo.png" height="120px"></div>
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

 <div id="booking-header">
     <h2>예약 취소 사유</h2>
 </div>

<!-- 예약 취소 섹션 -->
<div class="cancel-booking-section">
    <!-- 취소 사유 라디오 버튼 -->
    <div id="reason-section">
        <p>예약 취소 사유를 선택해 주세요.</p>
        
        <div class="reason-option">
            <input type="radio" id="reason1" name="reason" value="reason1">
            <label for="reason1">이용할 수 없게 됨</label>
        </div>
        
        <div class="reason-option">
            <input type="radio" id="reason2" name="reason" value="reason2">
            <label for="reason2">개인적인 사유</label>
        </div>
        
        <div class="reason-option">
            <input type="radio" id="reason3" name="reason" value="reason3">
            <label for="reason3">다른 예약이 있어서</label>
        </div>
        
		<div class="reason-option">
		    <input type="radio" id="reason4" name="reason" value="기타" onclick="toggleOtherInput()">
		    <label for="reason4">기타</label>
		</div>
		    <div id="otherReasonContainer">
		     <input type="text" id="otherReason" placeholder="기타 사유를 입력하세요." />
		</div>
	</div>

	<!-- 예약 취소 및 돌아가기 버튼 -->
	<div id="cancelBtnSection">
	    <div class="btn-container" id="cancelBtnContainer">
	        <button id="cancelBtn">예약 취소</button>
	    </div>
	    <div class="btn-container" id="backBtnContainer">
	        <button id="backBtn">돌아가기</button> <!-- 돌아가기 버튼 추가 -->
	    </div>
	</div>
</div>

</body>
</html>