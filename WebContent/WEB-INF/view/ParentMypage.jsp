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
	document.addEventListener('DOMContentLoaded', function()
	{
		var firstButton = document.querySelector('.menuBtn.presentPage');
		if (firstButton)
		{
			firstButton.classList.remove('presentPage');
		}
		var button = document.querySelector('#mypage');
		if (button)
		{
			button.classList.add('presentPage');
		}

		// 삭제 성공 시 세션 플래그가 있으면 alert 표시
		<c:if test="${not empty sessionScope.deleteSuccess}">
		alert("아이 정보가 삭제되었습니다.");
		</c:if>
	});

	// 아이 등록 페이지 이동 전 확인
	function confirmAndRedirect()
	{
		if (confirm('아이 정보 등록하시겠습니까?'))
		{
			window.location.href = 'childinsertform.action';
		}
	}

	// 아이 삭제 확인 및 POST 전송
	function deleteChild(childBackupId)
	{
		if (confirm("정말로 삭제하시겠습니까?"))
		{
			const form = document.createElement('form');
			form.method = 'post';
			form.action = 'childdelete.action';

			const input = document.createElement('input');
			input.type = 'hidden';
			input.name = 'child_backup_id';
			input.value = childBackupId;

			form.appendChild(input);
			document.body.appendChild(form);
			form.submit();
		}
	}
</script>
</head>

<body>

	<!-- 상단 헤더 영역 -->
	<div id="header-container">
		<c:import url="/parentheader.action" />
	</div>
<div>
	<!-- 사이드 메뉴 -->
	<div class="sidebar">
		<c:import url="/parentsidebar.action" />
	</div>

	<!-- 메인 컨텐츠 영역 -->
	<div class="content">
		<div class="title-container">
			<h2>아이 등록 목록</h2>
		</div>

		<div class="child-info-box">
			<div class="child-info-header">
				<span class="child-name-header">아이 이름</span> <span
					class="child-name-header">수정</span> <span class="child-name-header">삭제</span>
			</div>

			<div class="child-info-list">
				<c:choose>
					<c:when test="${not empty childList}">
						<c:forEach var="child" items="${childList}">
							<div class="child-info">
								<span class="child-name"
									onclick="location.href='childinfoview.action?child_backup_id=${child.child_backup_id}'">
									${child.name} </span>
								<button class="modify-btn"
									onclick="location.href='childupdateform.action?child_backup_id=${child.child_backup_id}'">수정</button>
								<button class="delete-btn"
									onclick="deleteChild('${child.child_backup_id}')">삭제</button>
							</div>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<div style="padding: 10px;">등록된 아이가 없습니다.</div>
					</c:otherwise>
				</c:choose>
			</div>
	</div>
	
	<!-- 등록 버튼 -->
	<div class="insert">
		<button type="button" class="insert-btn" id="btn"
			onclick="confirmAndRedirect()">등록하기</button>
	</div>

	<!-- 세션 플래그 제거 -->
	<c:if test="${not empty sessionScope.deleteSuccess}">
		<c:remove var="deleteSuccess" scope="session" />
	</c:if>
	</div>
</div>
	
	<footer class="footer">
		<c:import url="/footer.action"/>
	</footer>

</body>
</html>
