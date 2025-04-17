package com.team1.controller;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team1.dto.AdminDTO;
import com.team1.dto.GradesDTO;
import com.team1.mybatis.IGradesDAO;


@Controller
public class AdminServiceController
{

	@Autowired
	private SqlSession sqlSession;
	
	// 상단 서비스관리 및 사이드바 근무 등록 내역(기본값)으로 이동 및 데이터 전송
	@RequestMapping(value = "/admingenreglist.action", method = RequestMethod.GET)
	public String adminGenRegList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("admin", dto);
		
		result = "WEB-INF/view/adminGenRegList.jsp";
		
		return result;
	}
	
	// 임금내역으로 이동 및 데이터 전송
	@RequestMapping(value = "/adminwagelist.action", method = RequestMethod.GET)
	public String wageList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
			return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("admin", dto);
		
		result = "WEB-INF/view/adminWageList.jsp";
		
		return result;
	}
	
	// 예약신청내역으로 이동 및 데이터 전송
	@RequestMapping(value = "/adminreqlist.action", method = RequestMethod.GET)
	public String adminReqList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
			return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("admin", dto);
		
		result = "WEB-INF/view/adminReqList.jsp";
		
		return result;
	}
	
	// 결제내역으로 이동 및 데이터 전송
	@RequestMapping(value = "/adminpayreclist.action", method = RequestMethod.GET)
	public String adminPayRecList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
			return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("admin", dto);
		
		result = "WEB-INF/view/adminPayRecList.jsp";
		
		return result;
	}
	
	// 포인트 변동 내역으로 이동 및 데이터 전송
	@RequestMapping(value = "/adminpointlist.action", method = RequestMethod.GET)
	public String adminPointList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
			return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("admin", dto);
		
		result = "WEB-INF/view/adminPointList.jsp";
		
		return result;
	}
	
	
	// 등급 목록으로 이동 및 데이터 전송
	@RequestMapping(value = "/gradelist.action", method = RequestMethod.GET)
	public String gradeList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("admin", dto);
		        
		IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
		
		model.addAttribute("grade", dao.listGrade());
		
		result = "WEB-INF/view/gradeList.jsp";
		
		return result;
	}
	
	// 등급 추가 폼으로 이동 및 데이터 전송
	@RequestMapping(value = "/gradeinsertform.action", method = RequestMethod.GET)
	public String gradeInsertForm(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("admin", dto);
		
		result = "WEB-INF/view/gradeInsertForm.jsp";
		
		return result;
	}
	
	// 등급 추가
	@RequestMapping(value = "/gradeinsert.action", method = RequestMethod.POST)
	public String addGrade(GradesDTO grade, @RequestParam("uploadFile") MultipartFile uploadFile 
            			 , HttpServletRequest request) throws Exception
	{
		String result = null;
		
		// 파일 업로드 처리
		// 업로드 경로 지정 (/WebContent/images/grades/)
		String uploadDir = request.getServletContext().getRealPath("/images/grades");
		
		File dir = new File(uploadDir);
		if (!dir.exists())
			dir.mkdirs();
		
		try
	    {
	        // Spring의 MultipartFile을 사용하여 파일 처리
	        if (!uploadFile.isEmpty())
	        {
	            // 원본 파일 이름 가져오기
	            String fileName = uploadFile.getOriginalFilename();
	            
	            // 파일 저장
	            File saveFile = new File(uploadDir, fileName);
	            uploadFile.transferTo(saveFile);
	            
	            System.out.println("업로드된 파일 이름: " + fileName);
	            System.out.println("업로드된 파일 경로 : " + uploadDir);
	            // 파일 경로를 DTO의 file_path에 설정
	            grade.setFile_path("images/grades/" + fileName);
	        }
	        
	        IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
	        dao.addGrade(grade);
	        
	        result = "redirect:gradelist.action";
	    }
	    catch (Exception e)
	    {
	        System.out.println("파일 업로드 중 오류 발생: " + e.getMessage());
	        throw e;
	    }
		
		return result;
	}
	
	// 등급 수정 폼으로 이동 및 데이터 전송
	
	
	
	// 시급 목록으로 이동
	@RequestMapping(value = "/hourlywagelist.action", method = RequestMethod.GET)
	public String wageList(Model model)
	{
		String result = null;
		
		IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
		
		model.addAttribute("genWage", dao.listGenWage());
		model.addAttribute("emgWage", dao.listEmgWage());
		
		result = "WEB-INF/view/hourlyWageList.jsp";
		
		return result;
	}
	
	// 시급 수정폼으로 이동 및 데이터 전송
	@RequestMapping(value = "/wageupdateform.action", method = RequestMethod.GET)
	public String wageUpdateForm(String type, String id, Model model)
	{
		String result = null;
			
		IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
		
		if (type.equals("gen"))
		{
			model.addAttribute("genWage", dao.listGenWage());
		}
		else if (type.equals("emg"))
		{
			model.addAttribute("emgWage", dao.listEmgWage());
		}
		model.addAttribute("type", type);
		
		result = "WEB-INF/view/wageUpdateForm.jsp";
		
		return result;
	}
	
	// 시급 수정
	@RequestMapping(value = "/wageupdate.action", method = RequestMethod.POST)
	public String wageUpdate(String type, GradesDTO grades, Model model)
	{
		String result = null;
	    
		IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
		
		if (type.equals("gen"))
		{
			dao.modifyGenWage(grades);
		}
		else if (type.equals("emg"))
		{
			dao.modifyEmgWage(grades);
		}
		
		result = "redirect:hourlywagelist.action";
		
		return result;
	}
	
	// 공지사항으로 이동 및 데이터 전송
	@RequestMapping(value = "/noticelist.action", method = RequestMethod.GET)
	public String noticeList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
			return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("admin", dto);
		
		result = "WEB-INF/view/noticeList.jsp";
		
		return result;
	}
		
	
	// 관리자 검증 메소드
	private boolean isAdmin(HttpSession session)
    {
        return session.getAttribute("loginAdmin") != null;
    }
    private AdminDTO getLoginAdmin(HttpSession session)
    {
        return (AdminDTO) session.getAttribute("loginAdmin");
    }
	
	
}
	

