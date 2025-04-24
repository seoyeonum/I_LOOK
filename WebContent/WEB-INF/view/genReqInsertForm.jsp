<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>genReqInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/gen-filter.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
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
    	
        
        //=================== 상단 시터 정보 관련 ==================
    	
    	// 1. 토글 처리 - 신청 시터 정보
  		$("#toggle-sitter-req").click(function() {
        	$("#sitter-req-hidden").slideToggle(300);
    	});
    	
  		//=================== 전달 메시지 관련 ==================
  			
  		// 2. 입력 액션 시 글자 수 업데이트
  		$("#msg-input").on('input', function()
  		{
  			textCount();
  		});
  		
  		// 3. 다시 작성 버튼 클릭 시(event) 메시지 입력란만 초기화
    	$("#msg-reset").click(function(event)
    	{
    		// 폼 전체 초기화 방지
    		event.preventDefault();
    		
    		// 메시지 입력란만 초기화
    		$("#msg-input").val('');
    		
    		// 글자 수 업데이트
    		textCount();
    	});
  		
    	//=================== 포인트/결제 관련 ==================
  		
    	// 4. 초기화 버튼 클릭 시(event) 포인트 입력란만 초기화
    	$("#point-reset").click(function()
    	{
    		// 메시지 입력란, 차감액 부분만 초기화
    		$("#point-input").val('');
    		$("#point-spend").text(0);
    		
    		// 최종 비용 업데이트
    		calcPrice();
    		
    	});
    	
    	
    	// 5. 적용 버튼 클릭 시(event) 포인트 차감액 변동
    	$("#point-use").click(function()
    	{
    		// 입력한 포인트 값 가져오기
    		// 『||』: 앞의 값이 없다면 || 뒤의 값 사용
    		var pointInput = parseInt($("#point-input").val()) || 0;
    		var maxPoint = ${point != null ? point : 0};
    		
    		// 유효성 검사
    		
    		if (pointInput < 100 && pointInput > 0)
    		{
    			alert("최소 100원부터 사용 가능합니다.");
    			return;
    		}
    		
    		if (pointInput > maxPoint)
    		{
    			alert("보유 포인트보다 많은 금액을 사용할 수 없습니다.");
    			return;
    		}
    		
    		// 포인트 차감액 변동 (span → val() (X) / .text() (O))
    		$("#point-spend").text(pointInput);
    		
    		// 최종 금액 업데이트
    		calcPrice();
    	});
    	
    	
    	// 6. 결제 진행 버튼 클릭 시 체크박스 확인 후 페이지 이동
    	$("#confirm-payment").click(function()
    	{
    	    // 체크박스 확인
    	    if (!$("#check-payment").is(":checked"))
    	    {
    	        alert("결제 진행 확인을 위해 체크박스 체크 바랍니다.");
    	        return;
    	    }
    	    
    		// 최종 가격을 hidden 필드에 저장 (콤마 제거)
    	    var finalPrice = $("#final-price").text().replace(/,/g, '');	//-- 정규 표현식 이용
    	    $("#hidden-final-price").val(finalPrice);
    	    
    	    // 체크되어 있다면 폼 제출 → genPayInsertForm.jsp
    	    $("form").submit();
    	});
    	
    	
	});
	
 	// 함수 1.실시간 글자 수 카운트 함수
	function textCount()
 	{
		var inputText = $("#msg-input").val().length;
		var maxLength = 160;
		$("#text-count").text(inputText + " / " + maxLength + "자");
	}
	
 	// 함수 2.결제 금액 계산 함수
 	function calcPrice()
 	{
   	    var basePrice = ${totalPrice}; 						// 기본 비용
   	    var pointUsed = parseInt($("#point-spend").text()); // 사용 포인트
   	    var finalPrice = basePrice - pointUsed; 			// 최종 비용
   	    
   	    // 최종 비용 업데이트
   	    // toLocaleString: 화폐 단위에 , 추가
   	    $("#final-price").text(finalPrice.toLocaleString());
   	}
	
	
</script>
</head>
<body>

<div id="header-container">
	<c:import url="/parentheader.action"/>
</div>

