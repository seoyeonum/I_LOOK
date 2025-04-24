/*=============================
	NoticeController
=============================*/

package com.team1.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class NoticeController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	// ● 공지사항 리스트 페이지
	@RequestMapping(value="/sitnotice.action", method = RequestMethod.GET)
	public String sitNotice(HttpSession session, Model model)
	{
		String result = null;
		
		result = "WEB-INF/view/noticeList.jsp";
		
		return result;
	}
	
}