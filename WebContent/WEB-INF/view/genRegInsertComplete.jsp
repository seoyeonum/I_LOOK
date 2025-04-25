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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	//이 페이지 로드 시,
	document.addEventListener('DOMContentLoaded', function()
	{
		//=================== 헤더 버튼 클래스 변경 ==================
			
	    // menuBtn 와 presentPage를 클래스로 가지는 첫 엘리먼트에서 presentPage 클래스 제거
	    var firstButton = document.querySelector('.menuBtn.presentPage');
	    if (firstButton)
	    {
	        firstButton.classList.remove('presentPage');
	    }
	   
	    // id가 'emg'인 버튼을 선택
	    var button = document.querySelector('#emg');
	    // 만약 버튼이 존재하면
	    if (button)
	    {
	        // 'presentPage' 클래스 추가
	        button.classList.add('presentPage');
	    }
	});

	function mainPage()
	{
		 location.href = "emgmain.action";
	}
	
	function genRegList()
	{
		var value = document.getElementById("btn").value;
		location.href = "genreglist.action?sit_backup_id=" + value;
	}

</script>
</head>
<body>
<div class="wrap">
    <header>
		<c:import url="/sitterheader.action"/>
	</header>
    
    <div class="container">
        <div class="completion-message">
            <h1>등록이 완료되었습니다.</h1>
            <p>요청하신 작업이 성공적으로 완료되었습니다.</p>
        </div>
        
        <div class="button-container">
            <button type="button" class="button home-btn" onclick="mainPage()">홈</button>
            <button type="button" id="btn" class="button history-btn" onclick="genRegList()" value="${sit_backup_id }">등록 내역 확인</button>
        </div>
    </div>
</div>
</body>
</html>