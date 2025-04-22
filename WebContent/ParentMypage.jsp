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
	
	// 이름을 누르면 아이 상세 정보 페이지로 이동
	
	// 아이 수정 버튼을 누르면 수정할 페이지로 이동
	
	// 아이 삭제 버튼을 누르면 정보 삭제 확인 경고창과 함께 삭제
	function deleteChild()
	{
		if (confirm("정말로 삭제하시겠습니까?"))
		{
			// ajax 활용
			alert(childId + "이 삭제되었습니다.");
			
			// 삭제 후 새로고침
			location.reload();
		}
	}
	
    function confirmAndRedirect() {
        // 사용자에게 경고 메시지 표시
        var userConfirmed = confirm('아이 정보 등록하시겠습니까?');

        // 사용자가 확인을 클릭한 경우에만 페이지 이동
        if (userConfirmed) {
            window.location.href = 'ChildInsertForm.jsp'; // 페이지 이동
        }
    }
</script>
</head>
<body>

<%-- 
<header>
	<c:import url="/sitterheader.action"/>
</header>
 --%>

<div id="header-container">
	<c:import url="/sitterheader.action"/>
</div>

<div class="sidebar">
	<c:import url="/parentSidebar.jsp"/>
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
	            <button class="delete-btn" onclick="alert('아이1 삭제')">삭제</button>
	        </div>
	        <div class="child-info">
	            <span class="child-name" onclick="location.href='childDetailPage.jsp?id=2'">아이2</span>
	            <button class="modify-btn" onclick="alert('아이2 수정')">수정</button>
	            <button class="delete-btn" onclick="alert('아이2 삭제')">삭제</button>
	        </div>
	       </div>
	    </div>
  </div>
  
  <div class="insert">
  	<button type="button" class="insert-btn" id="btn" onclick="confirmAndRedirect()">등록하기</button>
  </div>

</body>
</html>