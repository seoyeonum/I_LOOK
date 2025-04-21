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
<link rel="stylesheet" type="text/css" href="css/ParentMypage.css">
<script type="text/javascript">

	function deleteChild(childId)
	{
		if (confirm("정말로 삭제하시겠습니까?"))
		{
			// 추후 ajax 또는 form submit으로 삭제 처리
			alert(childId + "이 삭제되었습니다.");
			location.reload();
		}
	}
	
    function confirmAndRedirect() {
        var userConfirmed = confirm('아이 정보 등록하시겠습니까?');
        if (userConfirmed) {
            window.location.href = 'childinsertform.action';
        }
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
            <c:choose>
                <c:when test="${not empty childList}">
                    <c:forEach var="child" items="${childList}">
                        <div class="child-info">
                            <span class="child-name" onclick="location.href='childDetailPage.jsp?id=${child.child_reg_id}'">
                                ${child.name}
                            </span>
                            <button class="modify-btn" onclick="alert('${child.name} 수정')">수정</button>
                            <button class="delete-btn" onclick="deleteChild('${child.child_reg_id}')">삭제</button>
                        </div>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <div style="padding: 10px;">등록된 아이가 없습니다.</div>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
  
<div class="insert">
  	<button type="button" class="insert-btn" id="btn" onclick="confirmAndRedirect()">등록하기</button>
</div>

</body>
</html>
