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
<title>genReqInsertForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gen-filter.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	 // 페이지가 로드되면
    $(document).ready(function()
    {
    	// 헤더가 로드된 후 버튼 클래스 변경
        // menuBtn 와 presentPage를 클래스로 가지는 엘리먼트에서 presentPage 클래스 제거
        var firstButton = document.querySelector('.menuBtn.presentPage');
        if (firstButton)
        {
            firstButton.classList.remove('presentPage');
        }
        
        // menuBtn 을 클래스로 가지는 엘리먼트 중
        var buttons = document.querySelectorAll('.menuBtn');
        if (buttons.length >= 2)
        {
        	// 0번째 엘리먼트에 presentPage 클래스 추가 (0부터 시작)
            buttons[0].classList.add('presentPage');
        }
        
        //---------------------------------------------
    	
    	// 1. 토글 처리 - 신청 시터 정보
  		$("#toggle-sitter-req").click(function() {
        	$("#sitter-req-hidden").slideToggle(300);
    	});
    	
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

<!-- parentMainFrame.html을 삽입할 위치 -->
<div id="header-container">
	<c:import url="./parentMainFrame.html" charEncoding="UTF-8" />
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
			<form action="./genPayResult.jsp">
			
				<!-- 1. 신청하는 시터님 관련 정보 -->
				<!--
					- 이름, 성별, 등급, 평점만 남기고 내용 접을(숨길) 수 있게 하자
					- 시터 사진도 보여 주는 게 나을지?
				-->
				<div class="box-req">
					<div class="label">돌봄 희망 시터</div>
		            <div class="gen-info">
		            	<div class="form-group" id="toggle-sitter-req">
			                <div class="sitter-name">김탄 시터&nbsp;<span class="badge male">남</span> </div>
			                <div class="sitter-details">
			                    <div><img src="" alt="🥉">브론즈 시터</div>	<!-- 대체 텍스트 수정 필요 -->
			                	<div>최근 평점: ⭐4.9 (7건)</div>
			                    <div>전체 평점: ⭐4.76 (123건)</div>
			            	</div>
		            	</div>
		            	<!-- 아래는 접힐 내용 -->
		            	<div class="form-group" id="sitter-req-hidden">
			            	<hr><br>
			            	<div class="sitter-details">
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
			                	<div>1일 돌봄 비용: 12,600 (원)</div>
			                	<div>총 지불 비용: 25,200 (원)</div>
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
			                	<div>25,200 - <span id="point-spend">0</span> = <span id="final-price">25,200</span></div>		                	
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