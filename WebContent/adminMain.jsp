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
<title>adminMain.jsp</title>
<link rel="stylesheet" type="text/css" href="css/adminMain.css">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<script>
$(document).ready(function() {
	var ctx = document.getElementById('myChart').getContext('2d');

	new Chart(ctx, {
		type : 'bar',
		data : {
			labels : [ 'Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange' ],
			datasets : [{
				label : '# of Votes',
				data : [ 12, 19, 3, 5, 2, 3 ],
				borderWidth : 1
			}]
		},
		options : {
			scales : {
				y : {
					beginAtZero : true
				}
			}
		}
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

			<div class="container-half">
				<div class="container-half-group">
					<div class="container-penel">시터 등록 요청</div>
					<div class="verification"></div>
					<div class="container-content">내용</div>
				</div>


				<div>
					<canvas id="myChart"></canvas>
				</div>

				<div class="container-half-group">
					<div class="container-penel">일일 접속자 수 그래프로 일일 수입?</div>
					<div class="verification"></div>
					<div class="container-content">내용</div>
				</div>
			</div>

			<div class="container-group">
				<div class="container-penel">운영자의 공지사항</div>
				<div class="verification"></div>
				<div class="container-content">내용</div>
			</div>

		</div>
	</div>
</body>
</html>