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
import com.team1.dto.DocRegDTO;
import com.team1.dto.ParDTO;
import com.team1.dto.SitCertDTO;
import com.team1.dto.SitDTO;
import com.team1.dto.SitRejectDTO;
import com.team1.mybatis.IDocRegDAO;
import com.team1.mybatis.IParDAO;
import com.team1.mybatis.ISitCertDAO;
import com.team1.mybatis.ISitDAO;
import com.team1.mybatis.ISitRejectDAO;
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
		model.addAttribute("loginAdmin", dto);
		  
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
    public String adminSitRegDetail(String sit_backup_id, Model model, HttpSession session)
    {
    	// 관리자 확인 절차
	    if (!isAdmin(session))
		    return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("loginAdmin", dto);
		
    	ISitDAO sitDao = sqlSession.getMapper(ISitDAO.class);
    	IDocRegDAO docRegDao = sqlSession.getMapper(IDocRegDAO.class);
    	ISitCertDAO sitCertDao = sqlSession.getMapper(ISitCertDAO.class);
    	ISitRejectDAO rejectDao = sqlSession.getMapper(ISitRejectDAO.class);
    	
    	// 시터 개인정보, 자격증, 제출서류 정보, 거절사유 리스트
    	SitDTO sitInfo = sitDao.searchSitRegDetail(sit_backup_id);
    	List<DocRegDTO> sitDoc = docRegDao.search(sit_backup_id);
    	List<SitCertDTO> sitCert = sitCertDao.search(sit_backup_id);
    	List<SitRejectDTO> rejectList = rejectDao.listRejectedReasons();
    	
    	model.addAttribute("sitInfo", sitInfo);
    	model.addAttribute("sitDocList", sitDoc);
    	model.addAttribute("sitCertList", sitCert);
    	model.addAttribute("rejectList", rejectList);
    	
    	return "WEB-INF/view/adminSitRegDetail.jsp"; 
    }
    
    // 시터 등록요청 승인
    @RequestMapping(value = "/sitreginsert.action", method = RequestMethod.POST) 
    public String adminSitRegInsert(Model model, HttpSession session, String sit_backup_id) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	
    	ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
    	dao.sitChk(sit_backup_id);
    	
        return "redirect:/adminsitreglist.action";
    }
    
    // 시터 등록요청 거절
    @RequestMapping(value = "/sitregreject.action", method = RequestMethod.POST) 
    public String adminSitRegReject(Model model, HttpSession session, SitRejectDTO rejectDto) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	
    	// 거절 사유 리스트 불러오기
    	ISitRejectDAO dao = sqlSession.getMapper(ISitRejectDAO.class);
    	
    	dao.rejectSit(rejectDto);
    	
    	return "redirect:/adminsitreglist.action";
    }
    
    
    // 시터 거절 내역 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminsitrejectedlist.action", method = RequestMethod.GET) 
    public String adminSitRejectedList(Model model, HttpSession session
						    		, @RequestParam(value = "page", defaultValue="1") int page
									, @RequestParam(value = "searchKey", required = false) String searchKey 
									, @RequestParam(value = "searchValue", required = false) String searchValue ) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("loginAdmin", dto);
    	
    	String result = null;
    	
		ISitRejectDAO dao = sqlSession.getMapper(ISitRejectDAO.class);
		
		// 총 등록 요청 수
		int totalCount = dao.countSitRej(searchKey, searchValue);
        
		PageHandler paging = new PageHandler(page, totalCount);
		
		// 거절된 시터 목록 가져오기 (검색+페이징)
        List<SitRejectDTO> sitRejectList = dao.listSitRej(paging.getStart(), paging.getEnd(), searchKey, searchValue);
        
        model.addAttribute("sitRejectList", sitRejectList);
        model.addAttribute("paging", paging);
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
    	
    	result = "WEB-INF/view/adminSitRejectedList.jsp";
    	
    	return result;
    }
    
    // 시터 회원 정보 목록 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminsitlist.action", method = RequestMethod.GET) 
    public String adminSitList(@RequestParam(value = "page", defaultValue="1") int page
							, @RequestParam(value = "searchKey", required = false) String searchKey 
							, @RequestParam(value = "searchValue", required = false) String searchValue 
							, Model model, HttpSession session)
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("loginAdmin", dto);
    	
		ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
		
		// 총 등록 요청 수
		int totalCount = dao.countSit(searchKey, searchValue);
        
		PageHandler paging = new PageHandler(page, totalCount);
		
        List<SitDTO> sitList = dao.list(paging.getStart(), paging.getEnd(), searchKey, searchValue);
        
        model.addAttribute("sitList", sitList);
        model.addAttribute("paging", paging);
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
    	
    	return "WEB-INF/view/adminSitList.jsp";
    }
    
    // 시터 상세정보 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminsitdetail.action", method = RequestMethod.GET) 
    public String adminSitDetail(String sit_backup_id, Model model, HttpSession session)
    {
    	// 관리자 확인 절차
	    if (!isAdmin(session))
		    return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("loginAdmin", dto);
		
    	ISitDAO sitDao = sqlSession.getMapper(ISitDAO.class);
    	IDocRegDAO docRegDao = sqlSession.getMapper(IDocRegDAO.class);
    	ISitCertDAO sitCertDao = sqlSession.getMapper(ISitCertDAO.class);
    	
    	// 시터 개인정보, 자격증, 제출서류 정보
    	SitDTO sitInfo = sitDao.adminSearchSitDetail(sit_backup_id);
    	List<DocRegDTO> sitDoc = docRegDao.search(sit_backup_id);
    	List<SitCertDTO> sitCert = sitCertDao.search(sit_backup_id);
    	
    	model.addAttribute("sitInfo", sitInfo);
    	model.addAttribute("sitDocList", sitDoc);
    	model.addAttribute("sitCertList", sitCert);
    	
    	return "WEB-INF/view/adminSitDetail.jsp"; 
    }
    
    // 부모 회원 정보 목록 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminparlist.action", method = RequestMethod.GET) 
    public String adminParList(@RequestParam(value = "page", defaultValue="1") int page
							 , @RequestParam(value = "searchKey", required = false) String searchKey 
							 , @RequestParam(value = "searchValue", required = false) String searchValue 
							 , Model model, HttpSession session)
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("loginAdmin", dto);
    	
    	String result = null;
    	
    	IParDAO dao = sqlSession.getMapper(IParDAO.class);
    	
    	// 총 등록 요청 수
		int totalCount = dao.adminCountPar(searchKey, searchValue);
        
		PageHandler paging = new PageHandler(page, totalCount);
		
        List<ParDTO> parList = dao.adminListPar(paging.getStart(), paging.getEnd(), searchKey, searchValue);
        
        model.addAttribute("parList", parList);
        model.addAttribute("paging", paging);
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
    	
    	result = "WEB-INF/view/adminParList.jsp";
    	
    	return result;
    }
    
    // 부모 회원 정보 목록 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminpardetail.action", method = RequestMethod.GET) 
    public String adminParDetail(Model model, HttpSession session) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("loginAdmin", dto);
    	
    	
    	IParDAO dao = sqlSession.getMapper(IParDAO.class);
    	
    	
    	return "WEB-INF/view/adminParDetail.jsp";
    }
    
    // 아이 정보 목록 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/adminchildlist.action", method = RequestMethod.GET) 
    public String adminChildList(Model model, HttpSession session) 
    { 
    	// 관리자 확인 절차
    	if (!isAdmin(session))
    		return "redirect:/loginform.action";
    	AdminDTO dto = getLoginAdmin(session);
    	model.addAttribute("loginAdmin", dto);
    	
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
    	model.addAttribute("loginAdmin", dto);
    	
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
    	model.addAttribute("loginAdmin", dto);
    	
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
