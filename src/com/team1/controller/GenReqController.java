/*=============================
	GenReqController
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
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class GenReqController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/genmain.action", method = RequestMethod.GET)
	public String genMain(@RequestParam("id") String id, HttpSession session)
	{
		String result = null;
		
		// (부모 id 기반으로 아이 이름 조회)
		
		session.setAttribute("id", id);
		result = "WEB-INF/view/genMain.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/gensearchresult.action", method = RequestMethod.POST)
	public String genSearchResult(@RequestParam("child-name") String childName
								, @RequestParam("date-start") String dateStart
								, @RequestParam("date-end") String dateEnd
								, @RequestParam("time-start") String timeStart
								, @RequestParam("time-end") String timeEnd
								//,HttpSession session
								, Model model)
	{
		String result = null;
		
		model.addAttribute("childName", childName);
		model.addAttribute("dateStart", dateStart);
		model.addAttribute("dateEnd", dateEnd);
		model.addAttribute("timeStart", timeStart);
		model.addAttribute("timeEnd", timeEnd);
		
		// (입력값 기반으로 1차 필터 수행)
		
		result = "WEB-INF/view/genSearchResult.jsp";
		
		return result;
	}
	
	
	@RequestMapping(value = "/genreglist.action", method = RequestMethod.POST)
	public String handleRequest(@RequestParam("grades") ArrayList<String> grades
							  , @RequestParam("regions") ArrayList<String> regions)
	{
	    // grades = ['A', 'B', 'C']
	    // regions = ['SEOUL', 'BUSAN', 'DAEGU']
		
		// 커다란 map 에 위 둘을 넣자.
		
		// 그 map 을 2차 필터 쿼리에 param 으로 주자.
		
		// 그 결과는 ArrayList<GenRegDTO> 에 담김 이 list 를 html 조각으로 바꾸자.
		// 이를 붙이자(String)
	    
	    //System.out.println("Grades: " + grades);
	    //System.out.println("Regions: " + regions);
	    
	    // 비즈니스 로직 처리 후 응답
	    return "responseView";
	}
	


}