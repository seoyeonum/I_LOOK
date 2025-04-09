<%@ page contentType="text/html; charset=UTF-8"%><%@
taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%><%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); //내부적으로 콘텍스트를 지정할 수 있는 경로
%><%

	//SitterWorkRec.jsp
	
	// 시터 근무 등록 내역의 시터 근무 등록 상세 내역 + (부모 신청 간략 정보)가 담긴
	// AJAX를 담는 쪽지.
%>