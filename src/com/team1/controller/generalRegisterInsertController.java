/*==============================
 	SampleController.java
 	- 사용자 정의 컨트롤러
 =============================*/
package com.team1.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;
// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
// 사용자 정의 컨트롤러 클래스를 구성한다.

public class generalRegisterInsertController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// Controller 가 수행해야 할 액션코드
		
		ModelAndView mav = new ModelAndView();

		request.setCharacterEncoding("UTF-8");
		
		// 파일 업로드 처리
		String root = "/";
		root = request.getServletContext().getRealPath(root);
		
		String savePath = root + "pds" + File.separator + "saveFile";

		File dir = new File(savePath);
		if (!dir.exists())
			dir.mkdirs();
		
		String encType = "UTF-8";		//-- 인코딩 방식
		int maxFileSize = 5*1024*1024;	//-- 최대 업로드 크기(5MB)
		
		String fileName = "";
		try
		{
			// cos22.05 파일에 있는 클래스
			MultipartRequest multi = null;
			multi = new MultipartRequest(request, savePath, maxFileSize, encType, new DefaultFileRenamePolicy());
			//                       바이너리객체, 물리적인 경로, 파일크기, 인코딩 방식, 같은 이름의 파일 생성시 정책
		
			// 업로드된 파일 정보 (파일이 없을 수도 있음)
			
			File file = multi.getFile("uploadFile");
			if (file != null)
			{
				fileName = file.getName();
				System.out.println("업로드된 파일 이름: " + fileName);
			}
			
			// 이전 페이지로부터 넘어온 데이터 수신
			String startDate = multi.getParameter("startDate");
			String endDate = multi.getParameter("endDate");
			String startTime = multi.getParameter("startTime");
			String endTime = multi.getParameter("endTime");
			String preferedAge = multi.getParameter("preferedAge");
			String introduction = multi.getParameter("introduction");

			// 콘솔 로그
			System.out.println("startDate: " + startDate);
			System.out.println("endDate: " + endDate);
			System.out.println("startTime: " + startTime);
			System.out.println("endTime: " + endTime);
			System.out.println("preferedAge: " + preferedAge);
			System.out.println("introduction: " + introduction);
			// System.out.println("sigungu: " + sigungu);
			// System.out.println("dong: " + dong);
			System.out.println("uploaded file: " + fileName);
			
			// ② 결과 JSP로 데이터 넘기기
	        mav.setViewName("generalRegisterInsertComplete.jsp");
	        mav.addObject("startDate", startDate);
	        mav.addObject("endDate", endDate);
	        mav.addObject("startTime", startTime);
	        mav.addObject("endTime", endTime);
	        mav.addObject("preferedAge", preferedAge);
	        mav.addObject("introduction", introduction);
	        // mav.addObject("sigungu", sigungu);
	        // mav.addObject("dong", dong);
	        mav.addObject("uploadFileName", fileName);
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		return mav;
	}
}
