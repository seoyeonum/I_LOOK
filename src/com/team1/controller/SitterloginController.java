/* =============================
 	sitterloginController.java
============================= */

package com.team1.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.dto.SitDTO;
import com.team1.mybatis.ISitLoginDAO;

@Controller
public class SitterloginController
{
	@Autowired
	private SqlSession sqlSession;
	
    // 시터 로그인 처리
    @RequestMapping(value = "/sitterlogin.action", method = RequestMethod.POST)
    public String sitterLogin(@RequestParam("id") String id,
                             @RequestParam("pw") String pw, HttpSession session)
    {
    	ISitLoginDAO dao = sqlSession.getMapper(ISitLoginDAO.class);

    	SitDTO admin = dao.loginCheck(id, pw);

        if (admin != null)
        {
            session.setAttribute("loginSitter", admin);
            return "WEB-INF/view/sitterMain.jsp";
        }
        else 
        {
            return "redirect:/login.action?error=1";
        }
    }
}
