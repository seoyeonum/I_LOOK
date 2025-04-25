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
public class AdminInfoController
{

	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 정보 수정 페이지로 이동 및 데이터 전송
	@RequestMapping(value = "/admininfoupdateform.action", method = RequestMethod.GET)
	public String adminInfoUpdateForm(String admin_reg_id, Model model, HttpSession session)
	{
		// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("loginAdmin", dto);
    	
		String result = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		AdminDTO admin = dao.search(admin_reg_id);

        // JSP로 데이터 전달
        model.addAttribute("admin", admin);

		result = "WEB-INF/view/adminInfoUpdateForm.jsp";
		
		return result;
	}
	
	
	// 관리자 정보 수정
	@RequestMapping(value = "/admininfoupdate.action", method = RequestMethod.POST)
	public String adminInfoUpdate(AdminDTO admin, Model model, HttpSession session)
	{
		// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("loginAdmin", dto);
    	
		String result = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.update(admin);
		
		result = "redirect:admininfo.action";
		
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
