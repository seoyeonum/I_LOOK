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
<title>sitterMain.jsp</title>
<link rel="stylesheet" type="text/css" href="css/header.css">
</head>
<body>
    <div>
        <!--헤더 부분은 공용으로 모든 뷰페이지에 사용하고 메인부분만 변경하는 부분으로 생각했었어 각 뷰페이지에 헤더부분만 같아도 통일감을 가질 것 같아서-->
    <div>
	<c:import url="/WEB-INF/view/header.jsp" ></c:import>
	</div>
        <main>
            <section id="fillter">
                <section id="select_box">
                    부모회원으로 로그인 시 1차 필터(날짜, 시간)
                    <br>
                    시터회원으로 로그인 시 긴급돌봄요청 목록 
                </section>
            </section>
            <section id="notice">
                <section id="notice_text">
                    운영자의 공지사항
                </section>
            </section>
        </main>
    </div>


</body>
</html>