<div id="body-container">
	<div id="wrapper-header">
		<div class="main-subject">
			<h1>일반 돌봄 서비스</h1>
		</div>
	</div>
	
	<div id="wrapper-body-req">
		<div class="sub-subject">
			<h2>일반 돌봄 신청/결제</h2>
		</div>
		
		<div class="sub-body-form">
			<form action="genpayinsertform.action" method="post">
			
				<!-- 1. 신청하는 시터님 관련 정보 -->
				<!--
					- 이름, 성별, 등급, 평점만 남기고 내용 접을(숨길) 수 있게 하자
					- 시터 사진도 보여 주는 게 나을지?
				-->
				<div class="box-req">
					<div class="label">돌봄 희망 시터</div>
		            <div class="gen-info">
		            	<div class="form-group" id="toggle-sitter-req">
			                <div class="sitter-name">${genDetail.name}&nbsp;
			                	<c:choose>
								<c:when test="${genDetail.gender == '남'}">
									<span class="badge male">${genDetail.gender}</span>
								</c:when>
								<c:when test="${genDetail.gender == '여'}">
									<span class="badge female">${genDetail.gender}</span>
								</c:when>
								<c:otherwise>
									1=0 <!-- 항상 거짓. 즉, 쿼리 수행 X -->
								</c:otherwise>
								</c:choose>
			                </div>
			                <div class="sitter-details">
			                    <div class="sitter-grade">
			                    	<span class="sitter-grade-img">
				             			<img src="<c:url value='/${genDetail.grade_file_path}' />" 
				             			width="20" height="20" alt="시터 등급 이미지">
				             		</span>
				             		&nbsp;${genDetail.grade} 시터
				             	</div>
			                	<div>최근 평점 ⭐${genDetail.recent_avg_rating } (${genDetail.recent_review_count }건)</div>
            					<div>전체 평점 ⭐${genDetail.avg_rating } (${genDetail.review_count }건)</div>
			            	</div>
		            	</div>
		            	<!-- 아래는 접힐 내용 -->
		            	<div class="form-group" id="sitter-req-hidden">
			            	<hr><br>
			            	<div class="sitter-details">
			                    <fmt:parseDate var="startDateParsed" value="${genDetail.start_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
								<fmt:parseDate var="endDateParsed" value="${genDetail.end_date}" pattern="yyyy-MM-dd HH:mm:ss"/>
								<div>돌봄 등록 일자: 📆
									<fmt:formatDate value="${startDateParsed}" pattern="yyyy.MM.dd."/>
								~
								<fmt:formatDate value="${endDateParsed}" pattern="yyyy.MM.dd."/>
								</div>
								
			                	<div>돌봄 등록 시간: ⏰
					            <c:choose>
								<c:when test="${genDetail.start_time < 12}">
									오전 ${genDetail.start_time}시
								</c:when>
								<c:otherwise>
									오후 ${genDetail.start_time == 12 ? 12 : genDetail.start_time-12}시
								</c:otherwise>
								</c:choose>
								~
								<c:choose>
								<c:when test="${genDetail.end_time < 12}">
									오전 ${genDetail.end_time}시
								</c:when>
								<c:otherwise>
								    오후 ${genDetail.end_time == 12 ? 12 : genDetail.end_time-12}시
								</c:otherwise>
								</c:choose>
								</div>
			
			                	<c:if test="${not empty preferedRegion}">
			                    <div>지역:&nbsp;
			                    <c:forEach var="pr" items="${preferedRegion}">
			                    	<span class="badge">${pr}</span>
					            </c:forEach>
			                    </div>
			                    </c:if>
			                    
			                    <c:if test="${not empty preferedAge}">
			               		<div>자신있는 돌봄 연령대:&nbsp;
			               		<c:forEach var="pa" items="${preferedAge}">
			                    	<span class="badge">${pa}</span>
					            </c:forEach>
			                    </div>
			                    </c:if>
			                    
			                    <c:if test="${not empty listSitCert}">
			               		<div>보유 자격:&nbsp;
			               		<c:forEach var="cert" items="${listSitCert}">
			                    	<span class="badge">${cert}</span>
					            </c:forEach>
			                    </div>
					            </c:if>
			                    	
			                    <div>시터님의 한 마디: ${genDetail.introduction}</div>
			                	<!-- <div>마지막 근무일: 2025.03.14.</div> -->
			            	</div>
			            </div>
		            	<!-- 여기까지 접혀 들어가도록 -->
		            	
		   			 </div>
		        </div>
			
				
				<!-- 2. 일반 돌봄 등록하려는 아이 / 날짜 / 시간 정보 -->
				<!--
					- 해당 페이지에서 부모가 확인하는 정보
					  : 본인 아이디 및 이름, 도로명 주소, 상세 주소*
					    아이 이름, 연령, 성별, 알레르기, 키*, 몸무게*, 혈액형*, 특이사항*
				
					  * 표시된 정보는 일반 돌봄 예약 확정 이후 시터님이 열람 가능합니다. 
				-->
				
				<div class="box-req">
					<div class="label">돌봄 희망 아이</div>
		            <div class="gen-info">
		            	<div class="form-group">
			                <div class="child-name">${childInfo.name}&nbsp;
			                	<c:choose>
								<c:when test="${childInfo.gender == '남'}">
									<span class="badge male">${childInfo.gender}</span>
								</c:when>
								<c:when test="${childInfo.gender == '여'}">
									<span class="badge female">${childInfo.gender}</span>
								</c:when>
								<c:otherwise>
									1=0 <!-- 항상 거짓. 즉, 쿼리 수행 X -->
								</c:otherwise>
								</c:choose>
			                </div>
			                <div class="gen-details">
			                    <fmt:parseDate var="startDateParsed" value="${dateStart}" pattern="yyyy-MM-dd"/>
								<fmt:parseDate var="endDateParsed" value="${dateEnd}" pattern="yyyy-MM-dd"/>
								<div>돌봄 희망 일자: 📆
									<fmt:formatDate value="${startDateParsed}" pattern="yyyy.MM.dd."/>
								~
								<fmt:formatDate value="${endDateParsed}" pattern="yyyy.MM.dd."/>
								</div>
								
			                	<div>돌봄 희망 시간: ⏰
					            <c:choose>
								<c:when test="${timeStart < 12}">
									오전 ${timeStart}시
								</c:when>
								<c:otherwise>
									오후 ${timeStart == 12 ? 12 : timeStart-12}시
								</c:otherwise>
								</c:choose>
								~
								<c:choose>
								<c:when test="${timeEnd < 12}">
									오전 ${timeEnd}시
								</c:when>
								<c:otherwise>
								    오후 ${timeEnd == 12 ? 12 : timeEnd-12}시
								</c:otherwise>
								</c:choose>
								</div>
								
			                	<div>돌봄 장소: ${childInfo.road_addr}, ${childInfo.detailed_addr }</div>
			                	<div>아이 연령: 만&nbsp;${childInfo.age }&nbsp;세</div>
		                    </div>
		                    <div class="gen-details child-has">
		                    	<div>장애 및 지병, 알레르기:</div>
		                    	<div>
		                    		<ul>
		                    		<c:forEach var="medical" items="${listMedical}">
		                    			<li>${medical }</li>
		                    		</c:forEach>
		                    		</ul>
		                    	</div>
		                    </div>
		                    <div class="gen-details">
		                    	<div><span class="star">*</span>신장(cm): ${childInfo.height != null ? childInfo.height : '(미입력)'}</div>
		                    	<div><span class="star">*</span>몸무게(kg): ${childInfo.weight != null ? childInfo.weight : '(미입력)'}</div>
		                    	<div><span class="star">*</span>혈액형: ${childInfo.blood_type != null ? childInfo.blood_type : '(미입력)'}</div>
		                    	<div><span class="star">*</span>기타 특이사항: ${childInfo.special_notes != null ? childInfo.special_notes : '(미입력)'}</div>
		                    </div>
		                    <br>
		                    <div class="gen-details">
			                    <div><span class="star">*표시된 정보는 일반 돌봄 예약 확정 이후 시터님이 열람 가능합니다.</span></div>
			                </div>  
			            </div>
		            	
		   			 </div>
		        </div>
				
				<!-- 3. 시터님께 남길 한 마디 -->
				<!-- 
					- 일반 돌봄 관련 시터에게 전달되는 메시지
						"*부적절한 메시지 포함 시 관리자에 의해 일반 돌봄 신청이 취소될 수 있습니다." 
					- <input type="text" /> 로 데이터 입력받기
				-->
				<div class="box-req">
					<div class="label">돌봄 특이 사항</div>
		            <div class="gen-info">
		            	<div class="form-group">
			                <div class="name">전달 메시지</div>
			                <div class="gen-details">
			                    <div>
			                    	<input type="text" id="msg-input" name=message maxlength="160"
			                    	placeholder="(시터님에게 전달하실 말씀을 적어주세요.)"/>	<!-- 현재 ERD 상 varchar2(500)이라 160자 정도 입력 가능.. -->
				                    <button type="button" id="msg-reset" class="btn gen-btn-small" >다시 작성</button>
			                    </div>
			                </div>
			                <div class="gen-details">
			                    <div>
                                    <span id="text-count">0 / 160자</span>
                                    <span class="star">&nbsp;*최대 160자까지 작성 가능합니다.</span>
                                </div>
			                </div>
			            </div>
		            	
		   			 </div>
		        </div>
				
				
				<!-- 4. 결제 정보 -->
				<!-- 
					- 총 신청하는 시간과 등급에 따라 산출된 결제 정보 표시
					- 포인트 적용 가능
					- 결제 진행 전 확인하는 마지막 단계
				
					- 결제 진행 여부 체크 진행 후 API로 결제 진행
				-->
				<div class="box-req">
					<div class="label">결제 예정 금액</div>
		            <div class="gen-info">
		            	<div class="form-group">
			                <div class="name">결제 비용</div>
			                <div class="gen-details">
			                	<div>1일 돌봄 비용: <fmt:formatNumber value="${price}" type="number" groupingUsed="true" /> (원)</div>
			                	<div>총 돌봄 시간:
			                		<fmt:formatNumber value="${careDays}" type="number" groupingUsed="true" />
			                		×
			                		<fmt:formatNumber value="${careHours}" type="number" groupingUsed="true" />
			                		=
			                		<fmt:formatNumber value="${careDays * careHours}" type="number" groupingUsed="true" /> (시간)
			                	</div>
			                	<div>총 지불 비용:
				                	<fmt:formatNumber value="${price}" type="number" groupingUsed="true" />
				                	×
				                	<fmt:formatNumber value="${careDays}" type="number" groupingUsed="true" />
				                	×
				                	<fmt:formatNumber value="${careHours}" type="number" groupingUsed="true" />
				                	=
				                	<fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" /> (원)
				                </div>
			                </div>
		           		</div>
		            	<div class="form-group">
			                <div class="name">포인트 사용</div>
			                <div class="gen-details">
		                	<div>현재 보유 포인트: <fmt:formatNumber value="${empty point ? 0 : point}" type="number" groupingUsed="true" />원</div>
		                	<div class="row-items">사용할 포인트: 
		                    	<input type="text" id="point-input" name="point"
		                    	 min="100" max="${point}" value="0" placeholder="(사용할 포인트)"/>원
		                    	<button type="button" id="point-reset" class="btn gen-btn-small" >취소</button>
		                    	<button type="button" id="point-use" class="btn gen-btn-small">적용</button>
		                    </div>
		                </div>
	                    <div class="gen-details">
		                    <div><span class="star">*최소 100원부터 사용 가능합니다.</span></div>
		                </div>
		            </div>
		            <div class="form-group">
		                <div class="name">결제 예정 금액</div>
		                <div class="gen-details">
		                	<div><fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" />
		                	 -
		                	<span id="point-spend">0</span>
		                	 = 
		                	<span id="final-price"><fmt:formatNumber value="${totalPrice}" type="number" groupingUsed="true" /></span>원</div>
		                	<input type="hidden" id="hidden-final-price" name="finalPrice" value="" />
		                </div>
		            </div>
	   			</div>
	        </div>
		        
		        <!-- 5. 결제 정보 확인 -->
		        <div class="box-req">
		        	<div class="label">결제 정보 확인</div>
		            <div class="form-group gen-info">
		                <label class="row-items">
		                	<input type="checkbox" id="check-payment">
		                	<span>위 내용으로 결제를 진행합니다.</span>
		                </label>
			            <button type="button" id="confirm-payment" class="btn gen-btn-small">결제 진행</button>
			       </div>
		        </div>
		    </form>
		</div>
	</div>
</div>

</body>
</html>