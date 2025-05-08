<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
String cp = request.getContextPath();

// 임의 데이터 설정
pageContext.setAttribute("monthLabels", "['1월','2월','3월','4월','5월','6월']");
pageContext.setAttribute("generalData", "[80, 90, 110, 140, 120, 160]");
pageContext.setAttribute("emergencyData", "[40, 50, 70, 90, 70, 90]");

// 카드 데이터
pageContext.setAttribute("memberRequestCount", 23);
pageContext.setAttribute("todayGeneralCount", 15);
pageContext.setAttribute("todayEmergencyCount", 8);
pageContext.setAttribute("monthlyRevenue", "3,250,000");

// 시터 등록 상태 데이터
pageContext.setAttribute("approvedSitters", 65);
pageContext.setAttribute("pendingSitters", 35);

// 시터/부모 월별 회원가입 비율 데이터 추가
pageContext.setAttribute("sitterSignups", 40);
pageContext.setAttribute("parentSignups", 60);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminMain.jsp</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<style type="text/css">
* {
	box-sizing: border-box;
	margin: 0;
	padding: 0;
}

.wrap {
	width: 100%;
	display: flex;
	flex-direction: column;
	align-items: center;
}

.container {
	width: 90%;
	max-width: 1200px;
	display: flex;
	flex-direction: column;
	gap: 20px;
	margin: 30px 0;
}

/* 인포그래픽 타일 스타일 */
.stats-container {
	display: grid;
	grid-template-columns: repeat(4, 1fr);
	gap: 20px;
	width: 100%;
	margin-bottom: 20px;
}

.stat-card {
	background: white;
	border-radius: 10px;
	padding: 20px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	position: relative;
	overflow: hidden;
}

