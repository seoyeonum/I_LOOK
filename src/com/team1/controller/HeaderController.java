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
public class HeaderController
{
	@Autowired
	private SqlSession sqlSession;
	/*
	@RequestMapping(value="/header.action", method = RequestMethod.GET)
	public String header(HttpSession session)
	{
		String result = null;
		
		// (type 기반으로 사용할 헤더 분기)
		
		String type = (String) session.getAttribute("type");
		
		if (type.equals("admin"))
		{
			result = "adminheader.action";
		}
		else if (type.equals("parent"))
		{
			result = "parentheader.action";
		}
		else if (type.equals("parent"))
		{
			result = "sitterheader.action";
		}
		
		// 확인
		//System.out.println("Session ID: " + session.getId());
		//System.out.println("Parent ID in Session: " + session.getAttribute("id"));
		
		return result;
	}
	
	@RequestMapping(value="/adminheader.action", method = RequestMethod.GET)
	public String adminHeader(HttpSession session)
	{
		String result = null;
		
	    //String id = (String) session.getAttribute("id");

	    // (알림함 관련 뷰를 만들고 그걸 불러오도록 해야하려나?)
	    //List<NotifyDTO> notifyList = notifyDAO.getUnreadList(id);
	    //model.addAttribute("notifyList", notifyList);
	    
	    result = "WEB-INF/view/adminHeader.jsp";
	    
	    return result;
	}
	*/
	
	@RequestMapping(value="/parentheader.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String parentHeader(Model model, HttpSession session)
	{
		String result = null;
		
	    //String id = (String) session.getAttribute("id");

	    // (알림함 관련 뷰를 만들고 그걸 불러오도록 해야하려나?)
	    //List<NotifyDTO> notifyList = notifyDAO.getUnreadList(id);
	    //model.addAttribute("notifyList", notifyList);

	    result = "WEB-INF/view/parentHeader.jsp";
	    
	    return result;
	}
	
	@RequestMapping(value="/sitterheader.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String sitterHeader(Model model, HttpSession session)
	{
		String result = null;
		
	    //String id = (String) session.getAttribute("id");

	    // (알림함 관련 뷰를 만들고 그걸 불러오도록 해야하려나?)
	    //List<NotifyDTO> notifyList = notifyDAO.getUnreadList(id);
	    //model.addAttribute("notifyList", notifyList);

	    result = "WEB-INF/view/sitterHeader.jsp";
	    
	    return result;
	}
	
	@RequestMapping(value="/parentsidebar.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String parentSidebar(Model model, HttpSession session)
	{
		String result = null;
		
	    result = "WEB-INF/view/parentSidebar.jsp";
	    
	    return result;
	}
}
