package com.team1.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.dto.AdminDTO;
import com.team1.mybatis.IAdminDAO;

@Controller
public class AdminMainController
{

	@Autowired
	private SqlSession sqlSession;
			
	// 관리자 메인페이지로 이동
	@RequestMapping(value = "/adminmain.action", method = RequestMethod.GET)
	public String adminMain(Model model, HttpSession session)
	{
		String result = null;

        if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("admin", dto);
	
		result = "WEB-INF/view/adminMain.jsp";
		
		return result;
	}		
	
	// 관리자 마이페이지로 이동 및 데이터 전송
	@RequestMapping(value = "/admininfo.action", method = RequestMethod.GET)
	public String adminInfo(Model model, HttpSession session)
	{
		String result = null;
		
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("admin", dto);
		
		IAdminDAO admin = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("admin", admin.list());
		result = "WEB-INF/view/adminInfo.jsp";
		
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
