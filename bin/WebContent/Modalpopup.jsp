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
<title>부모 마이페이지(메인)</title>
<link rel="stylesheet" type="text/css" href="css/Modalpopup.css">
<script type="text/javascript">
    
//팝업을 띄울 페이지 URL
const openPopup = () => 
{
    var popup = document.getElementById("popup");
    var closeBtn = document.getElementById("closeBtn");
    var dontShowAgain = document.getElementById("dontShowAgain");

    // 팝업을 보여준다
    popup.style.display = "block";

    // 닫기 버튼 클릭 시 팝업 닫기
    closeBtn.onclick = () => 
    {
        popup.style.display = "none";

        // 체크박스가 선택되었으면 1주일 동안 다시 열리지 않도록 처리할 수 있습니다.
        if (dontShowAgain.checked) 
        {
            // 여기에서 로컬스토리지 또는 쿠키를 사용하여 팝업을 다시 열리지 않도록 설정할 수 있습니다.
            localStorage.setItem("popupClosed", "true");
        }
    };

    // 만약 "일주일 동안 열리지 않습니다"가 체크되어 있다면
    if (localStorage.getItem("popupClosed") === "true") 
    {
        popup.style.display = "none";
    }
}

// 페이지가 로드될 때 팝업을 자동으로 열기
window.onload = () => 
{
    // "일주일 동안 열리지 않습니다" 체크박스가 체크되지 않은 경우에만 팝업을 자동으로 띄웁니다
    if (localStorage.getItem("popupClosed") !== "true") 
    {
        openPopup();
    }

    // 팝업을 클릭하여 이동 가능하게 만드는 코드 추가
    const popup = document.getElementById("popup");
    let isDragging = false;
    let offsetX, offsetY;

    // 마우스 클릭 시 팝업이 이동될 수 있도록 처리
    popup.onmousedown = function (e) 
    {
        // 클릭이 시작된 위치를 기준으로 이동 시작
        isDragging = true;
        
        // 마우스의 클릭 위치와 팝업 창의 좌표 차이를 계산
        offsetX = e.clientX - popup.getBoundingClientRect().left;
        offsetY = e.clientY - popup.getBoundingClientRect().top;

        // 마우스를 움직일 때마다 위치 변경
        document.onmousemove = function (e) 
        {
            if (isDragging) 
            {
                // 마우스 이동을 기반으로 팝업 위치 변경
                popup.style.left = e.clientX - offsetX + "px";
                popup.style.top = e.clientY - offsetY + "px";
            }
        };

        // 마우스 버튼을 떼면 드래그가 종료
        document.onmouseup = function () 
        {
            isDragging = false;
            document.onmousemove = null;
            document.onmouseup = null;
        };
    };
}

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
  	<div class="menu">
	    <div class="menu-item">
	      <a href="#"><i class="fa-solid fa-cat"></i>아이 정보</a>
	      <div class="submenu">
	      	<a href="#">아이 정보</a>
	        <a href="#">아이 정보 등록하기</a>
	        <a href="#">아이 정보 수정하기</a>
	      </div>
	    </div>
	    
	    <div class="menu-item">
	      <a href="#">부모 정보</a>
	      <div class="submenu">
	        <a href="#">부모 정보</a>
	        <a href="#">부모 정보 수정하기</a>
	      </div>
	    </div>
	    
	    <div class="menu-item">
	      <a href="#">돌봄 이용</a>
	      <div class="submenu">
	        <a href="#">돌봄 이용 내역</a>
	        <a href="#">돌봄 이용 완료 내역</a>
	      </div>
	    </div>
	   </div> 
  </div>
  
  <div class="content">
    <div class="title-container">
        <h2>아이 등록 목록</h2> 
    </div>
    
        <div class="child-info-box">
	        <div class="child-info-header">
	            <span class="child-name-header">아이 이름</span>
	            <span class="child-name-header">수정</span>
	            <span class="child-name-header">삭제</span>
	        </div>
	        
	    <div class="child-info-list">
	        <div class="child-info">
	            <span class="child-name" onclick="location.href='childDetailPage.jsp?id=1'">아이1</span>
	            <button class="modify-btn" onclick="alert('아이1 수정')">수정</button>
	            <button class="delete-btn" onclick="deleteChild('아이1')">삭제</button>
	        </div>
	        <div class="child-info">
	            <span class="child-name" onclick="location.href='childDetailPage.jsp?id=2'">아이2</span>
	            <button class="modify-btn" onclick="alert('아이2 수정')">수정</button>
	            <button class="delete-btn" onclick="deleteChild('아이2')">삭제</button>
	        </div>
	       </div>
	    </div>
  </div>
  
  <div class="insert">
  	<button type="button" class="insert-btn" id="btn" onclick="alert('아이 정보 등록하시겠습니까?')">등록하기</button>
  </div>

  <!-- 팝업 창 -->
  <div id="popup">
      <h3>등급이 상승됨을 알립니다!</h3>
      <p>축하드립니다~!!</p>
      <div class="checkbox-container">
          <input type="checkbox" id="dontShowAgain"> 일주일 동안 열리지 않습니다.
      </div>
      <button id="closeBtn" class="close-btn">닫기</button>
  </div>

</body>
</html>
