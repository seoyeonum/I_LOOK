package com.team1.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.dto.AdminDTO;
import com.team1.mybatis.IAdminDAO;


@Controller
public class adminInfoController
{

	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 정보 수정 페이지로 이동 및 데이터 전송
	@RequestMapping(value = "/admininfoupdateform.action", method = RequestMethod.GET)
	public String adminInfoUpdateForm(String admin_reg_id, Model model)
	{
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
	public String adminInfoUpdate(AdminDTO admin, Model model)
	{
		String result = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		dao.update(admin);
		
		result = "redirect:admininfo.action";
		
		return result;
	}
	
}
