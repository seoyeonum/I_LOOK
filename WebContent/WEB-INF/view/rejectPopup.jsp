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
<title>rejectPopup.jsp</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<script type="text/javascript">
function submitReject()
{
    var form = document.getElementById("rejectForm");
    form.submit();
}
</script>
</head>
<body>
	<h2>거절 사유를 선택하세요</h2>
	   
	<form id="rejectForm" action="<%=cp%>/rejectinsert.action" method="post">
	<input type="hidden" name="sit_backup_id" value="${sit_backup_id}">
	
		<select name="sit_rejected_reason_id">
	   	 	<c:forEach var="reason" items="${rejectList}">
				<option value="${reason.sit_rejected_reason_id}">${reason.reason}</option>
			</c:forEach>
		</select>
	
	<br><br>
	<button type="button" onclick="submitReject()">거절하기</button>
	</form>
</body>
</html>