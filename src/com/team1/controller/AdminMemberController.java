package com.team1.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.dto.AdminDTO;
import com.team1.dto.SitDTO;
import com.team1.mybatis.ISitDAO;
import com.team1.util.PageHandler;


@Controller
public class AdminMemberController
{

	@Autowired
	private SqlSession sqlSession;
	
    // 상단 회원 관리 및 사이드바 누를 시 시터 등록요청 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminsitreglist.action", method = RequestMethod.GET) 
    public String adminSitRegList(@RequestParam(value = "page", defaultValue="1") int page
    							, @RequestParam(value = "searchKey", required = false) String searchKey 
    							, @RequestParam(value = "searchValue", required = false) String searchValue 
    							, Model model, HttpSession session)
    { 
	    // 관리자 확인 절차
	    if (!isAdmin(session))
		    return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("admin", dto);
		  
		String result = null;
		ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
		
		// 총 등록 요청 수
		int totalCount = dao.countSitReg(searchKey, searchValue);
        
		PageHandler paging = new PageHandler(page, totalCount);
		
        List<SitDTO> sitRegList = dao.listSitReg(paging.getStart(), paging.getEnd(), searchKey, searchValue);
        
        model.addAttribute("sitRegList", sitRegList);
        model.addAttribute("paging", paging);
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        
		result = "WEB-INF/view/adminSitRegList.jsp";
	  
		return result;
	}
    							
    // 시터 등록요청 상세정보 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminsitregdetail.action", method = RequestMethod.GET) 
    public String adminSitRegDetail(String sit_reg_id, Model model, HttpSession session)
    {
    	// 관리자 확인 절차
	    if (!isAdmin(session))
		    return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("admin", dto);
		
    	String result = "";
    	ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
    	
    	result = "WEB-INF/view/adminSitRegDetail.jsp";
    	
		return result;
    }
    
    
    
    
    
    // 시터 거절 내역 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminsitrejectedlist.action", method = RequestMethod.GET) 
    public String adminSitRejectedList(Model model, HttpSession session) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("admin", dto);
    	
    	String result = null;
    	
    	ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
    	
    	
    	
    	result = "WEB-INF/view/adminSitRejectedList.jsp";
    	
    	return result;
    }
    
    // 시터 회원 정보 목록 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminsitlist.action", method = RequestMethod.GET) 
    public String adminSitList(Model model, HttpSession session) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("admin", dto);
    	
    	String result = null;
    	
    	ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
    	
    	
    	
    	result = "WEB-INF/view/adminSitList.jsp";
    	
    	return result;
    }
    
    // 부모 회원 정보 목록 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminparlist.action", method = RequestMethod.GET) 
    public String adminParList(Model model, HttpSession session) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("admin", dto);
    	
    	String result = null;
    	
    	ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
    	
    	
    	
    	result = "WEB-INF/view/adminParList.jsp";
    	
    	return result;
    }
    
    // 아이 정보 목록 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminchildlist.action", method = RequestMethod.GET) 
    public String adminChildList(Model model, HttpSession session) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("admin", dto);
    	
    	String result = null;
    	
    	ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
    	
    	
    	
    	result = "WEB-INF/view/adminChildList.jsp";
    	
    	return result;
    }
    
    // 시터 위반 내역 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminsitviollist.action", method = RequestMethod.GET) 
    public String adminSitViolList(Model model, HttpSession session) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("admin", dto);
    	
    	String result = null;
    	
    	ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
    	
    	result = "WEB-INF/view/adminSitViolList.jsp";
    	
    	return result;
    }
    
    // 부모 위반 내역 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminparviollist.action", method = RequestMethod.GET) 
    public String adminParViolList(Model model, HttpSession session) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("admin", dto);
    	
    	String result = null;
    	
    	ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
    	
    	
    	
    	result = "WEB-INF/view/adminParViolList.jsp";
    	
    	return result;
    }
	
	// 관리자 검증 메소드
	private boolean isAdmin(HttpSession session)
    {
        return session.getAttribute("loginAdmin") != null;
    }
    private AdminDTO getLoginAdmin(HttpSession session)
    {
        return (AdminDTO) session.getAttribute("loginAdmin");
    }
}
