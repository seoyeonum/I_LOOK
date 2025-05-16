/*================================
 	HeaderController.java
================================*/

package com.team1.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class FooterController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/footer.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String footer(Model model, HttpSession session)
	{
		String result = null;
		
	    result = "WEB-INF/view/footer.jsp";
	    
	    return result;
	}
	
}
