<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
	
	int point = 600;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>emgReqInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gen-filter.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	///이 페이지 로드 시,
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

	// 각 기능 - jQuery로 처리
    // 페이지가 로드되면
    $(document).ready(function()
    {
    	// 아이 정보는 따로 토글 처리 X
    	/* 
    	// 1. 토글 처리 - 신청 시터 정보
  		$("#toggle-sitter-req").click(function() {
        	$("#sitter-req-hidden").slideToggle(300);
    	});
    	 */
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
  		
    	// 4. 초기화 버튼 클릭 시(event) 포인트 입력란만 초기화
    	$("#point-reset").click(function()
    	{
    		// 메시지 입력란, 차감액 부분만 초기화
    		$("#point-input").val('');
    		$("#point-spend").text(0);
    		
    		// 최종 비용 업데이트
    		updateFinalPrice();
    		
    	});
    	
    	
    	// 5. 적용 버튼 클릭 시(event) 포인트 차감액 변동
    	$("#point-use").click(function()
    	{
    		// 입력한 포인트 값 가져오기
    		// 『||』: 앞의 값이 없다면 || 뒤의 값 사용
    		var pointInput = parseInt($("#point-input").val()) || 0;
    		var maxPoint = <%= point %>;
    		
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
    		updateFinalPrice();
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
    	    
    	    // 체크되어 있다면 폼 제출 → genPayInsertForm.jsp
    	    $("form").submit();
    	});
    	
    	
	});
	
 	// 실시간 글자 수 카운트 함수
	function textCount()
 	{
		var inputText = $("#msg-input").val().length;
		var maxLength = 160;
		$("#text-count").text(inputText + " / " + maxLength + "자");
	}
	
 	// 결제 금액 계산 함수
 	function calcPrice()
 	{
   	    var basePrice = 25200; 								// 기본 비용
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
	<c:import url="/parentheader.action" />
</div>

<div id="body-container">
	<div id="wrapper-header">
		<div class="main-subject">
			<h1>긴급 돌봄 서비스</h1>
		</div>
	</div>
	
	<div id="wrapper-body-req">
		<div class="sub-subject">
			<h2>긴급 돌봄 요청</h2>
		</div>
		
		<div class="sub-body-form">
			<form action="./emgRegResult.jsp">
			
				<!-- 3. 돌봄 요청 정보 -->
			    <div class="box-req"> 	
			    	<div class="label">돌봄 요청 정보</div>
				    <div class="emg-info-normal">
				    	<div class="form-group">
			                <div class="child-name">김충식&nbsp;<span class="badge male">남</span> </div>
			                <div class="gen-details">
			                    <div>돌봄 희망 일자: 📆2025.04.03.~2025.04.03.</div>
			                	<div>돌봄 희망 시간: ⏰오전 8시 ~ 오전 10시</div>
			                	<div>돌봄 장소: 종로구 사직로 161, 101동 1392호</div>
			                	<div>아이 연령: 만 4 세</div>
		                    </div>
		                    <div class="gen-details child-has">
		                    	<div>장애 및 지병, 알레르기:</div>
		                    	<div>
		                    		<ul>
		                    			<li>꽃가루 알레르기</li>
		                    			<li>호두 알레르기</li>
		                    		</ul>
		                    	</div>
		                    </div>
		                    <div class="gen-details">
		                    	<div><span class="star">*</span>신장: (미입력)</div>
		                   		<div><span class="star">*</span>몸무게: (미입력)</div>
		                    	<div><span class="star">*</span>혈액형: A</div>
		                    	<div><span class="star">*</span>기타 특이사항: 아이가 낯가림이 조금 있습니다.</div>
		                    </div>
		                    <br>
		                    <div class="gen-details">
			                    <div><span class="star">*표시된 정보는 일반 돌봄 예약 확정 이후 시터님이 열람 가능합니다.</span></div>
			                </div>  
			            </div>
		            	
		   			 </div>
		        </div>
		        
		        <!-- 4. 시터님께 남길 한 마디 -->
				<!-- 
					- 일반 돌봄 관련 시터에게 전달되는 메시지
						"*부적절한 메시지 포함 시 관리자에 의해 일반 돌봄 신청이 취소될 수 있습니다." 
					- <input type="text" /> 로 데이터 입력받기
				-->
				<div class="box-req">
					<div class="label">돌봄 특이 사항</div>
		            <div class="emg-info">
		            	<div class="form-group">
			                <div class="name">전달 메시지</div>
			                <div class="gen-details">
			                    <div>
			                    	<input type="text" id="msg-input" maxlength="160"
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
				
				
				<!-- 5. 결제 정보 -->
				<!-- 
					- 총 신청하는 시간과 등급에 따라 산출된 결제 정보 표시
					- 포인트 적용 가능
					- 결제 진행 전 확인하는 마지막 단계
				
					- 결제 진행 여부 체크 진행 후 API로 결제 진행
				-->
				<div class="box-req">
					<div class="label">결제 예정 금액</div>
		            <div class="emg-info">
		            	<div class="form-group">
			                <div class="name">결제 비용</div>
			                <div class="gen-details">
			                	<div>1일 돌봄 비용: 47,250 (원)</div>
			                	<div>총 지불 비용: 94,500 (원)</div>
			                </div>
			            </div>
			            <div class="form-group">
			                <div class="name">포인트 사용</div>
			                <div class="gen-details">
			                	<div>현재 보유 포인트: <%= point %>원</div>
			                	<div class="row-items">사용할 포인트: 
			                    	<input type="text" id="point-input" min="100" max="<%= point %>" placeholder="(사용할 포인트)"/>원
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
			                	<div>94,500 - <span id="point-spend">0</span> = <span id="final-price">94,500</span></div>		                	
			                </div>
			            </div>
		   			</div>
		        </div>
		        
		        <!-- 6. 결제 정보 확인 -->
		        <div class="box-req">
		        	<div class="label">결제 정보 확인</div>
		            <div class="form-group emg-info">
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