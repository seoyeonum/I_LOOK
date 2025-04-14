<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminInfoUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/adminInfo.css">
<style type="text/css">

.error-message { 
	color: red;
    font-size: 12px;
    display: none;
    left: 165px; 
    bottom: 5px; 
}

</style>
<script src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	var IMP_KEY = "8408512230150176";
	var IMP_SECRET = "lxmgUa1bIRm6gVVl6XIjUsemZbE02xWS7BaNdm3iFJzP3teRV4a5fdGz24zIIzaURtWiB3F3m7XRo38L";
	
	function getToken() 
	{
		return $.ajax(
		{
			url: "https://api.iamport.kr/users/getToken",
			method: "POST",
			contentType: "application/json",
			data: JSON.stringify(
			{
				imp_key: IMP_KEY,
				imp_secret: IMP_SECRET
			})
		}).then(res => res.response.access_token);
	}

	function loadBanks(token) 
	{
		$.ajax(
		{
			url: "https://api.iamport.kr/banks",
			method: "GET",
			headers: 
			{
				"Authorization": "Bearer " + token
			},
			success: function(res) 
			{
				const banks = res.response;
				$.each(banks, function(i, bank) 
				{
					$("#bankName").append
					(
						`<option value="${bank.name}">${bank.name}</option>`
					);
				});
		
				// 기존 선택값이 있을 경우 선택되게
				const currentBank = "${adminInfo.bank_name}";
			}
		});
	}	
	
	$(document).ready(function()
	{
		getToken().then(loadBanks);
		// 비밀번호 입력 필드에 이벤트 리스너 추가
		$("#pw").on("input", function() 
		{
			validatePassword();
		});
		
		// 비밀번호 재확인 입력 필드에 이벤트 리스너 추가
		$("#pwConfirm").on("input", function() 
		{
			validatePasswordMatch();
		});
		
		// 수정 버튼 클릭 시 유효성 검사
		$("#submitBtn").click(function()
		{
			// 입력값 유효성 검사
			var password = document.getElementById("pw");
			var pwConfirm = document.getElementById("pwConfirm");
			var accountNumber = document.getElementById("admin_acct_code");
			var isValid = true;
			
			// 비밀번호 검사
			if (password.value.trim() === "") 
			{
				$("#pwError").text("비밀번호를 입력해주세요.");
				$("#pwError").show();
				password.focus();
				return;
			} else if (!validatePassword()) 
			{
				password.focus();
				return;
			}
			
			// 비밀번호 재확인 검사
			if (pwConfirm.value.trim() === "") 
			{
				$("#pwConfirmError").text("비밀번호 재확인을 입력해주세요.");
				$("#pwConfirmError").show();
				pwConfirm.focus();
				return;
			} else if (!validatePasswordMatch()) 
			{
				pwConfirm.focus();
				return;
			}
			
			// 계좌번호 검사
			if (accountNumber.value.trim() === "") 
			{
				$("#admin_acct_code").text("계좌번호를 입력해주세요.");
				$("#admin_acct_code").show();
				accountNumber.focus();
				return;
			} 
			else 
			{
				$("#accountError").hide();
			}
			
			// 모든 검증 통과 시 폼 제출
			document.getElementById("adminUpdateForm").submit();
		});
	});
	
	// 비밀번호 유효성 검사 함수
	function validatePassword() 
	{
		var password = $("#pw").val();
		var pwError = $("#pwError");
		
		// 빈 값인 경우
		if (password.trim() === "") {
			pwError.hide();
			return false;
		}
		
		// 한글 포함 여부 확인
		if (/[ㄱ-ㅎㅏ-ㅣ가-힣]/.test(password)) 
		{
			pwError.text("영문+숫자 6~16자, 한글 입력 불가");
			pwError.show();
			return false;
		}
		
		// 영문소문자+숫자 조합 및 길이 확인
		if (!/^(?=.*[a-z])(?=.*[0-9])[a-z0-9]{6,16}$/.test(password)) 
		{
			pwError.text("영문+숫자 6~16자, 한글 입력 불가");
			pwError.show();
			return false;
		}
		
		// 유효한 비밀번호
		pwError.hide();
		return true;
	}
	
	// 비밀번호 일치 확인 함수
	function validatePasswordMatch() 
	{
		var password = $("#pw").val();
		var confirmPassword = $("#pwConfirm").val();
		var confirmError = $("#pwConfirmError");
		
		// 빈 값인 경우
		if (confirmPassword.trim() === "") 
		{
			confirmError.hide();
			return false;
		}
		
		// 비밀번호 일치 여부 확인
		if (password !== confirmPassword) 
		{
			confirmError.text("비밀번호가 일치하지 않습니다.");
			confirmError.show();
			return false;
		}
		
		// 비밀번호 일치
		confirmError.hide();
		return true;
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
		<c:import url="myPageSidebar.jsp"></c:import>

		<!-- 메인 콘텐츠 영역 -->
		<main class="main-content">
			<div class="content-header">
				<h1 class="content-title">관리자 정보 수정</h1>
			</div>

			<div class="content-body">
				<div class="info-section">
				
					<!-- 관리자 정보 수정 폼 -->
					<form action="/adminInfoUpdate.action" method="post">
						<div class="info-row">
							<div class="info-header">아이디</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${adminInfo.Id }" readonly disabled>
								<input type="hidden" name="id" value="${adminInfo.Id }">
								<input type="hidden" name="admin_reg_id" value="${adminInfo.admin_reg_id}">
							</div>
						</div>
	
						<div class="info-row">
							<div class="info-header">비밀번호</div>
							<div class="info-cell">
								<input type="password" id="pw" name="pw" class="info-input" value="${adminInfo.pw}" required="required">
								<div id="pwError" class="error-message">영문+숫자 6~16자, 한글 입력 불가</div>
							</div>
						</div>
						<div class="info-row">
							<div class="info-header">비밀번호 재확인</div>
							<div class="info-cell">
								<input type="password" id="pwConfirm" class="info-input" value="${adminInfo.pw}" required="required">
								<div id="pwConfirmError" class="error-message">비밀번호가 일치하지 않습니다.</div>
							</div>
						</div>
						<div class="info-row">
							<div class="info-header">은행명</div>
							<div class="info-cell">
							<select id="bankName" name="bank_name" class="info-input" required>
								<option value="">은행을 선택하세요</option>
							</select>
							</div>
						</div>
						<div class="info-row">
							<div class="info-header">계좌번호</div>
							<div class="info-cell">
								<input type="text" id="admin_acct_code" name="admin_acct_code" class="info-input" value="${adminInfo.admin_acct_code }" required="required">
								<div id="accountError" class="error-message">계좌번호를 입력해주세요.</div>
							</div>
						</div>
						
						<div class="bottom-btn">
							<button type="button" class="btn submit-btn" id="submitBtn">수정하기</button>
							<button type="button" class="btn cancel-btn" onclick="location.href='adminInfo.jsp'">취소</button>
						</div>
					</form>
				</div>
			</div>
		</main>
	</div>
</div>

</body>
</html>