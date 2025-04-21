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
public class AdminMemberController
{

	@Autowired
	private SqlSession sqlSession;
	/*
	 * // 상단 회원 관리 누를 시 시터 등록요청 페이지로 이동 및 데이터 전송
	 * 
	 * @RequestMapping(value = "/adminsitreglist.action", method =
	 * RequestMethod.GET) public String adminInfoUpdateForm(Model model) { String
	 * result = null;
	 * 
	 * IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
	 * 
	 * AdminDTO admin = dao.search(admin_reg_id);
	 * 
	 * // JSP로 데이터 전달 model.addAttribute("admin", admin);
	 * 
	 * result = "WEB-INF/view/adminInfoUpdateForm.jsp";
	 * 
	 * return result; }
	 */
}
