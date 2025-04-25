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
<title>adminParDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/parDetail.css">
<script type="text/javascript" src="https://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		// 부모 주민등록번호
		var parSsnFirst = "${parent.ssn_first}";
	    var parSsnSecond = "${parent.ssn_second}";
	   	
	    // 뒷자리 1자리만 보여주고 나머지 마스킹
	    var parMaskedSecond = parSsnSecond.substring(0, 1) + "*".repeat(parSsnSecond.length - 1);
	
	    document.getElementById("parSsn").value = parSsnFirst + "-" + parMaskedSecond;
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
			<c:import url="sidebarMember.jsp"></c:import>

			<main class="main-content">
				<!-- 부모 정보 섹션 -->
				<div class="content-header">
					<div class="content-title">부모 회원 상세 정보</div>
				</div>
				
				<div class="parent-container">
					<div class="parent-info">
						<div class="info-row">
							<div class="info-header">부모 코드</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${parent.par_backup_id }" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">이름</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${parent.name }" readonly>
							</div>
						</div>
						
						<div class="info-row">
							<div class="info-header">주민등록번호</div>
							<div class="info-cell">
								<input type="text" class="info-input" id="parSsn" value="" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">연락처</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${parent.tel }" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">우편번호</div>
							<div class="info-cell" style="display: flex;">
								<input type="text" class="info-input" value="${parent.zip_code }" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">주소</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${parent.road_addr }" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">상세주소</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="${parent.detailed_addr }" readonly>
							</div>
						</div>
					</div>
				</div>
			
				<c:if test="${not empty childList}">
				<!-- 아이 정보 섹션 -->
				<div class="content-header">
					<div class="content-title child-title">아이 상세 정보</div>
				</div>
                <div class="children-container">
                    <!-- 아이 정보 -->
                    <c:forEach var="child" items="${childList }">
	                    <div class="child-info">
	                        <div class="info-row">
	                            <div class="info-header">아이 코드</div>
	                            <div class="info-cell">
	                                <input type="text" class="info-input" value="${child.child_backup_id }" readonly>
	                            </div>
	                        </div>
	                        <div class="info-row">
	                            <div class="info-header">이름</div>
	                            <div class="info-cell">
	                                <input type="text" class="info-input" value="${child.name }" readonly>
	                            </div>
	                        </div>
	                        
	                        <div class="info-row">
	                            <div class="info-header">주민등록번호</div>
	                            <div class="info-cell">
			                        <c:set var="ssnFirst" value="${child.ssn_first}" />
									<c:set var="ssnSecond" value="${child.ssn_second}" />
									<c:set var="maskedSecond" value="${fn:substring(ssnSecond, 0, 1)}****" />
	                                <input type="text" class="info-input" value="${ssnFirst}-${maskedSecond}" readonly>
	                            </div>
	                        </div>
	                        <div class="info-row">
	                            <div class="info-header">나이</div>
	                            <div class="info-cell">
	                                <input type="text" class="info-input" value="${child.age }" readonly>
	                            </div>
	                        </div>
	                        
	                        <div class="info-row">
	                            <div class="info-header">성별</div>
	                            <div class="info-cell">
	                                <input type="text" class="info-input" value="${child.gender }" readonly>
	                            </div>
	                        </div>
	                        
	                        <div class="info-row">
	                            <div class="info-header">키</div>
	                            <div class="info-cell">
	                                <input type="text" class="info-input" value="${child.height }" readonly>
	                            </div>
	                        </div>
	                        
	                        <div class="info-row">
	                            <div class="info-header">몸무게</div>
	                            <div class="info-cell">
	                                <input type="text" class="info-input" value="${child.weight }" readonly>
	                            </div>
	                        </div>
	                        
	                        <div class="info-row">
	                            <div class="info-header">혈액형</div>
	                            <div class="info-cell">
	                                <input type="text" class="info-input" value="${child.blood_type }" readonly>
	                            </div>
	                        </div>
	
	                        <div class="info-row">
	                            <div class="info-header">특이사항</div>
	                            <div class="info-cell">
	                                <textarea readonly="readonly">${child.special_notes }</textarea>
	                            </div>
	                        </div>
	                   
                    
							<!-- 지병 -->
					        <div class="category-row">
					            <div class="category-title">보유 지병</div>
					            <div class="category-options">
					                <c:choose>
					                    <c:when test="${not empty child.medicalList}">
					                        <c:forEach var="m" items="${child.medicalList}">
					                            <button class="category-button">${m.type}</button>
					                        </c:forEach>
					                    </c:when>
					                    <c:otherwise>
					                        <span class="no-info">없음</span>
					                    </c:otherwise>
					                </c:choose>
					            </div>
					        </div>
					
					        <!-- 알레르기 -->
					        <div class="category-row">
					            <div class="category-title">보유 알레르기</div>
					            <div class="category-options">
					                <c:choose>
					                    <c:when test="${not empty child.allergyList}">
					                        <c:forEach var="a" items="${child.allergyList}">
					                            <button class="category-button">${a.type}</button>
					                        </c:forEach>
					                    </c:when>
					                    <c:otherwise>
					                        <span class="no-info">없음</span>
					                    </c:otherwise>
					                </c:choose>
					            </div>
					        </div>
					
					        <!-- 장애 -->
					        <div class="category-row">
					            <div class="category-title">보유 장애</div>
					            <div class="category-options">
					                <c:choose>
					                    <c:when test="${not empty child.disabilityList}">
					                        <c:forEach var="d" items="${child.disabilityList}">
					                            <button class="category-button">${d.type}</button>
					                        </c:forEach>
					                    </c:when>
					                    <c:otherwise>
					                        <span class="no-info">없음</span>
					                    </c:otherwise>
					                </c:choose>
					            </div>
					        </div>
					    </div>
				    </c:forEach>
                </div>
                </c:if>
                <!-- 하단 버튼 영역 -->
                <div class="bottom-btn">
                    <button class="btn cancel-btn" onclick="location.href='<%=cp%>/adminparlist.action'">뒤로가기</button>
                </div>
			</main>
		</div>
	</div>
</body>
</html>