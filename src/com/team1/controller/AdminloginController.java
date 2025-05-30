/* =============================
 	adminloginController.java
============================= */
package com.team1.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.dto.AdminDTO;
import com.team1.mybatis.IAdminLoginDAO;

@Controller
public class AdminloginController
{
    @Autowired
    private SqlSession sqlSession;

    // 관리자 로그인 처리
    @RequestMapping(value = "/adminlogin.action", method = RequestMethod.POST)
    public String adminLogin(@RequestParam("id") String id,
                             @RequestParam("pw") String pw, HttpSession session,
                             Model model)
    {
    
        IAdminLoginDAO dao = sqlSession.getMapper(IAdminLoginDAO.class);
        
        AdminDTO admin = dao.loginCheck(id, pw);
        
        if (admin != null)
        {
            session.setAttribute("loginAdmin", admin);
            return "redirect:/adminmain.action";
        }
        else 
        {
            model.addAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "/WEB-INF/view/logIn.jsp";  // 로그인 폼 JSP로 이동
        }
    }

	/*
	 * // 로그아웃
	 * 
	 * @RequestMapping(value = "/adminlogout.action", method = RequestMethod.GET)
	 * public String adminLogout(HttpSession session) { session.invalidate(); return
	 * "redirect:/loginform.action"; }
	 */
}
