<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>로그인 페이지</title>
    <style>
        * {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            background-color: #fff;
        }

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 20px;
        }

        .logoImg {
            margin-right: 40px;
        }

        .logoImg img {
            max-height: 400px;
            width: auto;
        }

        .login-wrapper {
            width: 460px;
            padding: 40px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
        }

        #slogan {
            font-size: 18px;
            margin-bottom: 10px;
            color: #333;
            line-height: 1.5;
        }

        #logo {
            height: 80px;
            margin-top: 10px;
        }

        #logoName {
            font-size: 22px;
            font-weight: bold;
            color: #333;
            margin-left: 10px;
            vertical-align: middle;
        }

        .login-wrapper h2 {
            font-size: 24px;
            color: rgb(226, 140, 153);
            margin-bottom: 20px;
            text-align: center;
        }

        #login-form > input,
        #login-form > select {
            width: 100%;
            height: 48px;
            padding: 0 12px;
            margin-bottom: 16px;
            border-radius: 6px;
            border: 1px solid #ddd;
            background-color: #f8f8f8;
            font-size: 15px;
        }

        #login-form > input[type="submit"] {
            background-color: rgb(226, 140, 153);
            font-size: 16px;
            font-weight: bold;
            color: #fff;
            cursor: pointer;
            border: none;
        }

        #login-form > input[type="submit"]:hover {
            background-color: rgb(211, 115, 130);
        }

        #loginMenu {
            display: flex;
            align-items: center;
            justify-content: space-between;
            margin-top: 10px;
        }

        .btn {
            border: none;
            background: none;
            outline: none;
            font-size: 16px;
            color: #555;
            cursor: pointer;
        }

        .btn:hover {
            color: rgb(226, 140, 153);
            text-decoration: underline;
        }

        .error-msg {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
    
    <% if (request.getParameter("logout") != null && request.getParameter("logout").equals("success")) { %>
    <script>
        alert("로그아웃이 완료되었습니다.");
        
        // 로그아웃 메시지
        <% if (request.getParameter("logout") != null && request.getParameter("logout").equals("success")) { %>
            alert("로그아웃이 완료되었습니다.");
        <% } %>

        // 탈퇴 완료 메시지
        <% if (request.getParameter("message") != null) { %>
            alert("<%= request.getParameter("message") %>");
        <% } %>
    </script>
	<% } %>
	
	<% if (request.getParameter("sitterinsert") != null && request.getParameter("sitterinsert").equals("success")) { %>
    <script>
        alert("시터 회원 요청이 완료되었습니다.");
    </script>
	<% } %>

</head>
<body>
<!-- 탈퇴 후 재로그인 안되는 메세지 -->
<% if (request.getAttribute("message") != null) { %>
    <script>
        alert("<%= request.getAttribute("message") %>");
    </script>
<% } %>



<main>
    <!-- 로고 이미지 -->
    <div class="logoImg">
        <img src="<%= cp %>/images/logoimg.png" style="height: 400px;">
    </div>

    <!-- 로그인 박스 -->
    <div class="login-wrapper">
        <div id="slogan">돌봄이 필요한 부모님과<br>일자리를 원하는 시터를 잇는 플랫폼</div>
        <div style="display: flex; align-items: center;">
			<img src="<%= cp %>/images/logo.png" id="logo"> 
			<span id="logoName">아이.룩</span>
        </div>

        <form method="post" action="login.action" id="login-form">
            <!-- 회원 유형 선택 -->
            <select name="userType" required>
                <option value="">회원 유형 선택</option>
                <option value="admin">관리자</option>
                <option value="parent">부모</option>
                <option value="sitter">시터</option>
            </select>

            <!-- 아이디, 비밀번호 -->
            <input type="text" name="id" id="id" placeholder="아이디" required>
            <input type="password" id="pw" name="pw" placeholder="비밀번호" required>
            <input type="submit" value="Login">

            <div id="loginMenu">
                <a href="membership.action" class="btn">회원가입</a>
                <button type="button" class="btn" onclick="alert('준비 중입니다.')">아이디 · 비밀번호 찾기</button>
            </div>
<%-- 
            <!-- 로그인 실패 메시지 -->
            <c:if test="${param.error == '1'}">
                <p class="error-msg">아이디, 비밀번호 또는 회원 유형이 잘못되었습니다.</p>
            </c:if> --%>
        </form>
    </div>
</main>
</body>
</html>
