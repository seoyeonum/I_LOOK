<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();	
%>
<%
	// 사진 업로드
	
	// String root = request.getRealPath("/"); //-- 예전 방식
	// String root = pageContext.getServletContext().getRealPath("/");
	
	String root = "/";
	root = pageContext.getServletContext().getRealPath(root);
	
	String savePath = root + "pds" + "\\" + "saveFile";
	File dir = new File(savePath);
	
	// 확인
	System.out.println(savePath);
	//--==>>	
    /*
	C:\SpringMVC\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\fileSystemApp06\pds\saveFile
	*/
	
	// 물리적인 경로 생성
	if(!dir.exists())
		dir.mkdirs();
	
	String encType = "UTF-8";		//-- 인코딩 방식
	int maxFileSize = 5*1024*1024;	//-- 최대 업로드 크기(5MB)
	
	try
	{
		// cos22.05 파일에 있는 클래스
		MultipartRequest multi = null;
		multi = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
		//                       바이너리객체, 물리적인 경로, 파일크기, 인코딩 방식, 같은 이름의 파일 생성시 정책
	
		File file = multi.getFile("uploadFile");
		if(file != null)
			out.println("업로드 파일 크기 : " + file.length() + "<br>");	
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
%>
