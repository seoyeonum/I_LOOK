/* =============================
 	parentloginController.java
============================= */

package com.team1.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.dto.ParDTO;
import com.team1.mybatis.IParLoginDAO;

@Controller
public class ParentloginController
{
	@Autowired
	private SqlSession sqlSession;
	
    // 부모 로그인 처리
    @RequestMapping(value = "/parentlogin.action", method = RequestMethod.POST)
    public String sitterLogin(@RequestParam("id") String id,
                             @RequestParam("pw") String pw, HttpSession session)
    {
    	IParLoginDAO dao = sqlSession.getMapper(IParLoginDAO.class);

    	ParDTO parent = dao.loginCheck(id, pw);

        if (parent != null)
        {
            session.setAttribute("loginParent", parent);
            return "genMain.jsp";
        }
        else 
        {
            return "redirect:/login.action?error=1";
        }
    }
}

