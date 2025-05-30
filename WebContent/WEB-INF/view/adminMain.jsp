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
<title>adminMain.jsp</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
<link rel="stylesheet" type="text/css" href="css/adminMain.css">
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript"
	src="http://code.jquery.com/jquery.min.js"></script>
<script>
    $(document).ready(function() 
    {
        // 월별 예약 건수 차트 (일반)
        var bookingCtx = document.getElementById('bookingChart').getContext('2d');
        var bookingChart = new Chart(bookingCtx
        , {
            type: 'bar'
            , data: 
            {
                labels: ${adminMainDTO.monthLabels}
                , datasets: 
                [
                    {
                        label: '일반 돌봄'
                        , data: ${adminMainDTO.countMonthGenReq}
                        , backgroundColor: '#3498db'
                        , borderRadius: 4
                        , barPercentage: 0.6
                        , categoryPercentage: 0.8
                    }
                ]
            }
            , options: 
            {
                responsive: true
                , maintainAspectRatio: false
                , plugins: 
                {
                    legend: 
                    {
                        position: 'top'
                    }
                }
                , scales: 
                {
                    y: 
                    {
                        beginAtZero: true
                        , grid: 
                        {
                            color: 'rgba(0,0,0,0.05)'
                        }
                    }
                    , x: 
                    {
                        grid:
                        {
                            display: false
                        }
                    }
                }
            }
        });

        // 도넛 차트
        
            var memberTypeCtx = document.getElementById('memberTypeChart').getContext('2d');
            var memberTypeChart = new Chart(memberTypeCtx, {
                type: 'doughnut',
                data: {
                    labels: ['시터', '부모'],
                    datasets: [{
                        data: [${countMonthSitReg}, ${countMonthParReg}],
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
                                font: { size: 12 },
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
                    animation: {
                        duration: 400,
                        easing: 'easeOutQuart'
                    },
                    elements: {
                        arc: { borderWidth: 0 }
                    },
                    layout: { padding: 5 }
                }
            });
    });
</script>

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
					<i class="fas fa-thin fa-user-plus stat-icon"></i>
					<div class="stat-title">당일 회원가입 요청 수</div>
					<div class="stat-value">
						<c:out value="${adminMainDTO.countReg}" default="0" />
						건
					</div>
				</div>

				<div class="stat-card">
					<i class="fas fa-calendar-check stat-icon"></i>
					<div class="stat-title">당일 일반돌봄 예약</div>
					<div class="stat-value">
						<c:out value="${adminMainDTO.countDayGenReq}" default="0" />
						건
					</div>
				</div>

				<div class="stat-card">
					<i class="fas fa-heartbeat stat-icon"></i>
					<div class="stat-title">당일 긴급돌봄 예약</div>
					<div class="stat-value">0 건</div>
				</div>

				<div class="stat-card">
					<i class="fas fa-dollar-sign stat-icon"></i>
					<div class="stat-title">월간 매출</div>
					<div class="stat-value">₩${monthPayment}</div>
				</div>
			</div>

			<!-- 차트 섹션 -->
			<div class="two-column">
				<!-- 예약 건수 차트 -->
				<div class="content-box">
					<div class="content-header">월별 예약 건수 (일반/긴급)</div>
					<div class="content-body">
						<div class="chart-wrapper">
							<canvas id="bookingChart"></canvas>
						</div>
					</div>
				</div>

				<!-- 월별 회원가입 비율 차트 -->
				<div class="content-box">
					<div class="content-header">이번 달 시터/부모 가입 비율</div>
					<div class="content-body">
						<div class="chart-wrapper">
							<canvas id="memberTypeChart"></canvas>
						</div>
					</div>
				</div>

			</div>

			<div class="two-column">
				<!-- 시터 등록 요청 섹션 -->
				<div class="content-box">
					<div class="content-header">
						시터 등록 요청 <a href="<%=cp%>/adminsitreglist.action"
							class="view-all-link">더보기 <i class="fas fa-arrow-right"></i></a>
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
							<c:forEach var="list" items="${listSitRecent}" varStatus="status">
							    <div class="grid-row">
							        <div class="grid-cell">${fn:length(listSitRecent) - status.index}</div>
							        <div class="grid-cell">${list.name}</div>
							        <div class="grid-cell">
							            <span class="status-badge status-pending">대기중</span>
							        </div>
							        <div class="grid-cell">${fn:substring(list.reg_date, 0, 10)}</div>
							    </div>
							</c:forEach>
						</div>
					</div>
				</div>
				<!-- 운영자 공지사항 -->
				<div class="content-box">
					<div class="content-header">
						운영자의 공지사항 <a href="<%=cp%>/noticelist.action" class="view-all-link">더보기 <i class="fas fa-arrow-right"></i></a>
					</div>
					<div class="content-body">
						<div class="data-grid">
							<!-- 헤더 행 -->
							<div class="notice-grid-header">
								<div class="noti-grid-cell">번호</div>
								<div class="notice-grid-cell">유형</div>
								<div class="notice-grid-cell">제목</div>
								<div class="notice-grid-cell">등록일</div>
							</div>

							<!-- 데이터 행 -->
							<c:forEach var="notice" items="${noticeList }" varStatus="status">
							<div class="notice-grid-row">
								<div class="notice-grid-cell">${fn:length(noticeList) - status.index}</div>
								<div class="notice-grid-cell">${notice.type }</div>
								<div class="notice-grid-cell">${notice.subject }</div>
								<div class="notice-grid-cell">${fn:substring(notice.noticed_date,0,10) }</div>
							</div>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>




	<footer class="footer">
		<c:import url="/footer.action" />
	</footer>

</body>
</html>