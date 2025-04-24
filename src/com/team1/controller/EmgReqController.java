/*=============================
	EmgReqController
=============================*/

package com.team1.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.dto.ChildDTO;
import com.team1.dto.SitDTO;
import com.team1.mybatis.IChildDAO;

@Controller
public class EmgReqController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	// ● 긴급 돌봄 메인
	@RequestMapping(value="/emgmain.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String emgMain(HttpSession session, Model model)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
		
		if (sitter == null)
			return "redirect:/iLook.action";
		
		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		String sitName = sitter.getName();
		model.addAttribute("sitName", sitName);
		
		result = "WEB-INF/view/emgMain.jsp";
		
		return result;
	}
	
	// ● 긴급 돌봄 리스트
	@RequestMapping(value="/emgreqlist.action", method = RequestMethod.GET)
	public String emgReqList(HttpSession session, Model model)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
		
		if (sitter == null)
			return "redirect:/iLook.action";
		
		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
		result = "WEB-INF/view/emgReqList.jsp";
		
		return result;
	}
	
	// ● 긴급 돌봄 리스트
	@RequestMapping(value="/emgreginsertform.action", method = RequestMethod.GET)
	public String emgRegInsertForm(HttpSession session, Model model)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
		
		if (sitter == null)
			return "redirect:/iLook.action";
		
		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
		result = "WEB-INF/view/emgRegInsertForm.jsp";
		
		return result;
	}
	
}