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
<title>adminGenRegList.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminGenRegList.css">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	
	// 경로 선언
	const cp = '<%=cp %>';
	
	// 뒤로가기/앞으로가기 대응
	window.addEventListener('popstate', function(event) 
	{
	    loadListFromUrl();
	});
	
	$(document).ready(function()
	{
		// 날짜범위 변경시 Ajax 호출
		$('select[name="currentOnly"]').change(function()
		{
			loadList(1);
		});
		
		
	});

	// ajax 데이터 출력 함수
	function loadList(page)
	{
		// 변수 선언
		const currentOnly = $('select[name="currentOnly"]').val();
		const searchKey = $('select[name="searchKey"]').val();
		const searchValue = $('input[name="searchValue"]').val();
		
		$.ajax(
		{
			url: cp + '/admingenreglistajax.action'
		  , method: 'GET'
		  , data:
			{
			 	page: page
			  , searchKey: searchKey
			  , searchValue: searchValue
			  , currentOnly: currentOnly
			}
		  , success: function(response)
			{
				$('#listArea').html(response);
				
				var newUrl = "admingenreglist.action?page=" + page;
				
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
	
	// ajax url 표현 함수
	function loadListFromUrl()
	{
		// 현재 URL 기준으로 파라미터 읽기
        const urlParams = new URLSearchParams(window.location.search);
		
		const page = urlParams.get('page') || 1;
		const searchKey = urlParams.get('searchKey') || '';
		const searchValue = urlParams.get('searchValue') || '';
		const currentOnly = urlParams.get('currentOnly') || '';
		
		$.ajax(
		{
			url: cp + '/admingenreglistajax.action'
		  , method: 'GET'
		  , data:
			{
			 	page: page
			  , searchKey: searchKey
			  , searchValue: searchValue
			  , currentOnly: currentOnly
			}
		  , success: function(response)
			{
				$('#listArea').html(response);
				
				var newUrl = "admingenreglist.action?page=" + page;
				
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
	};

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
					<h1 class="content-title">근무 등록 내역</h1>
				</div>
				
				<!-- 필터 영역 -->
				<div class="content-filter-area">
					<div class="content-filter">
					
						<!-- 날짜 필터 -->
						<div class="filter-group date-filter">
							<select name="currentOnly" id="currentOnlySelect" class="selectField">
							    <option value="" selected>날짜 : 전체</option>
							    <option value="true">등록 중</option>
							</select>
						</div>

						<!-- 검색 폼 -->
						<div class="filter-group search-form">
							<form action="admingenreglist.action" name="searchForm" method="get">
								<select name="searchKey" class="selectField">
									<option value="name" ${searchKey == 'name' ? 'selected' : ''}>이름</option>
									<option value="sit_backup_id" ${searchKey == 'sit_backup_id' ? 'selected' : ''}>시터코드</option>
								</select> 
								<input type="text" name="searchValue" class="txt" value="${searchValue }"> 
								<input type="submit" value="검색" class="btn search-btn">
							</form>
						</div>
					</div>
				</div>

				<div class="content-body">
					<div class="info-wrapper">
						<div class="info-header">
							<div class="info-cell">번호</div>
							<div class="info-cell">이름</div>
							<div class="info-cell">근무 등록 코드</div>
							<div class="info-cell">시작일</div>
							<div class="info-cell">종료일</div>
							<div class="info-cell">시작 시간</div>
							<div class="info-cell">종료 시간</div>
							<div class="info-cell">등록일</div>
							<div class="info-cell">상세보기</div>
							<div class="info-cell">삭제</div>
						</div>

						<!-- 데이터 행 -->
						<div id="listArea">	
						<c:import url="adminGenRegListAjax.jsp"></c:import>
						</div>
					</div>

					<!-- 페이징 영역 ajax 처리 -->
				</div>
			</main>
		</div>
	</div>

<footer class="footer">
	<c:import url="/footer.action"/>
</footer>

</body>
</html>