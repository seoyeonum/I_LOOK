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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>
        <main>
            <div class="logoImg">
                <img src="./logoimg.png" style="height: 400px;">
            </div>
            <div class="login-wrapper">
                <div id="slogan">돌봄이 필요한 부모님과<br>일자리를 원하는 시터를 잇는 플랫폼</div>
                <img src="./logo.png" id="logo">
                <span id="logoName">아이.룩</span>
                <form method="post" action="서버의url" id="login-form">
                    <input type="text" name="userId" placeholder="Id">
                    <input type="password" name="userPassword" placeholder="Password">
                    <input type="submit" value="Login">
                    <div id="loginMenu">
                        <a href="member.html" class="btn">회원가입</a>
                        <button class="btn">아이디 · 비밀번호 찾기</button>
                    </div>
                </form>
            </div>
        </main>
</body>
</html>