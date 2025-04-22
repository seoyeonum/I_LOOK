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
<title>genSearchResult.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gen-filter.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script src="js/genFilter.js" defer></script>
<script type="text/javascript">
	
	//이 페이지 로드 시,
    $(document).ready(function()
    {
    	//=================== 헤더 버튼 클래스 변경 ==================
		
        // menuBtn 와 presentPage를 클래스로 가지는 첫 엘리먼트에서 presentPage 클래스 제거
        var firstButton = document.querySelector('.menuBtn.presentPage');
        if (firstButton)
        {
            firstButton.classList.remove('presentPage');
        }
       
        // id가 'gen'인 버튼을 선택
        var button = document.querySelector('#gen');

        // 만약 버튼이 존재하면
        if (button)
        {
            // 'presentPage' 클래스 추가
            button.classList.add('presentPage');
        }
    	
        
        //=================== 사이드 바 토글 기능 ==================
                
    	// 토글 처리 - 시터 등급
  		$("#toggle-grade").click(function() {
        	//$("#checkbox-grade").toggle();			// 일반 토글 모션 처리
  			$("#checkbox-grade").slideToggle(500);		// 부드러운 토글 모션 처리 (괄호는 밀리초 단위 처리 속도)
    	});
  		
  		// 토글 처리 - 시터 근무 선호 지역
  		$("#toggle-region").click(function() {
        	$("#checkbox-region").slideToggle(750);
    	});
  		
  		// 토글 처리 - 시터 성별 
  		$("#toggle-gender").click(function() {
        	$("#checkbox-gender").slideToggle(500);
    	});
  		
  		// 토글 처리 - 시터 연령대 
  		$("#toggle-age").click(function() {
        	$("#checkbox-age").slideToggle(500);
    	});
  	
  		// 토글 처리 - 시터 보유 자격증 
  		$("#toggle-cert").click(function() {
        	$("#checkbox-cert").slideToggle(500);
    	});
  		
  		// 토글 처리 - 전체 돌봄 비용
  		$("#toggle-price").click(function() {
        	$("#range-price").slideToggle(500);
    	});
  		
	  	// 가격 range 값 변경 시 current-price로 표시
  	    $('input[name="price"]').on('input', function()
  	    {
  	        var value = $(this).val();
  	        
  	        // 숫자 단위 구분자 포맷으로 전환
  	        var formatValue = Number(value).toLocaleString('ko-KR');
  	        $('#current-price').text(formatValue + '원');
  	    });
  	    
  	    // 가격 초기 설정
  	    var initialPrice = $('input[name="price"]').val();
  	    var formattedInitialPrice = Number(initialPrice).toLocaleString('ko-KR');
  	    $('#current-price').text(formattedInitialPrice + '원');
  	    
  	    
  	    //=================== 사이드 바 AJAX 기능 ==================
  	    
	  	$('#secondary-search-btn').on('click', function()
  		{
  			var grades = ['A', 'B', 'C']; 				// 예: 여러 등급을 배열로 저장
  			var regions = ['SEOUL', 'BUSAN', 'DAEGU'];  // 예: 여러 지역을 배열로 저장
			
  		// AJAX 요청
            $.ajax({
                url: 'genregpossiblelist.action'
                , method: 'POST'
                , traditional: true
                , data:
                { 
                    grades: grades 
                    , regions: regions
                    , genders: genders
                    , ages: ages
                    , certs: certs
                }
                , dataType: 'html'
                , beforeSend: function(xmlHttpRequest)   // AJAX 요청 서버 전송 직전 실행
                {
                   xmlHttpRequest.setRequestHeader("Accept", "text/html; charset=utf-8");
                }
                , success: function(response)
                {
                   // 확인
                    //console.log("응답 성공:", response);
                   
                    $('#resultArea').html(response);
                }
                , error: function(xmlHttpRequest, status, error)
                {
                    console.error('Ajax 요청 실패:', error);
                    console.error('상태 코드:', xmlHttpRequest.status);
                    console.error('응답 텍스트:', xmlHttpRequest.responseText);
                }
            });
	  	});
 
	});

 	
 	// 함수 1. 돌봄 신청 클릭 시 새 창(genRegDetail.jsp) 열기
    function openDetailWindow(genRegId)
 	{
    	// 두 번째 파라미터 : '_blank' → 새 창 열기
        // 세 번째 파라미터 : 창 옵션 (크기, 스크롤바 등)
        /* window.open('./genRegDetail.jsp?sitterId=' + sitterId, '_blank', 'width=640,height=500'); */
        window.open('genregpossibledetail.action?genRegId=' + genRegId, '_blank', 'width=640,height=500');
    }
  
