<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>genRegInsertFormComplete.jsp</title>
<style>
    * {
        margin: 0;
        padding: 0;
    }
    
    .wrap {
        width: 100%;
        min-height: 100vh;
        display: flex;
        flex-direction: column;
    }
    .container { 
        padding: 30px;
        margin-top: 150px;
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
    }
    
    .completion-message {
        text-align: center;
        margin-bottom: 40px;
    }
    
    .completion-message h1 {
        font-size: 32px;
        margin-bottom: 15px;
        color: #333;
    }
    
    .button-container {
        display: flex;
        justify-content: center;
        gap: 20px;
    }
    
    .button {
        padding: 12px 25px;
        font-size: 16px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
    }
    
    .home-btn {
        background-color: #4a90e2;
        color: white;
    }
    
    .home-btn:hover {
        background-color: #3a7bc8;
    }
    
    .history-btn {
        background-color: #5cb85c;
        color: white;
    }
    
    .history-btn:hover {
        background-color: #4cae4c;
    }
</style>
</head>
<body>
<div class="wrap">
    <header>
		<c:import url="header.jsp"></c:import>
	</header>
    
    <div class="container">
        <div class="completion-message">
            <h1>등록이 완료되었습니다.</h1>
            <p>요청하신 작업이 성공적으로 완료되었습니다.</p>
        </div>
        
        <div class="button-container">
            <button type="button" class="button home-btn" onclick="">홈</button>
            <button type="button" class="button history-btn" onclick="">등록 내역 확인</button>
        </div>
    </div>
</div>
</body>
</html>