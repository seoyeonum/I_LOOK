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
	$(document).ready(function()
	{
		// 은행명 불러오기
		$.ajax(
		{
			url : "https://api.portone.io/banks",
			method : "GET",
			success : function(response)
			{
				let banks = response.items;

				$.each(banks, function(index, bank)
				{
					$("#bank_name").append(
						$("<option>").val(bank.name.ko).text(bank.name.ko) 
					);
				});

				// 기존에 등록되어 있던 은행명 선택되게
				var selectedBank = "${admin.bank_name}";
				if (selectedBank)
				{
					$("#bank_name").val(selectedBank);
				}
			},
			error : function(error)
			{
				console.error("은행 리스트 가져오기 실패", error);
			}
		});

		// 비밀번호 입력 칸에 유효성 검사 추가
		$("#pw").on("input", function()
		{
			validatePassword();
		});

		$("#pwConfirm").on("input", function()
		{
			validatePasswordMatch();
		});

		$("#admin_acct_code").on("input", function()
		{
			vaildateAccountNumber();
		})

		// 수정 버튼 클릭 시 유효성 검사
		$("#submitBtn").click(function()
		{
			var password = $("#pw").val().trim();
			var pwConfirm = $("#pwConfirm").val().trim();
			var accountNumber = $("#admin_acct_code").val().trim();
			var bankName = $("#bank_name").val().trim();

			// 비밀번호 검사
			if (password == "")
			{
				$("#pwError").text("비밀번호를 입력해주세요.");
				$("#pwError").show();
				$("#pw").focus();
				return;
			} else if (!validatePassword())
			{
				$("#pw").focus();
				return;
			}

			// 비밀번호 재확인 검사
			if (pwConfirm == "")
			{
				$("#pwConfirmError").text("비밀번호 재확인을 입력해주세요.");
				$("#pwConfirmError").show();
				$("#pwConfirm").focus();
				return;
			} else if (!validatePasswordMatch())
			{
				$("#pwConfirm").focus();
				return;
			}
			// 은행명 검사
			if(bankName == "")
			{
				$("#bankNameError").text("은행명을 입력해주세요.");
				$("#bankNameError").show();
				$("#bank_name").focus();
				return;
			}
			else
			{
				$("#bankNameError").hide();
			}

			// 계좌번호 검사
			if (accountNumber == "")
			{
				$("#accountError").text("계좌번호를 입력해주세요.");
				$("#accountError").show();
				$("#admin_acct_code").focus();
				return;
			} 
			else
			{
				$("#accountError").hide();
			}
			
			// 유효성 검사 통과시 폼 제출
			$("#adminUpdateForm").submit();
		});
	});

	// 비밀번호 유효성 검사 함수
	function validatePassword()
	{
		var password = $("#pw").val();
		var pwError = $("#pwError");

		// 빈 값인 경우
		if (password.trim() == "")
		{
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
		if (confirmPassword.trim() == "")
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

	// 계좌번호 유효성 검사 함수
	function vaildateAccountNumber()
	{
		var accountNumber = $("#admin_acct_code").val();
		var accountError = $("#accountError");

		if (accountNumber.trim() == "")
		{
			accountError.hide();
			return false;
		}

		if (!/^\d{10,}$/.test(accountNumber))
		{
			accountError.text("10자리 이상 입력해야 합니다.");
			accountError.show();
			return false;
		} else
		{
			accountError.hide();
		}
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
			<c:import url="sidebarMypage.jsp"></c:import>

			<!-- 메인 콘텐츠 영역 -->
			<main class="main-content">
				<div class="content-header">
					<h1 class="content-title">관리자 정보 수정</h1>
				</div>

				<div class="content-body">
					<div class="info-section">

						<!-- 관리자 정보 수정 폼 -->
						<form action="admininfoupdate.action" id="adminUpdateForm"
							method="post">
							<input type="hidden" name="admin_reg_id"
								value="${admin.admin_reg_id}">

							<div class="info-row">
								<div class="info-header">아이디</div>
								<div class="info-cell">
									<input type="text" name="id" class="info-input"
										value="${admin.id}" style="background-color: #E2E2E2;"
										readonly disabled>
								</div>
							</div>

							<div class="info-row">
								<div class="info-header">비밀번호</div>
								<div class="info-cell">
									<input type="password" id="pw" name="pw" class="info-input"
										value="${admin.pw}" required="required">
									<div id="pwError" class="error-message">영문+숫자 6~16자, 한글
										입력 불가</div>
								</div>
							</div>
							<div class="info-row">
								<div class="info-header">비밀번호 재확인</div>
								<div class="info-cell">
									<input type="password" id="pwConfirm" name="pwConfirm"
										class="info-input" value="${admin.pw}" required="required">
									<div id="pwConfirmError" class="error-message">비밀번호가 일치하지
										않습니다.</div>
								</div>
							</div>
							<div class="info-row">
								<div class="info-header">은행명</div>
								<div class="info-cell">
									<select id="bank_name" name="bank_name" class="info-input" required="required">
									</select>
									<div id="bankNameError" class="error-message">은행명을 선택해주세요.</div>
								</div>
							</div>
							<div class="info-row">
								<div class="info-header">계좌번호</div>
								<div class="info-cell">
									<input type="text" id="admin_acct_code" name="admin_acct_code"
										class="info-input" value="${admin.admin_acct_code}"
										required="required">
									<div id="accountError" class="error-message">계좌번호를 입력해주세요.</div>
								</div>
							</div>

							<div class="bottom-btn">
								<button type="button" class="btn submit-btn" id="submitBtn">수정하기</button>
								<button type="button" class="btn cancel-btn"
									onclick="location.href='admininfo.action'">취소</button>
							</div>
						</form>
					</div>
				</div>
			</main>
		</div>
	</div>

</body>
</html>