.stat-card:before {
	content: '';
	position: absolute;
	top: 0;
	left: 0;
	height: 4px;
	width: 100%;
	background: linear-gradient(to right, #3498db, #1abc9c);
}

.stat-icon {
	position: absolute;
	top: 15px;
	right: 15px;
	font-size: 24px;
	color: rgba(52, 152, 219, 0.2);
}

.stat-title {
	font-size: 14px;
	color: #7f8c8d;
	margin-bottom: 10px;
}

.stat-value {
	font-size: 28px;
	font-weight: bold;
	color: #2c3e50;
	margin-bottom: 10px;
}

.trend-up {
	color: #2ecc71;
}

.trend-down {
	color: #e74c3c;
}

/* 컨테이너 스타일 */
.content-box {
	background: white;
	border-radius: 10px;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
	overflow: hidden;
	margin-bottom: 20px;
}

.content-header {
	padding: 15px 20px;
	font-size: 16px;
	font-weight: bold;
	color: #2c3e50;
	display: flex;
	justify-content: space-between;
	align-items: center;
	border-bottom: 1px solid #eee;
}

.content-body {
	padding: 15px 20px;
}

.chart-wrapper {
	height: 300px;
	padding: 10px;
}

/* div 기반 그리드 스타일 */
.data-grid {
	display: flex;
	flex-direction: column;
	width: 100%;
}

.grid-header, .grid-row {
	display: grid;
	grid-template-columns: 1fr 2fr 1fr 1fr;
	padding: 8px 0;
}

.grid-header {
	font-weight: bold;
	color: #7f8c8d;
	border-bottom: 1px solid #eee;
	padding-bottom: 12px;
}

.grid-row {
	border-bottom: 1px solid #eee;
}

.grid-row:hover {
	background-color: #f8f9fa;
}

.grid-cell {
	padding: 10px;
}

.status-badge {
	display: inline-block;
	padding: 4px 8px;
	border-radius: 4px;
	font-size: 12px;
	text-align: center;
}

.status-confirmed {
	background-color: #e8f5e9;
	color: #4caf50;
}

.status-pending {
	background-color: #fff8e1;
	color: #ff9800;
}

.two-column {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
	width: 100%;
}

/* 시터 등록 요청 섹션 */
.sitter-request-section {
	display: grid;
	grid-template-columns: 1fr 1fr;
	gap: 20px;
}

.sitter-list {
	flex: 1;
}

.chart-container {
	height: 200px;
	display: flex;
	justify-content: center;
	align-items: center;
}

.doughnut-label {
	font-size: 14px;
	margin-top: 10px;
	text-align: center;
	color: #7f8c8d;
}

.doughnut-container {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	padding: 10px;
}

/* 반응형 설정 */
@media ( max-width : 992px) {
	.stats-container {
		grid-template-columns: repeat(2, 1fr);
	}
	.two-column, .sitter-request-section {
		grid-template-columns: 1fr;
	}
}

@media ( max-width : 576px) {
	.stats-container {
		grid-template-columns: 1fr;
	}
	.grid-header, .grid-row {
		grid-template-columns: 1fr 1fr;
	}
	.grid-cell:nth-child(3), .grid-cell:nth-child(4) {
		display: none;
	}
}

/* 뷰 모드 토글 버튼 */
.view-toggle {
	display: flex;
	align-items: center;
	font-size: 13px;
	color: #3498db;
	cursor: pointer;
}

.view-toggle i {
	margin-left: 5px;
}

.view-all-link {
	color: #3498db;
	text-decoration: none;
	font-size: 14px;
	font-weight: normal;
	display: flex;
	align-items: center;
}

.view-all-link i {
	margin-left: 5px;
}
</style>
</head>
<body>
	<div class="wrap">
		<header>
			<c:import url="/WEB-INF/view/adminHeader.jsp"></c:import>
		</header>

		<div class="container">
			<!-- 인포그래픽 통계 카드 -->
			<div class="stats-container">
				<div class="stat-card">
					<i class="fas fa-user-plus stat-icon"></i>
					<div class="stat-title">회원가입 요청 수</div>
					<div class="stat-value"><c:out value="${countReg}" default="0" /> 건</div>
				</div>

				<div class="stat-card">
					<i class="fas fa-calendar-check stat-icon"></i>
					<div class="stat-title">오늘 일반돌봄 예약</div>
					<div class="stat-value"><c:out value="${countGenReq}" default="0" /> 건</div>
				</div>

				<div class="stat-card">
					<i class="fas fa-heartbeat stat-icon"></i>
					<div class="stat-title">오늘 긴급돌봄 예약</div>
					<div class="stat-value">0 건</div>
				</div>

				<div class="stat-card">
					<i class="fas fa-dollar-sign stat-icon"></i>
					<div class="stat-title">이번달 매출</div>
					<div class="stat-value">₩${monthlyRevenue}</div>
				</div>
			</div>

			<!-- 차트 섹션 -->
			<div class="two-column">
				<!-- 예약 건수 차트 -->
				<div class="content-box">
					<div class="content-header">
						월별 예약 건수 (일반/긴급)
						<div class="view-toggle">
							<i class="fas fa-chart-bar"></i>
						</div>
					</div>
					<div class="content-body">
						<div class="chart-wrapper">
							<canvas id="bookingChart"></canvas>
						</div>
					</div>
				</div>

				<!-- 방문자 수 차트 -->
				<div class="content-box">
					<div class="content-header">일별 방문자 추이</div>
					<div class="content-body">
						<div class="chart-wrapper">
							<canvas id="visitorChart"></canvas>
						</div>
					</div>
				</div>
			</div>

			<div class="two-column">
				<!-- 시터 등록 요청 섹션 -->
				<div class="content-box">
					<div class="content-header">
						시터 등록 요청 <a href="#" class="view-all-link">전체보기 <i
							class="fas fa-arrow-right"></i></a>
					</div>
					<div class="content-body">
						<div class="data-grid">
							<!-- 헤더 행 -->
							<div class="grid-header">
								<div class="grid-cell">신청번호</div>
								<div class="grid-cell">이름</div>
								<div class="grid-cell">상태</div>
								<div class="grid-cell">신청일</div>
							</div>

							<!-- 데이터 행 -->
							<div class="grid-row">
								<div class="grid-cell">SIT001</div>
								<div class="grid-cell">김시터</div>
								<div class="grid-cell">
									<span class="status-badge status-pending">대기중</span>
								</div>
								<div class="grid-cell">2025-04-13</div>
							</div>
							<div class="grid-row">
								<div class="grid-cell">SIT002</div>
								<div class="grid-cell">이시터</div>
								<div class="grid-cell">
									<span class="status-badge status-confirmed">승인</span>
								</div>
								<div class="grid-cell">2025-04-12</div>
							</div>
							<div class="grid-row">
								<div class="grid-cell">SIT003</div>
								<div class="grid-cell">박시터</div>
								<div class="grid-cell">
									<span class="status-badge status-pending">대기중</span>
								</div>
								<div class="grid-cell">2025-04-14</div>
							</div>
						</div>
					</div>
				</div>

				<!-- 회원가입 비율 차트 -->
				<div class="content-box">
					<div class="content-header">시터/부모 월별 회원가입 비율</div>
					<div class="content-body">
						<div class="chart-wrapper">
							<canvas id="memberTypeChart"></canvas>
						</div>
					</div>
				</div>
			</div>

			<!-- 운영자 공지사항 -->
			<div class="content-box">
				<div class="content-header">
					운영자의 공지사항 <a href="#" class="view-all-link">더보기 <i
						class="fas fa-arrow-right"></i></a>
				</div>
				<div class="content-body">
					<div class="data-grid">
						<!-- 헤더 행 -->
						<div class="grid-header">
							<div class="grid-cell">번호</div>
							<div class="grid-cell">제목</div>
							<div class="grid-cell">작성자</div>
							<div class="grid-cell">등록일</div>
						</div>

						<!-- 데이터 행 -->
						<div class="grid-row">
							<div class="grid-cell">10</div>
							<div class="grid-cell">5월 시스템 점검 일정 안내</div>
							<div class="grid-cell">관리자</div>
							<div class="grid-cell">2025-04-14</div>
						</div>
						<div class="grid-row">
							<div class="grid-cell">9</div>
							<div class="grid-cell">신규 돌봄 서비스 추가 안내</div>
							<div class="grid-cell">관리자</div>
							<div class="grid-cell">2025-04-10</div>
						</div>
						<div class="grid-row">
							<div class="grid-cell">8</div>
							<div class="grid-cell">결제 시스템 변경 사항 안내</div>
							<div class="grid-cell">관리자</div>
							<div class="grid-cell">2025-04-05</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script>
    $(document).ready(function() {
        // 월별 예약 건수 차트 (일반/긴급 구분)
        var bookingCtx = document.getElementById('bookingChart').getContext('2d');
        var bookingChart = new Chart(bookingCtx, {
            type: 'bar',
            data: {
                labels: ${monthLabels},
                datasets: [
                    {
                        label: '일반 돌봄',
                        data: ${generalData},
                        backgroundColor: '#3498db',
                        borderRadius: 4,
                        barPercentage: 0.6,
                        categoryPercentage: 0.8
                    },
                    {
                        label: '긴급 돌봄',
                        data: ${emergencyData},
                        backgroundColor: '#e74c3c',
                        borderRadius: 4,
                        barPercentage: 0.6,
                        categoryPercentage: 0.8
                    }
                ]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    legend: {
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0,0,0,0.05)'
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });
        
        // 일일 방문자 수 차트
        var visitorCtx = document.getElementById('visitorChart').getContext('2d');
        var visitorChart = new Chart(visitorCtx, {
            type: 'line',
            data: {
                labels: ['월', '화', '수', '목', '금', '토', '일'],
                datasets: [{
                    label: '일일 방문자 수',
                    data: [120, 145, 132, 158, 189, 201, 176],
                    backgroundColor: 'rgba(52, 152, 219, 0.2)',
                    borderColor: '#3498db',
                    borderWidth: 2,
                    tension: 0.3,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    y: {
                        beginAtZero: true,
                        grid: {
                            color: 'rgba(0,0,0,0.05)'
                        }
                    },
                    x: {
                        grid: {
                            display: false
                        }
                    }
                }
            }
        });
        
     // 시터, 부모 월별 회원가입 비율 도넛 차트
        var memberTypeCtx = document.getElementById('memberTypeChart').getContext('2d');
        var memberTypeChart = new Chart(memberTypeCtx, {
            type: 'doughnut',
            data: {
                labels: ['시터', '부모'],
                datasets: [{
                    data: [${sitterSignups}, ${parentSignups}],
                    backgroundColor: ['#3498db', '#e74c3c'],
                    borderWidth: 0
                }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                cutout: '70%',
                plugins: {
                    legend: {
                        position: 'bottom',
                        labels: {
                            font: {
                                size: 12
                            },
                            padding: 10
                        }
                    },
                    tooltip: {
                        callbacks: {
                            label: function(context) {
                                var label = context.label || '';
                                var value = context.raw || 0;
                                var total = context.dataset.data.reduce((a, b) => a + b, 0);
                                var percentage = Math.round((value / total) * 100);
                                return label + ': ' + value + '명 (' + percentage + '%)';
                            }
                        }
                    }
                },
                // 불필요한 클릭 이벤트 제거 - 마우스 오버만 허용
                events: ['mousemove', 'mouseout', 'mouseover'],
                animation: {
                    duration: 400,
                    easing: 'easeOutQuart'
                },
                elements: {
                    arc: {
                        borderWidth: 0
                    }
                },
                layout: {
                    padding: 5
                }
            }
        });
    });
</script>

<footer class="footer">
	<c:import url="/footer.action"/>
</footer>

</body>
</html>