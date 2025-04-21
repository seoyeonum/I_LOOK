<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원가입 완료</title>
</head>
<body>

<c:if test="${param.joined == 'true'}">
    <script>
        // 확인 누르면 이동
        alert("가입이 되셨습니다!");
        window.location.href = "${pageContext.request.contextPath}/login.jsp";
    </script>
</c:if>

</body>
</html>
