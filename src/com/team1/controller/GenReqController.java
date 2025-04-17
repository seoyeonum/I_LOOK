/*=============================
	GenReqController
=============================*/

package com.team1.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.dto.GenPayDTO;

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
		result = "redirect:WEB-INF/view/genMain.jsp";
		
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
	
	@RequestMapping(value = "/genregpossiblelist.action", method = RequestMethod.POST)
	@ResponseBody
	public String genRegList(@RequestParam("grades") List<String> grades
							  , @RequestParam("regions") List<String> regions
							  , HttpServletResponse response
							  )
	{
		String result = null;
	    // grades = ['A', 'B', 'C']
	    // regions = ['SEOUL', 'BUSAN', 'DAEGU']
		
		// 커다란 map 에 위 둘을 넣자.
		
		// 그 map 을 2차 필터 쿼리에 param 으로 주자.
		
		// 그 결과는 ArrayList<GenRegDTO> 에 담김 이 list 를 html 조각으로 바꾸자.
		// 이를 붙이자(String)
		
		System.out.println("Grades: " + grades);
		
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    
		result = "<p>Test</p>";
		
	    System.out.println("Regions: " + regions);
		
	    // 비즈니스 로직 처리 후 응답
	    return result;
	}
	
	
	@RequestMapping(value="/genregpossibledetail.action", method = RequestMethod.GET)
	public String genRegDetail(@RequestParam("genRegId") String genRegId, Model model)
	{
		String result = null;
		
		// (선택한 근무 등록 정보 리스트)
		
		model.addAttribute("genRegId", genRegId);
		
		result = "WEB-INF/view/genRegDetail.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/genReqInsertForm.action", method = RequestMethod.GET)
	public String genReqInsertForm(@RequestParam("genRegId") String genRegId, Model model)
	{
		String result = null;
		
		//model.addAttribute("genRegId", genRegId);
		
		// (시터 백업 코드로 시터 데이터 조회)
		// (아이 백업 코드(세션)으로 아이 정보 조회
		// (아이 백업 코드(세션)으로 아이 보유 알레르기 등 조회
		// 현 보유 포인트 조회
		
		result = "WEB-INF/view/genReqInsertForm.jsp?genRegId=" + genRegId;
		
		return result;
	}
	
	
	@RequestMapping(value="/genpayinsertform.action", method = RequestMethod.GET)
	public String genPayInsertForm(GenPayDTO dto, Model model)
	{
		String result = null;
		
		// 아래 필요한 데이터 전부 담아 전달
		
		// (결제 내역 데이터)
		// (포인트 차감 데이터)
		// (일반 돌봄 신청 데이터)
		
		System.out.println("결제 과정 수행");
		
		result = "WEB-INF/view/genPayInsertForm.jsp";
		
		return result;
	}
	
	
	@RequestMapping(value="/genpayresult.action", method = RequestMethod.GET)
	public String genPayResult(GenPayDTO dto, HttpSession session)
	{
		String result = null;
		
		// (결제 내역 데이터 추가 액션)
		// (포인트 차감 데이터 추가 액션)
		// (일반 돌봄 신청 데이터 추가 액션)
		
		session.getAttribute("id");
		result = "WEB-INF/view/genPayResult.jsp";
		
		return result;
	}
	
}