<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    request.setCharacterEncoding("UTF-8");
    String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 선택</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4; 
            color: #333; 
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh; 
            overflow: hidden; 
        }

        .container {
            background-color: #fff; 
            padding: 30px; 
            border-radius: 10px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1); 
            text-align: center;
            width: 100%;
            max-width: 500px; 
            box-sizing: border-box; 
        }

        #title {
            font-size: 36px;
            font-weight: bold;
            margin-bottom: 10px; 
        }

        #title img {
            width: 100%; 
            height: auto;
            margin-bottom: 10px; 
        }

        h2 {
            font-size: 26px; 
            margin-bottom: 30px; 
            color: #333;
        }

        .btn-container {
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 15px 25px; 
            font-size: 18px; 
            margin: 10px 0; 
            cursor: pointer;
            border: none;
            border-radius: 5px;
            background-color: #f8bbd0; 
            color: white;
            text-decoration: none;
            width: 100%; 
            box-sizing: border-box; 
        }

        .btn:hover {
            background-color: 
        }

        .back-btn {
            margin-top: 40px;
            font-size: 16px;
        }

        .back-btn a {
            text-decoration: none;
            color: #000; 
        }

        .back-btn a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <div class="container">
        <div id="title">
           <img src="<%= cp %>/images/logoimg.png" id="logo" alt="Logo"> <!-- 이미지 경로를 실제로 넣어주세요 -->
        </div>

        <h2>가입유형을 선택해주세요.</h2>

        <div class="btn-container">
            <a href="/parentInsertForm.action"  class="btn">부모님으로 회원가입하기</a>
            <a href="/sitterInsertForm.action" class="btn">베이비시터로 회원요청하기</a>
        </div>

        <div class="back-btn">
            <a href="window.location.href='<%=cp%>/iLook.action'">로그인 화면으로 돌아가기</a>
        </div>
    </div>

</body>
</html>
