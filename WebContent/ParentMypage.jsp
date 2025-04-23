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
			alert(childId + "이 삭제되었습니다.");
			location.reload();
		}
	}

    function confirmAndRedirect() {
        // 사용자에게 경고 메시지 표시
        var userConfirmed = confirm('아이 정보 등록하시겠습니까?');

        // 사용자가 확인을 클릭한 경우에만 페이지 이동
        if (userConfirmed) {
            window.location.href = 'childinsertform.action';
        }
    }
</script>
</head>
<body>

<header>
	<c:import url="/sitterheader.action"/>
</header>

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