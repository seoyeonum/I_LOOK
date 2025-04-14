package com.team1.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.mybatis.IAdminDAO;

@Controller
public class adminMainController
{

	@Autowired
	private SqlSession sqlSession;
			
	// 관리자 메인페이지로 이동
	@RequestMapping(value = "/adminmain.action", method = RequestMethod.GET)
	public String adminMain(Model model)
	{
		String result = null;
	
		result = "WEB-INF/view/adminMain.jsp";
		
		return result;
	}		
	
	// 관리자 마이페이지로 이동 
	@RequestMapping(value = "/admininfo.action", method = RequestMethod.GET)
	public String adminInfo(Model model)
	{
		String result = null;
		
		result = "WEB-INF/view/adminInfo.jsp";
		
		return result;
	}
	
}
