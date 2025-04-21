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
<title>gradeUpdateForm.jsp</title>
<link rel="stylesheet" type="text/css" href="css/gradeInsertForm.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
	    // 파일 업로드 버튼 클릭 시 input[type=file] 열기
	    $(".upload-btn").click(function() 
	    {
	        $("#file_path").click();
	    });
	    
	 	// 미리보기
	    $("#file_path").change(function(e) 
	    {
	        if (this.files && this.files[0]) 
	        {
	            var reader = new FileReader();
	            
	            reader.onload = function(e) 
	            {
	                $("#previewImage").attr("src", e.target.result);
	                $("#imagePreview").show(); 
	            }
	            reader.readAsDataURL(this.files[0]);
	            
	        }
	    });
	
	    // 폼 제출 시 유효성 검사
	    $("#submitBtn").click(function()
	    {
	        var error = $("#error");
	        
	        // 유효성 검사 대상들
	        var fields = 
	        [ 
	            {id: "#name", label: "등급 이름을 "},
	            {id: "#min_range", label: "최소 누적 시간을 "},
	            {id: "#max_range", label: "최대 누적 시간을 "},
	            {id: "#daily_max_time", label: "일 최대 근무 시간을 "},
	            {id: "#grade_pay", label: "시급 배수를 "},
	            {id: "#file_path", label: "사진을 ", isFile: true}
	        ];
	        
	        for (var i = 0; i < fields.length; i++)
	        {
	            var field = fields[i];
	            
	            // 파일일 때
	            if (field.isFile)
	            {
	                if ($(field.id)[0].files.length == 0)
	                {
	                    error.text(field.label + " 업로드해주세요.");
	                    error.show();
	                    $(field.id).focus();
	                    return;
	                }
	            }
	            // 입력값이 없다면
	            else
	            {
	                var value = $(field.id).val().trim();
	                if (value == "")
	                {
	                    error.text(field.label + " 입력해주세요.");
	                    error.show();
	                    $(field.id).focus();
	                    return;
	                }
	                
	                // 숫자 유효성 검사
	                if (field.id !== "#name") 
	                {
	                    var regex = (field.id === "#grade_pay") ? /^\d+(\.\d+)?$/ : /^\d+$/;
	                    
	                    if (!regex.test(value)) 
	                    {
	                        error.text(field.label + " 숫자만 입력 가능합니다.");
	                        error.show();
	                        $(field.id).focus();
	                        return;
	                    }
	                }
	            }
	        } // end for 문 
	        
	        // 이상없으면 폼 제출
	        error.hide();
	        $("#gradeForm").submit();
	    });
	});

</script>
</head>
<body>
	<div class="wrap">
		<header>
			<c:import url="adminHeader.jsp"></c:import>
		</header>
		<div class="container">
			<!-- 사이드바 영역 -->
			<c:import url="sidebarService.jsp"></c:import>
			<main class="main-content">
				<div class="content-header">
					<div class="content-title">등급 정보 수정</div>
				</div>

				<!-- form 태그  -->
				<form action="gradeupdate.action" method="post" enctype="multipart/form-data" id="gradeForm">
				
					<div class="content-body">
					
						<!-- 왼쪽 컬럼 - 등급 이미지 업로드 -->
						<div class="left-column">
							<div class="image">
								<div class="image-preview" id="imagePreview">
									<img alt="등급 이미지 미리보기" src="${pageContext.request.contextPath}/${grade.file_path}"  id="previewImage" style="width: 100%; height: 100%;">
								</div>
							</div>
							<div class="intro-section">
								<div class="intro-header">등급 사진 업로드</div>
								<input type="file" name="uploadFile" id="file_path" accept="image/*" style="display: none;">
								<button type="button" class="btn upload-btn" id="upload-btn">업로드</button>
							</div>
						</div>

						<!-- 오른쪽 컬럼 - 입력 정보 -->
						<div class="right-column">
							<div class="info-row">
								<div class="info-header">등급 이름</div>
								<div class="info-cell">
									<input type="text" name="name" id="name" class="info-input" value="${grade.name }">
								</div>
							</div>

							<div class="info-row">
								<div class="info-header">최소 누적 근무 시간</div>
								<div class="info-cell">
									<input type="text" name="min_range" id="min_range" class="info-input" value="${grade.min_range }">
								</div>
							</div>
							
							<div class="info-row">
								<div class="info-header">최대 누적 근무 시간</div>
								<div class="info-cell">
									<input type="text" name="max_range" id="max_range" class="info-input" value="${grade.max_range }">
								</div>
							</div>

							<div class="info-row">
								<div class="info-header">일 최대 근무 시간</div>
								<div class="info-cell">
									<input type="text" name="daily_max_time" id="daily_max_time" class="info-input" value="${grade.daily_max_time }">
								</div>
							</div>

							<div class="info-row">
								<div class="info-header">시급 배수</div>
								<div class="info-cell">
									<input type="text" name="grade_pay" id="grade_pay"class="info-input" value="${grade.grade_pay }">
								</div>
							</div>
							
							<div class="info-row">
								<div class="info-header">마지막 수정일</div>
								<div class="info-cell">
									<input type="text" name="changed_date" id="changed_date"class="info-input" value="${grade.changed_date }" readonly="readonly">
								</div>
							</div>
							
							<div class="info-row">
								<p id="error" style="color:red; display:none;"></p>
							</div>
						</div>
					</div>
			
					<!-- 하단 버튼 영역 -->
					<div class="bottom-btn">
						<button type="button" class="btn submit-btn" id="submitBtn">수정하기</button>
						<button type="button" class="btn cancel-btn" onclick="location.href='<%=cp%>/gradelist.action'">취소</button>
					</div>
				</form> <!-- end form -->
			</main>
		</div>
	</div>
</body>
</html>