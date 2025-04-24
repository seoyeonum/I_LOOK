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
<title>부모 상세정보 페이지</title>
<link rel="stylesheet" type="text/css" href="css/ParentInfo.css">
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
    <h2>부모 상세정보</h2>
</div>

<div class="container">
    <div class="modify-content">
        <form action="" method="post">
            <div class="input-field">
                <label for="name">이름 :</label>
                <input type="text" id="name" value="${parent.name}" readonly="readonly">
            </div>

            <div class="input-field">
                <label for="ssn">주민등록번호 :</label>
                <div class="input-with-unit">
                    <input type="text" id="ssn" value="${parent.ssn_first}-${parent.ssn_second}" readonly="readonly">
                </div>
            </div>

            <div class="input-field">
                <label for="id">아이디 :</label>
                <input type="text" id="id" value="${parent.id}" readonly="readonly">
            </div>

            <div class="input-field">
                <label for="pw">비밀번호 :</label>
                <input type="password" id="pw" value="********" readonly="readonly">
            </div>

            <div class="input-field">
                <label for="tel">전화번호 :</label>
                <input type="text" id="tel" value="${parent.tel}" readonly="readonly">
            </div>

            <div class="input-field">
                <label for="addr">주소 :</label>
                <input type="text" id="addr" value="${parent.road_addr} ${parent.detailed_addr}" readonly="readonly">
            </div>

            <div class="form-buttons">
                <button type="button" class="btn update-btn" onclick="location.href='parentmypage.action'">메인으로</button>
            </div>
        </form>
    </div>
</div>
</body>
</html>
