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
<title>emgReqList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gen-filter.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

    // 페이지가 로드되면 sitterMainFrame.html을 불러오기
    $(document).ready(function() {
  		$.get('./sitterMainFrame.html', function(data) {
    		$('#header-container').html(data);  // #header-container에 HTML 삽입
  		});
	});
    
 	// 돌봄 신청 클릭 시 새 창(emgRegInsertForm.jsp) 열기
    function openDetailWindow(parentId)
 	{
        // 두 번째 파라미터 : '_blank' → 새 창 열기
        // 세 번째 파라미터 : 창 옵션 (크기, 스크롤바 등)
        window.open('./emgRegInsertForm.jsp?parentId=' + parentId, '_blank', 'width=640,height=500');
    }

</script>
</head>

<body>

<!-- 시터 메인 페이지 (긴급 돌봄 정보 리스트) -->

<!-- sitterMainFrame.html을 삽입할 위치 -->
<div id="header-container">
	<c:import url="./sitterMainFrame.html" charEncoding="UTF-8" />
</div>

<div id="body-container">
	<div id="wrapper-header">
		<div class="main-subject">
			<h1>긴급 돌봄 서비스</h1>
		</div>
	</div>
	
	<!-- 부모의 긴급 돌봄 요청 표시 -->
	<div id="wrapper-body-search">
		<div class="sub-subject">
	        <h2>긴급 돌봄 요청 리스트 (3)</h2>
		</div>
		
		<div class="sub-body">
			<div class="emg-results">
		    	
		    	<% for (int i=0; i<10; i++)
		        {
		        %>
		        <!-- 긴급 돌봄 각 등록 건 1 -->
		        <div class="box-emg">
		            <div class="emg-info">
		                <div class="parent-id">parent01</div>
	                	<!-- 1.부모가 긴급 돌봄 요청한 날짜, 시간 -->
	                	<div class="emg-details">
		                    <div>돌봄 요청 일자: 📆2025.04.03.~2025.04.03.</div>
		                </div>
		                <div class="emg-details">
		                    <div>돌봄 요청 시간: ⏰오전 8시 ~ 오후 10시</div>
		                </div>
		                
		                <!-- 2.부모 거주지의 지역(개인정보 기반) -->
	                    <div class="emg-details">
	                    	<div>지역: <span class="badge">용산구</span></div>
	                    </div>
	                    
	                    <!-- 3.아이 성별 -->
	                	<div class="emg-details">
	                		<div>아이 성별:<span class="badge male">남</span></div>
	                	</div>
	                	
	                	<!-- 4.아이 연령 -->
	                    <div class="emg-details">
	                    	<div>아이 연령: 만 4 세</div>
	                    </div>
	                    
	                    <!-- 5. 장애 및 지병, 알레르기 유무 -->
	                    <!-- 
	                    <div class="emg-details child-has">
	                    	<div>장애 및 지병, 알레르기:</div>
	                    	<div>
	                    		<ul>
	                    			<li>꽃가루 알레르기</li>
	                    			<li>호두 알레르기</li>
	                    		</ul>
	                    	</div>
	                    </div>
	                     -->
		                <button type="button" class="btn emg-btn-small" onclick="openDetailWindow(1)">지원하기</button>
	                </div>
	            </div>
		        
		        <!-- 긴급 돌봄 각 등록 건 2 -->
		        <div class="box-emg">
		            <div class="emg-info">
		                <div class="parent-id">parent02</div>
	                	<!-- 1.부모가 긴급 돌봄 요청한 날짜, 시간 -->
	                	<div class="emg-details">
		                    <div>돌봄 요청 일자: 📆2025.04.04.~2025.04.05.</div>
		                </div>
		                <div class="emg-details">
		                    <div>돌봄 요청 시간: ⏰오전 11시 ~ 오후 1시</div>
		                </div>
		                
		                <!-- 2.부모 거주지의 지역(개인정보 기반) -->
	                    <div class="emg-details">
	                    	<div>지역: <span class="badge">마포구</span></div>
	                    </div>
	                    
	                    <!-- 3.아이 성별 -->
	                	<div class="emg-details">
	                		<div>아이 성별:<span class="badge male">남</span></div>
	                	</div>
	                	
	                	<!-- 4.아이 연령 -->
	                    <div class="emg-details">
	                    	<div>아이 연령: 만 3 세</div>
	                    </div>
	                    
	                    <!-- 5. 장애 및 지병, 알레르기 유무 -->
	                    <div class="emg-details child-has">
	                    	<div>장애 및 지병, 알레르기:</div>
	                    	<div>
	                    		<ul>
	                    			<li>꽃가루 알레르기</li>
	                    			<li>호두 알레르기</li>
	                    		</ul>
	                    	</div>
	                    </div>
	                    
		                <button type="button" class="btn emg-btn-small" onclick="openDetailWindow(2)">지원하기</button>
	                </div>
	            </div>
	            <!-- 긴급 돌봄 각 등록 건 3 -->
		        <div class="box-emg">
		            <div class="emg-info">
		                <div class="parent-id">parent03</div>
	                	<!-- 1.부모가 긴급 돌봄 요청한 날짜, 시간 -->
	                	<div class="emg-details">
		                    <div>돌봄 요청 일자: 📆2025.04.04.~2025.04.05.</div>
		                </div>
		                <div class="emg-details">
		                    <div>돌봄 요청 시간: ⏰오후 2시 ~ 오후 5시</div>
		                </div>
		                
		                <!-- 2.부모 거주지의 지역(개인정보 기반) -->
	                    <div class="emg-details">
	                    	<div>지역: <span class="badge">성북구</span></div>
	                    </div>
	                    
	                    <!-- 3.아이 성별 -->
	                	<div class="emg-details">
	                		<div>아이 성별:<span class="badge female">여</span></div>
	                	</div>
	                	
	                	<!-- 4.아이 연령 -->
	                    <div class="emg-details">
	                    	<div>아이 연령: 만 5 세</div>
	                    </div>
	                    
	                    <!-- 5. 장애 및 지병, 알레르기 유무 -->
	                    <!-- 
	                    <div class="emg-details child-has">
	                    	<div>장애 및 지병, 알레르기:</div>
	                    	<div>
	                    		<ul>
	                    			<li>꽃가루 알레르기</li>
	                    			<li>호두 알레르기</li>
	                    		</ul>
	                    	</div>
	                    </div>
	                     -->
	                     
		                <button type="button" class="btn emg-btn-small" onclick="openDetailWindow(3)">지원하기</button>
	                </div>
	            </div>
	            <%
	            }
		        %>
		    
		    </div>
		</div>
    </div>
	
	
</div>




</body>
</html>