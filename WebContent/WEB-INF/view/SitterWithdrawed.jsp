<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); //내부적으로 콘텍스트를 지정할 수 있는 경로
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>탈퇴 성공</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/ILookCSS.css">
<style type="text/css">

        @font-face {
            font-family: 'NoonnuBasicGothicRegular';
            src: url('https://fastly.jsdelivr.net/gh/projectnoonnu/noon-2410@1.0/NoonnuBasicGothicRegular.woff2') format('woff2');
            font-weight: normal;
            font-style: normal;
        }
        
        #wrapper {
            display: flex;
            /* justify-content: center;
            align-items: center; */
            flex-direction: column;
            gap: 25px;
        }

        header {
            height: 150px;
            width: 100%;
            display: flex;
            gap: 40px;
            justify-content: center;
            align-items: center;
            -webkit-box-shadow: 0 10px 6px -6px #777;
            -moz-box-shadow: 0 10px 6px -6px #777;
            box-shadow: 0 10px 6px -6px #777;
        }

        #logo {
            position: relative;
            top: -17px;
            left: -90px;
            height: 50px;
            width: 200px;
        }

        nav {
            height: 45px;
            width: 800px;
            display: flex;
            vertical-align: middle;
            position: relative;
            top: 45px;
            left: 260px;
        }

        .menuBtn {
            height: 45px;
            font-size: 20px;
            background: transparent;
            border: none;
            outline: none;
            margin: 0 10px;
            font-family: 'NoonnuBasicGothicRegular';
        }

        .presentPage {
            color: rgb(226, 140, 153);
        }

        .menuBtn:hover {
            color: rgb(226, 140, 153);
        }

        #notice {
            display: flex;
            justify-content: space-around;
            align-items: center;
            height: 250px;
            width: 1200px;
            gap: 5px;
        }

        #notice_text {
            border: 2px solid gainsboro;
            height: 100%;
            width: 98%;
            border-radius: 20px;

        }

        main {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 25px;
        }

        #fillter {
            height: 400px;
            width: 1170px;
            display: flex;
            justify-content: center;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
        }

        #select_box {
            border: 2px solid gainsboro;
            height: 100px;
            width: 1100px;
            border-radius: 20px;
            margin-top: 40px;
        }
        
        /* 메인 콘텐츠 */
        .content
        {
            padding: 20px;
        }
        
        h1, h2, button
        {
            font-family: 'NoonnuBasicGothicRegular';
            text-align: center;
        }
        
        .loginBtn
        {
        	font-size: 16pt;
        	background-color: #f4cccc; 
        	border: 2px solid #ea9999;
        	border-radius: 10px;
        }
        
        .loginBtn:hover
        {
        	background-color: #ea9999;
        	border: 2px solid #f4cccc;
        }
        
        .loginBtn:active
        {
        	color: #ea9999;
        	background-color: #f4cccc; 
        	border: 2px solid #ea9999;
        }
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript">
</script>
</head>

<body>
    <div id="wrapper">
        <!--헤더 부분은 공용으로 모든 뷰페이지에 사용하고 메인부분만 변경하는 부분으로 생각했었어 각 뷰페이지에 헤더부분만 같아도 통일감을 가질 것 같아서-->
        <header>
            <div id="logo">
                <img src="./images/logo.png" height="120px">
            </div>
            <nav>
                <button type="button" class="menuBtn presentPage">홈</button>
                <button type="button" class="menuBtn">스케줄러</button>
                <button type="button" class="menuBtn">긴급돌봄서비스</button>
                <button type="button" class="menuBtn">마이페이지</button>
                <button type="button" class="menuBtn">알림함</button>
                <button type="button" class="menuBtn">로그아웃</button>
            </nav>
        </header>
	</div>
	<main>
		<div class="withdrawed text">
			<img src="./images/logoimg.png" alt="사이트 아이콘 이미지. 하트를 중심으로 두 여자가 손을 맞잡고 있다." />
			
			<h1>정상적으로 탈퇴되었습니다.</h1>
			<h2>다시 만날 수 있기를 진심으로 기원합니다.</h2>
			<br />
			
			<div style="text-align: center;">
			<button class="loginBtn" type="button" onclick="누르면 로그인페이지로 가는 함수">로그인 페이지로</button>
			</div>
		</div>
	</main>
</body>
</html>