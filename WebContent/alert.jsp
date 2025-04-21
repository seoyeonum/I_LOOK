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
    <title>알림</title>
    <script type="text/javascript">
        alert("${msg}"); // 전달받은 메시지
        window.location.href = "${url}"; // 전달받은 URL로 이동
    </script>
<body>

</body>
</html>
