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
<title>adminParDetail.jsp</title>
<link rel="stylesheet" type="text/css" href="css/parDetail.css">
</head>
<body>
	<div class="wrap">
		<header>
			<c:import url="adminHeader.jsp"></c:import>
		</header>

		<div class="container">
			<!-- 사이드바 영역 -->
			<c:import url="memberSidebar.jsp"></c:import>

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
								<input type="text" class="info-input" value="STRG00002" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">이름</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="이도치" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">연락처</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="010-2222-2222" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">우편번호</div>
							<div class="info-cell" style="display: flex;">
								<input type="text" class="info-input" value="940202" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">주소</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="(주소)" readonly>
							</div>
						</div>

						<div class="info-row">
							<div class="info-header">상세주소</div>
							<div class="info-cell">
								<input type="text" class="info-input" value="(상세 주소)" readonly>
							</div>
						</div>
					</div>
				</div>
			
				<!-- 아이 정보 섹션 -->
				<div class="content-header">
					<div class="content-title">아이 회원 상세 정보</div>
				</div>
                <div class="children-container">
                    <!-- 첫 번째 아이 정보 -->
                    <div class="child-info">
                        <div class="info-row">
                            <div class="info-header">이름</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="또또치" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">나이</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="2세" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">성별</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="남" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">키</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="20cm" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">몸무게</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="5kg" readonly>
                            </div>
                        </div>

                        <div class="info-row">
                            <div class="info-header">특이사항</div>
                            <div class="info-cell">
                                <textarea readonly="readonly" placeholder="아토피 병력 있음, 특정 약물에 알레르기 반응 등"></textarea>
                            </div>
                        </div>

                        <div class="category-row">
                            <div class="category-title">보유 지병</div>
                            <div class="category-options">
                                <button class="category-button">천식</button>
                                <button class="category-button">아토피</button>
                                <button class="category-button">소아당뇨병</button>
                            </div>
                        </div>

                        <div class="category-row">
                            <div class="category-title">보유 알레르기</div>
                            <div class="category-options">
                                <button class="category-button">우유 알레르기</button>
                                <button class="category-button">계란 알레르기</button>
                            </div>
                        </div>

                        <div class="category-row">
                            <div class="category-title">보유 장애</div>
                            <div class="category-options">
                                <button class="category-button">언어 발달 지연</button>
                            </div>
                        </div>
                    </div>
                    
                    <!-- 두 번째 아이 정보 -->
                    <div class="child-info">
                        <div class="info-row">
                            <div class="info-header">이름</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="몽글이" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">나이</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="5세" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">성별</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="여" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">키</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="70cm" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">몸무게</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="15kg" readonly>
                            </div>
                        </div>

                        <div class="info-row">
                            <div class="info-header">특이사항</div>
                            <div class="info-cell">
                                <textarea readonly="readonly" placeholder="시끄러움"></textarea>
                            </div>
                        </div>

                        <div class="category-row">
                            <div class="category-title">보유 지병</div>
                            <div class="category-options">
                                <button class="category-button">천식</button>
                                <button class="category-button">아토피</button>
                            </div>
                        </div>

                        <div class="category-row">
                            <div class="category-title">보유 알레르기</div>
                            <div class="category-options">
                                <button class="category-button">먼지 알레르기</button>
                                <button class="category-button">꽃가루 알레르기</button>
                            </div>
                        </div>

                        <div class="category-row">
                            <div class="category-title">보유 장애</div>
                            <div class="category-options">
                                <button class="category-button">자폐</button>
                                <button class="category-button">지적 장애</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="child-info">
                        <div class="info-row">
                            <div class="info-header">이름</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="둘리" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">나이</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="3세" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">성별</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="남" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">키</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="30cm" readonly>
                            </div>
                        </div>
                        <div class="info-row">
                            <div class="info-header">몸무게</div>
                            <div class="info-cell">
                                <input type="text" class="info-input" value="8kg" readonly>
                            </div>
                        </div>

                        <div class="info-row">
                            <div class="info-header">특이사항</div>
                            <div class="info-cell">
                                <textarea readonly="readonly" placeholder="공룡알에서 태어남"></textarea>
                            </div>
                        </div>

                        <div class="category-row">
                            <div class="category-title">보유 지병</div>
                            <div class="category-options">
                                <button class="category-button">없음</button>
                            </div>
                        </div>

                        <div class="category-row">
                            <div class="category-title">보유 알레르기</div>
                            <div class="category-options">
                                <button class="category-button">없음</button>
                            </div>
                        </div>

                        <div class="category-row">
                            <div class="category-title">보유 장애</div>
                            <div class="category-options">
                                <button class="category-button">없음</button>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 하단 버튼 영역 -->
                <div class="bottom-btn">
                    <button class="btn submit-btn">뒤로가기</button>
                </div>
			</main>
		</div>
	</div>
</body>
</html>