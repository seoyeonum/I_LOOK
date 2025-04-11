<%@ page contentType="text/html; charset=UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	// 기존 창에서 전달된 매개변수 받기
	String sitterId = request.getParameter("sitterId");
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
        document.getElementById('gen-request').addEventListener('click', function()
        {
            // 부모 창을 genReqInsertForm.jsp로 이동
            // opener: 현재 창을 연 부모창
            // location: 이동할 URL
            // href: ...로 이동
            window.opener.location.href = './genReqInsertForm.jsp?sitterId='+ <%=sitterId %>;
            
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
	
		<!-- 일반 돌봄 등록 건 상세 -->
	    <div class="gen-results-detail">
	    	<div class="sub-subject">
	        	<h2>일반 돌봄 상세 정보</h2>
	        </div>
	        <!-- 일반 돌봄 각 등록 건 -->
	        <div class="box-detail">
	            <div class="sitter-photo">
	                <img src="./images/sit01.jpg" alt="시터 사진">
	            </div>
	            <div class="sitter-info">
	                <div class="sitter-name">김탄 시터&nbsp;<span class="badge male">남</span> </div>
	                <div class="sitter-details">
	                    <div>
	                    	<img src="" alt="🥉">브론즈 시터
	                    </div>	<!-- 대체 텍스트 수정 필요 -->
	                	<div>최근 평점: ⭐4.9 (7건)</div>
	                    <div>전체 평점: ⭐4.76 (123건)</div>
	                    <div>돌봄 등록 일자: 📆2025.03.31.~2025.04.11.</div>
	                    <div>돌봄 등록 시간: ⏰오전 9시 ~ 오후 2시</div>
	                    <div>지역:
	                    	<span class="badge">서초구</span>
	                    	<span class="badge">강남구</span>
	                    </div>
	               		<div>자신있는 돌봄 연령대:
	                    	<span class="badge">영아</span>
	                    	<span class="badge">아동</span>
	                    </div>
	               		<div>보유 자격:
	                    	<span class="badge">보육 교사 2급</span>
	                    </div>
	                    <div>시터님의 한 마디: 아이들과 함께 일하는 순간이 가장 행복해요. :)</div>
	                	<div>마지막 근무일: 2025.03.14.</div>
	            	</div>	
	   			</div>
	        </div>
	        <div class="btn-area row-items">
		        <button type="button" class="btn gen-btn-small" id="back">팝업 닫기</button>
		        <button type="button" class="btn gen-btn-small" id="gen-request">돌봄 신청</button>
		    </div>
	    </div>
	    
	<!-- </div> -->
</div>

</body>
</html>