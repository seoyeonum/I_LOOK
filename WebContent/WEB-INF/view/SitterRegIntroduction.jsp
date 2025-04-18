<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath(); //내부적으로 콘텍스트를 지정할 수 있는 경로
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시터 일반 근무 등록 자기소개 페이지</title>
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/ILookCSS.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style type="text/css">
	
	main
	{
		font-family: 'NoonnuBasicGothicRegular';
		font-size: 20pt;
	}
	
	.main .container
	{
		
	}
	
	.parent.info
	{
		margin: 0 auto;
	}
	
	.key
	{
		background-color: #f4cccc;
		border-right: 2px solid #ea9999;
	}
	
	tr
	{
		border: 2px solid #ea9999;
	}
	
	td
	{
		padding: 10px 10px 10px 10px;
	}

</style>
</head>
<body style="max-width: 500px; max-height: 950px;">
<main>

<div class="main container" style="margin-top: 10%;
		margin-bottom: 20%;">
	<table class="parent info">
		<tbody class="info tbody">
			<tr>
				<td class="key">자기소개</td>
			</tr>
			<tr>
				<td>${register.introduction }</td>
			</tr>
		</tbody>
	</table>
</div>

</main>
</body>
</html>