package com.team1.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.mybatis.IAdminDAO;

@Controller
public class adminInfoController
{

	@Autowired
	private SqlSession sqlSession;
			
	// 관리자 정보 및 데이터 전송
	@RequestMapping(value = "/admininfoupdateform.action", method = RequestMethod.GET)
	public String adminInfoUpdateForm(Model model)
	{
		String result = null;
		
		IAdminDAO admin = sqlSession.getMapper(IAdminDAO.class);
		
		
		model.addAttribute("list", admin.list());
		result = "WEB-INF/view/adminInfoUpdateForm.jsp";
		
		return result;
		
	}		
			
	
}
