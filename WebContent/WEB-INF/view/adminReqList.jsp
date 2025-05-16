<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminReqList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminReqList.css">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	const cp = '<%=cp %>';
	// 뒤로가기/앞으로가기 대응
	window.addEventListener('popstate', function(event) 
	{
	    loadListFromUrl();
	});
	
	$(document).ready(function()
	{
		// 페이지 열릴 때 url 기준 페이지 열림
		loadListFromUrl();

	    // 돌봄유형 변경시 Ajax 호출
	    $('input[name="careType"]').change(function() 
	    {
	        loadList(1);
	    });

	    // 예약상태 변경시 Ajax 호출
	    $('select[name="statusFilter"]').change(function() 
	    {
	        loadList(1);
	    });

	    // 날짜범위 변경시 Ajax 호출
	    $('select[name="dateRange"]').change(function() 
	    {
	        loadList(1);
	    });
		
	});

	function loadList(page) 
	{
		// 변수 선언
	    const careType = $('input[name="careType"]:checked').val();
	    const statusFilter = $('select[name="statusFilter"]').val();
	    const dateRange = $('select[name="dateRange"]').val();
	    const searchKey = $('select[name="searchKey"]').val();
	    const searchValue = $('input[name="searchValue"]').val();
	    
	    $.ajax(
	    {
	        url: cp + '//admingenreqlistajax.action'
	      , method: 'GET'
	      , data: 
	        {
	    	 	page: page
	    	  , careType: careType
	    	  , statusFilter: statusFilter
	    	  , dateRange: dateRange
	    	  , searchKey: searchKey
	    	  , searchValue: searchValue
	        }
	        , success: function(response) 
	        {
	            $('#listArea').html(response);

	            var newUrl = "adminreqlist.action?page=" + page
	                       + "&careType=" + careType
	                       + "&statusFilter=" + statusFilter
	                       + "&dateRange=" + dateRange;

	            if (searchKey) 
	            {
	                newUrl += "&searchKey=" + searchKey;
	            }
	            if (searchValue) 
	            {
	                newUrl += "&searchValue=" + encodeURIComponent(searchValue);
	            }

	            history.pushState(null, '', newUrl);
	        }
	        ,error: function(xhr, status, error)
	        {
	            console.error('에러 발생:', error);
	        }
	    });
	}
	
	function loadListFromUrl() 
    {
        // 현재 URL 기준으로 파라미터 읽기
        const urlParams = new URLSearchParams(window.location.search);

        const page = urlParams.get('page') || 1;
        const careType = urlParams.get('careType') || 'normal';
        const statusFilter = urlParams.get('statusFilter') || 'all';
        const dateRange = urlParams.get('dateRange') || 'allDay';
        const searchKey = urlParams.get('searchKey') || '';
        const searchValue = urlParams.get('searchValue') || '';

        $.ajax(
        {
            url: cp + '/admingenreqlistajax.action'
         , method: 'GET'
         , data: 
           {
        	    page: page
	    	  , careType: careType
	    	  , statusFilter: statusFilter
	    	  , dateRange: dateRange
	    	  , searchKey: searchKey
	    	  , searchValue: searchValue
            },
            success: function(response) 
            {
                $('#listArea').html(response);
            },
            error: function(xhr, status, error) 
            {
                console.error('에러 발생:', error);
            }
        });
    }
		
</script>
</head>
<body>

	<div class="wrap">
		<header>
			<c:import url="adminHeader.jsp"></c:import>
		</header>

		<div class="container">
			<!--사이드바 영역 -->
			<c:import url="sidebarService.jsp"></c:import>

			<!-- 메인 콘텐츠 영역 -->
			<main class="main-content">
				<!-- 타이틀 영역 -->
				<div class="content-header">
					<h1 class="content-title">예약 신청 내역</h1>
				</div>

				<!-- 필터 영역 -->
				<div class="content-filter-area">
					<div class="content-filter">
					
						<!-- 돌봄 유형 필터 -->
						<div class="filter-group care-type-filter">
							<label><input type="radio" name="careType" value="normal"
								<c:if test="${careType == 'normal'}">checked</c:if>>일반돌봄</label>
							<label><input type="radio" name="careType" value="emergency"
								<c:if test="${careType == 'emergency'}">checked</c:if>>긴급돌봄</label>
						</div>

						<!-- 예약 상태 필터 -->
						<div class="filter-group status-filter">
							<select name="statusFilter" class="selectField">
								<option value="all" selected="selected">예약 상태 : 전체</option>
								<option value="request">예약 신청</option>
								<option value="confirmed">예약 확정</option>
								<option value="completed">예약 완료</option>
								<option value="canceled">예약 취소</option>
							</select>
						</div>

						<!-- 날짜 필터 -->
						<div class="filter-group date-filter">
							<select name="dateRange" class="selectField">
								<option value="allDay" selected="selected">날짜 : 전체</option>
								<option value="week">1주일</option>
								<option value="month">1개월</option>
								<option value="3month">3개월</option>
							</select>
						</div>
						<div id="customDate" style="display: none;">
					    <label>시작일: <input type="date" name="startDate" id="startDate" value="${startDate}"></label>
					    <label>종료일: <input type="date" name="endDate" id="endDate" value="${endDate}"></label>
						</div>
					
						<!-- 검색 폼 -->
						<div class="search-filter">
							<form action="adminreqlist.action" method="get" name="searchForm">
								<select name="searchKey" class="selectField">
						            <option value="par_name" <c:if test="${searchKey eq 'par_name'}">selected</c:if>>부모 이름</option>
						            <option value="par_backup_id" <c:if test="${searchKey eq 'par_backup_id'}">selected</c:if>>부모 코드</option>
						        </select>
						        <input type="text" name="searchValue" class="txt" value="${searchValue}">
								<input type="submit" value="검색" class="btn search-btn">
							</form>
						</div>
					</div>
				</div>
				
				<div class="content-body">
					<div class="info-wrapper">
						<div class="info-header">
							<div class="info-cell">번호</div>
							<div class="info-cell">부모 이름</div>
							<div class="info-cell">예약 번호</div>
							<div class="info-cell">근무 등록 번호</div>
							<div class="info-cell">예약일</div>
							<div class="info-cell">상태</div>
							<div class="info-cell">상세보기</div>
							<div class="info-cell">삭제</div>
						</div>
						
						<!-- 데이터 행 -->
						<div id="listArea">	
						<c:import url="adminReqListAjax.jsp"></c:import>
						</div>
					</div>

					<!-- 페이지 영역 ajax -->
				</div>
			</main>
		</div>
	</div>
<footer class="footer">
	<c:import url="/footer.action"/>
</footer>

</body>
</html>

