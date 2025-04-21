<%@page import="com.team1.dto.SitCareListDTO"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); //내부적으로 콘텍스트를 지정할 수 있는 경로
	
	// SitterGenReqDetail.jsp
	// 돌봄 제공 내역 리스트 
	// (메인 화면 로딩하면 가장 큰 화면에 최근 이용 내역 1개 띄우기) AJAX 처리
	// + 서버 안에 저장된 최근 3개월 내역도 보여주는 건....SitterGenReqAnsweredList 에서.
%><%

	// 값 어케 받아오지.
	
	// SitterMypageController 에서 준 거 받아왔음.

	
	String sit_backup_id = (String) request.getAttribute("sit_backup_id");
	String gen_req_id = (String) request.getAttribute("gen_req_id");
	SitCareListDTO reqDetail = (SitCareListDTO)request.getAttribute("reqDetail");
	
	StringBuffer sb = new StringBuffer();
	
	String result = "변환 안 됨.";
	
	sb.append("{\"sit_backup_id\": " + "\"" + sit_backup_id + "\"");			//{ "sit_backup_id" : "sit_backup_id"
	sb.append(", \"gen_req_id\" : " + "\"" + gen_req_id + "\"");				//, "gen_req_id" : "gen_req_id"
	sb.append(", \"name\" : " + "\"" + reqDetail.getPar_name() + "\"");			//, "name" : "reqDetail.getPar_name()"
	sb.append(", \"careDays\" : " + "\"" + reqDetail.getPar_start_date() + " ~ " + reqDetail.getPar_end_date() 
								  + " | " + reqDetail.getPar_start_time() + " ~ " + reqDetail.getPar_end_time() + " | " + "\"");
	sb.append(", \"gu_addr\" : " + "\"" + reqDetail.getGu_addr() + "\"");
	sb.append(", \"child_gender\" : " + "\"" + reqDetail.getChild_gender() + "\"");
	sb.append(", \"child_age\" : " + "\"" + reqDetail.getChild_age() + "\"");
	sb.append(", \"medical_type\" : " + "\"" + reqDetail.getMedical_type() + "\"");
	sb.append(", \"allergie_type\" : " + "\"" + reqDetail.getAllergie_type() + "\"");
	sb.append(", \"disability_type\" : " + "\"" + reqDetail.getDisability_type() + "\"");
	sb.append(", \"message\" : " + "\"" + reqDetail.getMessage() + "\"}");
	
	result = sb.toString();
	
	out.println(result);
	
	
	


%>