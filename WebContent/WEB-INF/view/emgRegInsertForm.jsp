<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 기존 창에서 전달된 매개변수 받기
	String parentId = request.getParameter("parentId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>genRegDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gen-filter.css">
<script type="text/javascript">

    // 페이지 로드 완료 후 실행
    document.addEventListener('DOMContentLoaded', function()
    {
        // Case 1. 팝업 닫기 버튼 → 창 닫기
        document.getElementById('back').addEventListener('click', function()
        {
            // 창 닫기
            window.close();
        });
        
        // Case 2. 돌봄 신청 버튼 → 기존 페이지에서 새 페이지 열기
        document.getElementById('emg-request').addEventListener('click', function()
        {
            // 부모 창을 genReqInsertForm.jsp로 이동
            // opener: 현재 창을 연 부모창
            // location: 이동할 URL
            // href: ...로 이동
            window.opener.location.href = './emgRegResult.jsp';
        	/* 긴급 돌봄 요청 코드 가지고 가야! */
            
            // 현재 창 닫기
            window.close();
        });
    });
</script>
</head>
<body>

<!-- parentMainFrame.html을 삽입할 위치 -->
<!-- <div id="header-container"></div> -->
<!-- 새 창으로 펼쳐질 예정이라 헤더 존재 X -->

<div id="body-container">
	<!--
	<div id="wrapper-header">
		<div class="main-subject">
			<h1>일반 돌봄 서비스</h1>
		</div>
	</div>	
	-->
	
	<!-- <div id="wrapper-body-search"> -->
	
		<!-- 긴급 돌봄 등록 건 상세 -->
	    <div class="emg-results-detail">
	    	<div class="sub-subject">
	        	<h2>긴급 돌봄 상세 정보</h2>
	        </div>
	        <!-- 긴급 돌봄 각 등록 건 -->
	        <div class="box-detail">
	            <div class="emg-info">
	                <div class="name">Parent01</div>
	                <div class="emg-details">
	                    <div>돌봄 등록 일자: 📆2025.03.31.~2025.04.11.</div>
	                    <div>돌봄 등록 시간: ⏰오전 9시 ~ 오후 2시</div>
	                    <div>지역:
	                    	<span class="badge">서초구</span>
	                    	<span class="badge">강남구</span>
	                    </div>
	                    <div>아이 성별:<span class="badge male">남</span></div>
	                	<div>아이 연령: 만 4 세</div>
	            	</div>
	            	<div class="emg-details">
	            		지도 API로 도로명 주소 기반 핀 표시?
	            	</div>	
	   			</div>
	        </div>
	        <div class="btn-area row-items">
		        <button type="button" class="btn gen-btn-small" id="back">팝업 닫기</button>
		        <button type="button" class="btn gen-btn-small" id="emg-request">돌봄 지원</button>
		    </div>
	    </div>
</div>

</body>
</html>