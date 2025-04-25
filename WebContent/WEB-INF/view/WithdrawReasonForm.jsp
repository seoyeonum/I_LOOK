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
<title>부모 탈퇴 페이지</title>
<link rel="stylesheet" type="text/css" href="css/WithdrawReasonForm.css">
<script type="text/javascript">
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
</script>
</head>
<body>

	<!-- 상단 헤더 영역 -->
	<div id="header-container">
		<c:import url="/parentheader.action" />
	</div>

	<!-- 사이드 메뉴 -->
	<div class="sidebar">
		<c:import url="/parentsidebar.action" />
	</div>

<div class="page-title">
    <h2>회원 탈퇴하기</h2>
</div>
  

 <div class="withdraw-list">
  	<div class="next-title">
    	<h2>다음에 또 만나요 ~♬</h2>
	</div>
	
  	<div class="images">
  		<img alt="회원 이미지" src="./logoimg.png" class="profile-image">
  		
  	</div>
<div class="form-buttons">
    <button type="submit" class="btn">메인 페이지로 이동</button>
    <button type="submit" class="btn">회원가입</button>
</div>

  	
 </div>

</body>
</html>