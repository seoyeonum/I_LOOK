<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>noticeInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/notice.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
    
    // 이 페이지 로드 시,
    document.addEventListener('DOMContentLoaded', function()
    {
		//=================== 헤더 버튼 클래스 변경 ==================
		
		// menuBtn 와 presentPage를 클래스로 가지는 첫 엘리먼트에서 presentPage 클래스 제거
        var firstButton = document.querySelector('.menuBtn.presentPage');
        if (firstButton)
        {
            firstButton.classList.remove('presentPage');
        }
       
        // id가 'noticeList'인 버튼을 선택
        var button = document.querySelector('#noticeList');

        // 만약 버튼이 존재하면
        if (button)
        {
            // 'presentPage' 클래스 추가
            button.classList.add('presentPage');
        }
        
        
     	// 1. 등록 버튼 클릭 시 팝업 후 수정
    	$("#insert").click(function()
    	{
    	    alert("공지사항 등록이 완료되었습니다.");
    	    
    	    // 폼 제출 → noticeList.jsp
    		$("form").submit();
    	    
    	});
     	
    	// 2. 초기화 버튼 클릭 시 확인 후 초기화
    	$("#reset").click(function(e)
    	{
    	    var userConfirmed = confirm("작성한 내용이 초기화 됩니다.\n정말 초기화 하시겠습니까?");
    	    
    	    if (userConfirmed)
    	    {
    	        //alert("textarea 초기화 완료");
    	        $("#subject-input").val('');
    	        $("#content-input").val('');
    	    }
    	    else
    	    {
    	        e.preventDefault(); // 폼 제출을 막고 현재 페이지에 머물게 함
    	        return; // 추가적인 동작을 막음
    	    }
    	});
    	
    	// 3. 목록으로 버튼 클릭 시 확인 후 목록으로
    	$("#back").click(function(e)
	   	{
	   	    var userConfirmed = confirm("작성한 내용이 저장되지 않습니다.\n정말 목록으로 돌아가시겠습니까?");
	   	    
	   	    if (userConfirmed)
	   	    {
	   	    	window.location.href='<%=cp%>/noticelist.action';
	   	    }
	   	    else
	   	    {
	   	        e.preventDefault(); // 폼 제출을 막고 현재 페이지에 머물게 함
	   	        return; // 추가적인 동작을 막음
	   	    }
	   	});
        
    });

</script>
</head>
<body>

<!-- 상단 헤더 영역 -->
<div id="header-container">
    <c:import url="adminHeader.jsp"/>
</div>

<div id="body-container">
	<div id="wrapper-header">
		<div class="main-subject">
			<h1>공지사항</h1>
		</div>
	</div>
	
	<div id="wrapper-body">
		<div class="board-header">
            <div class="board-info">
                <button type="button" id="back" class="btn">목록으로</button>
            </div>
            <div class="search-box">
                <button type="button" id="insert" class="btn">등록</button>
                <button type="button" id="reset" class="btn">초기화</button>
            </div>
        </div>
	        
		<form action="noticeinsert.action" method="post">
	        <div class="board-border">
	            <!-- 게시판 헤더 -->
		        <div class="board-detail">
		        	<div class="board-list-header">
		                <div class="board-list-cell detail-author">작성자</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-author">관리자</div>
		            </div>
		            
		            <div class="board-list-header">
		                <div class="board-list-cell detail-date">작성일</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-date">${today}</div>
		            </div>
		        </div>
		         
		        <div class="board-detail">
		            <div class="board-list-header">
		                <div class="board-list-cell detail-type">유형</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-type">
		            		<select name="notice_type_id" id="type-input">
		                		<!-- <option value="">유형 선택</option> -->
		            			<c:forEach var="type" items="${listType}">
		                		<option value="${type.notice_type_id }" class="type-input"
		                		${type.notice_type_id == '001' ? 'selected="selected"' : ''}>${type.type }</option>
		                		</c:forEach>
		                	</select>
		            	</div>
		            </div>
		            <div class="board-list-header">
		                <div class="board-list-cell detail-subject">제목</div>
		            </div>
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-subject">
		            		<input type="text" name="subject" id="subject-input"
		            		placeholder="(제목을 입력하세요./최대 16자 입력 가능)"/>
		            	</div>
		            </div>
		        </div>
		        <div class="board-detail">
		            <div class="board-list-header">
		                <div class="board-list-cell detail-content">내용</div>
		            </div>
		        </div>
		        <div class="board-detail">
		            <div class="board-list-detail">
		            	<div class="board-list-cell detail-notice-content">
		            		<textarea name="content" id="content-input"
		            		 placeholder="(내용을 입력하세요./최대 1,000자 입력 가능)"></textarea>
		            	</div>
		            </div>
		        </div>
	        </div>
    	</form>
    </div>
</div>


<footer class="footer">
	<c:import url="/footer.action"/>
</footer>

</body>
</html>