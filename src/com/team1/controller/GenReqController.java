/*=============================
	GenReqController
=============================*/

package com.team1.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class GenReqController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/genmain.action", method = RequestMethod.GET)
	public String genMain(Model model)
	{
		String result = null;
		
		result = "WEB-INF/view/genMain.jsp";
		
		return result;
	}
	


}