</script>
</head>
<body>

<!-- parentMainFrame.html을 삽입할 위치 -->
<div id="header-container">
	<%-- <c:import url="./parentMainFrame.html" charEncoding="UTF-8" /> --%>
	<!-- → action 처리로 변경 -->
	<c:import url="/parentheader.action"/>
</div>

<div id="body-container">
	<div id="wrapper-header">
		<div class="main-subject">
			<h1>일반 돌봄 서비스</h1>
		</div>
	</div>
	
	<div id="wrapper-body">
		<!-- (main) 일반 돌봄 1차 필터 -->
		<div class="box-filter">
			<div class="sub-subject">
				<h2>1차 필터</h2>
			</div>
			<div class="sub-body">
			    <form action="gensearchresult.action" id="primary-filter-form" method="post" >
			    	<div class="form-group">
				        <div class="label">돌봄 희망 아이</div>
				        <div class="child-range">
				        	<select name="child_backup_id" id="child-name" required="required">
								<option value="">아이 선택</option>
					    		<c:forEach var="name" items="${listName}">
					            <option value="${name.child_backup_id}" 
					            ${name.child_backup_id == childBackupId ? "selected" : ""}>${name.name}</option>
								</c:forEach>
					    	</select>
					    	
				    	</div>
				    </div>
				    
					<div class="form-group">
				        <div class="label">돌봄 희망 날짜</div>
				        <div class="date-range">
				        	<input type="date" name="start_date" id="date-start" required="required"
				        	value="${dateStart}">
				        	<span>부터</span>
				        	<input type="date" name="end_date" id="date-end" required="required"
				        	value="${dateEnd}">
				        	<span>까지</span>
				    	</div>
				    </div>
				
				    <div class="form-group">
				    	<div class="label">돌봄 희망 시간</div>
				     	<div class="time-range">
				        	<select name="start_time" id="time-start" required="required">
					            <option value="">시작 시간</option>
				        		<c:forEach var="i" begin="8" end="11" step="1">
							    <option value="${i}" ${i == timeStart ? "selected" : ""}>오전 ${i}:00</option>
								</c:forEach>
								<c:forEach var="i" begin="12" end="18" step="1">
							    <option value="${i}" ${i == timeStart ? "selected" : ""}>오후 ${i==12 ? 12 : i-12}:00</option>
								</c:forEach>
							</select>
					      	<span>부터</span>
					      	<select name="end_time" id="time-end" required="required">
					            <option value="">종료 시간</option>
				        		<c:forEach var="i" begin="9" end="11" step="1">
							    <option value="${i}" ${i == timeEnd ? "selected" : ""}>오전 ${i}:00</option>
								</c:forEach>
								<c:forEach var="i" begin="12" end="19" step="1">
							    <option value="${i}" ${i == timeEnd ? "selected" : ""}>오후 ${i==12 ? 12 : i-12}:00</option>
								</c:forEach>
				    		</select>
				        	<span>까지</span>
				        </div>
				        <div class="warning" id="max-time-warning">※일반 돌봄 하루 최대 이용시간은 8시간입니다.</div>
				        <div class="warning" id="min-time-warning">※일반 돌봄은 최소 2시간부터 이용 가능합니다.</div>
				    </div>
				
				    <button type="submit" class="btn btn-large" id="primary-search-btn">시터 찾기</button>
			    </form>
			</div>
		</div>		
	</div>
	
	<div id="wrapper-body">
		
		<!-- (side) 일반 돌봄 2차 필터 -->
		<div class="box-side">
			<div class="sub-subject">
		    	<h2>2차 필터</h2>
		    </div>
		    <div class="sidebar">
		    <form action="" id="secondary-filter-form">
			    <div class="form-group">
			    	<div class="label" id="toggle-grade">시터 등급</div>
			        <div class="checkbox-group" id="checkbox-grade">
			            <label class="checkbox-label">
			                <input type="checkbox" name="grade" value="rookie" checked="checked">신입
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="grade" value="bronze" checked="checked">브론즈
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="grade" value="silver" checked="checked">실버
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="grade" value="gold" checked="checked">골드
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="grade" value="platinum" checked="checked">플래티넘
			            </label>
			        </div>
			    </div>
			    
				<div class="form-group">
					<div class="label" id="toggle-region">근무 지역</div>
					<div class="checkbox-group"  id="checkbox-region">
			            <label class="checkbox-label">
			                <input type="checkbox" name="region" value="1" checked="checked" autocomplete="off">강남구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="2" checked="checked" autocomplete="off">강동구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="3" checked="checked" autocomplete="off">강북구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="4" checked="checked" autocomplete="off">강서구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="5" checked="checked" autocomplete="off">관악구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="6" checked="checked" autocomplete="off">광진구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="7" checked="checked" autocomplete="off">구로구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="8" checked="checked" autocomplete="off">금천구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="9" checked="checked" autocomplete="off">노원구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="10" checked="checked" autocomplete="off">도봉구  
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="11" checked="checked" autocomplete="off">동대문구 
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="12" checked="checked" autocomplete="off">동작구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="13" checked="checked" autocomplete="off">마포구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="14" checked="checked" autocomplete="off">서대문구 
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="15" checked="checked" autocomplete="off">서초구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="16" checked="checked" autocomplete="off">성동구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="17" checked="checked" autocomplete="off">성북구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="18" checked="checked" autocomplete="off">송파구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="19" checked="checked" autocomplete="off">양천구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="20" checked="checked" autocomplete="off">영등포구 
			            </label>                                                                  
			            <label class="checkbox-label">                                            
			                <input type="checkbox" name="region" value="21" checked="checked" autocomplete="off">용산구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="22" checked="checked" autocomplete="off">은평구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="23" checked="checked" autocomplete="off">종로구  
			            </label>                                                                   
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="24" checked="checked" autocomplete="off">중구   
			            </label>                                          
			            <label class="checkbox-label">                                             
			                <input type="checkbox" name="region" value="25" checked="checked" autocomplete="off">중랑구   
			            </label>
			        </div>                                                            
				</div>                                                                          
				<div class="form-group">
					<div class="label" id="toggle-gender">시터 성별</div>
					<div class="checkbox-group" id="checkbox-gender">
			            <label class="checkbox-label">
			                <input type="checkbox" name="gender" value="male" checked="checked">남성
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="gender" value="female" checked="checked">여성
			            </label>
			        </div>
				</div>
				<div class="form-group">
					<div class="label" id="toggle-age">시터 연령대</div>
					<div class="checkbox-group" id="checkbox-age">
			            <label class="checkbox-label">
			                <input type="checkbox" name="age" value="20" checked="checked">20대
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="age" value="30" checked="checked">30대
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="age" value="40" checked="checked">40대
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="age" value="50" checked="checked">50대
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="age" value="60" checked="checked">60대 이상
			            </label>
			        </div>
				</div>
				<div class="form-group">
					<div class="label" id="toggle-cert">시터 보유 자격증</div>
					<div class="checkbox-group" id="checkbox-cert">
			            <label class="checkbox-label">
			                <input type="checkbox" name="cert" value="1" checked="checked">보육 교사 1급 (특수)
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="cert" value="2" checked="checked">보육 교사 1급
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="cert" value="3" checked="checked">보육 교사 2급 (특수)
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="cert" value="4" checked="checked">보육 교사 2급
			            </label>
			            <label class="checkbox-label">
			                <input type="checkbox" name="cert" value="5" checked="checked">특수 교사
			            </label>
			        </div>
				</div>
				<div class="form-group">
					<div class="label" id="toggle-price">전체 돌봄 비용</div>
			        <div class="range-group" id="range-price">
			        	<label class="range-label">
							<input type="range" name="price" min="0" max="1082240" step="50000" value="1340000">
						</label>
						<label class="range-label">
				            <span>0</span>
				            <span id="current-price">0원</span>
				            <span>MAX</span>
			            </label>
			        </div>
				</div>
	
				<button type="button" class="btn" id="secondary-search-btn">필터 적용</button>
			</form>
			</div>
		</div>
		
		<!-- 검색 결과 -->
	    <div class="gen-results" id='resultArea'>
	    	<div class="sub-subject">
	        	<h2>검색 결과 (${countPrimaryGenReg})</h2>
	        </div>
	        <!-- 일반 돌봄 각 등록 건 -->
	       	<!-- <form action="genregdetail.action" method="post" target="_blank"> -->
	        <!-- 
	        listPrimaryGenReg 
	         R.GEN_REG_ID, R.NAME, R.TITLE, R.START_DATE, R.END_DATE, R.START_TIME, R.END_TIME, STATUS
	         -->
	       	<c:forEach var="genReg" items="${listPrimaryGenReg}">
	       	
	       	
		        <div class="box-preview">
		            <div class="sitter-photo">
		                <img src="./images/sit01.jpg" alt="시터 사진">
		            </div>
		            <div class="sitter-info">
		                <div class="sitter-name">${genReg.name }</div>
		                <div class="sitter-details">
		                    <div><img src="" alt="🥉">브론즈 시터</div>		<!-- 대체 텍스트 수정 필요 -->
		                	<div>최근 평점 ⭐4.9 (7건)</div>
		                    <div>전체 평점 ⭐4.76 (123건)</div>
		                	<div>돌봄 등록 일자: 📆2025.03.31.~2025.04.11.</div>
		                    <div>돌봄 등록 시간: ⏰
		                    <c:choose>
							    <c:when test="${genReg.start_date < 12}">
							        오전 ${genReg.start_date}시
							    </c:when>
							    <c:otherwise>
							        오후 ${genReg.start_date == 12 ? 12 : genReg.start_date-12}시
							    </c:otherwise>
							</c:choose></div>
		                </div>
		                <button type="submit" class="btn gen-btn-small"
		                onclick="openDetailWindow(${genReg.gen_reg_id})">돌봄 신청</button>
		            </div>
		        </div>
		    
	       	</c:forEach>
		    
		    <!-- -------------------------------------------------------------------------------------------------- -->
		    
		    
		    	<div class="box-preview">
		            <div class="sitter-photo">
		                <img src="./images/sit01.jpg" alt="시터 사진">
		            </div>
		            <div class="sitter-info">
		                <div class="sitter-name">김탄</div>
		                <div class="sitter-details">
		                    <div><img src="" alt="🥉">브론즈 시터</div>		<!-- 대체 텍스트 수정 필요 -->
		                	<div>최근 평점 ⭐4.9 (7건)</div>
		                    <div>전체 평점 ⭐4.76 (123건)</div>
		                	<div>돌봄 등록 일자: 📆2025.03.31.~2025.04.11.</div>
		                    <div>돌봄 등록 시간: ⏰오전 9시 ~ 오후 2시</div>
		                </div>
		                <button type="submit" class="btn gen-btn-small" onclick="openDetailWindow(1)">돌봄 신청</button>

		            </div>
		        </div>
		        
		        
				<div class="box-preview">
		            <div class="sitter-photo">
		                <img src="./images/sit02.jpg" alt="시터 사진">
		            </div>
		            <div class="sitter-info">
		                <div class="sitter-name">차은상</div>
		                <div class="sitter-details">
		                    <div><img src="" alt="🥈">실버 시터</div>	<!-- 대체 텍스트 수정 필요 -->
		                    <div>최근 평점 ⭐4.3 (3건)</div>
		                    <div>전체 평점 ⭐4.56 (290건)</div>
		                	<div>돌봄 등록 일자: 📆2025.03.31.~2025.04.11.</div>
		                    <div>돌봄 등록 시간: ⏰오전 9시 ~ 오후 2시</div>
		                </div>
		                <button type="submit" class="btn gen-btn-small"  onclick="openDetailWindow(2)">돌봄 신청</button>
		            </div>
		        </div>
		    
		    
		        <div class="box-preview">
		            <div class="sitter-photo">
		                <img src="./images/sit03.jpg" alt="시터 사진">
		            </div>
		            <div class="sitter-info">
		                <div class="sitter-name">최영도</div>
		                <div class="sitter-details">
		                    <div><img src="" alt="🌱">신입 시터</div>	<!-- 대체 텍스트 수정 필요 -->
		                    <div>최근 평점 ⭐4.8 (3건)</div>
		                    <div>전체 평점 ⭐4.5 (3건)</div>
		                	<div>돌봄 등록 일자: 📆2025.03.31.~2025.04.11.</div>
		                    <div>돌봄 등록 시간: ⏰오전 9시 ~ 오후 2시</div>
		                </div>
		                <button type="button" class="btn gen-btn-small" onclick="openDetailWindow(3)">돌봄 신청</button>
		             </div>
		        </div>
		    <!-- </form> -->
	    </div>
		
	</div>
</div>

</body>
</html>