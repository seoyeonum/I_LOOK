package com.team1.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.team1.dto.AdminDTO;
import com.team1.dto.AgesPreferedDTO;
import com.team1.dto.GenRegDTO;
import com.team1.dto.GenReqDTO;
import com.team1.dto.GradesDTO;
import com.team1.dto.SitCertDTO;
import com.team1.dto.WorkRegionPreferedDTO;
import com.team1.mybatis.IAgesPreferedDAO;
import com.team1.mybatis.IGenRegDAO;
import com.team1.mybatis.IGenReqDAO;
import com.team1.mybatis.IGradesDAO;
import com.team1.mybatis.ISitCertDAO;
import com.team1.mybatis.IWorkRegionPreferedDAO;
import com.team1.util.PageHandler;


@Controller
public class AdminServiceController
{

	@Autowired
	private SqlSession sqlSession;
	
	// 상단 서비스관리 및 사이드바 근무 등록 내역(기본값)으로 이동 및 데이터 전송
	@RequestMapping(value = "/admingenreglist.action", method = RequestMethod.GET)
	public String adminGenRegList(@RequestParam(value = "page", defaultValue="1") int page
								, @RequestParam(value = "searchKey", required = false) String searchKey 
								, @RequestParam(value = "searchValue", required = false) String searchValue 
								, @RequestParam(value = "currentOnly", defaultValue = "false") Boolean currentOnly 
								, Model model, HttpSession session)
	{
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);

        IGenRegDAO dao = sqlSession.getMapper(IGenRegDAO.class);
        
        // 근무 등록 개수
        int totalCount = dao.adminCountSitGenReg(searchKey, searchValue, currentOnly);
        
        // 페이징 처리 객체 생성
        PageHandler paging = new PageHandler(page, totalCount);
        		
        // 근무 등록 내역 목록 조회
        List<GenRegDTO> genRegList = dao.adminListSitGenReg(paging.getStart(), paging.getEnd(), searchKey, searchValue, currentOnly);
        
        // 모델에 데이터 담기
        model.addAttribute("genRegList", genRegList);
        model.addAttribute("paging", paging);
        model.addAttribute("searchKey", searchKey);
        model.addAttribute("searchValue", searchValue);
        model.addAttribute("currentOnly", currentOnly);
		
		return "WEB-INF/view/adminGenRegList.jsp";
	}
	
	// 시터 근무등록 ajax 처리
	@RequestMapping(value = "/admingenreglistajax.action", method = RequestMethod.GET)
	public String adminGenRegListAjax(@RequestParam(value = "page", defaultValue="1") int page
								, @RequestParam(value = "searchKey", required = false) String searchKey 
								, @RequestParam(value = "searchValue", required = false) String searchValue 
								, @RequestParam(value = "currentOnly", defaultValue = "false") Boolean currentOnly 
								, Model model, HttpSession session)
	{
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);

        IGenRegDAO dao = sqlSession.getMapper(IGenRegDAO.class);
        
        // 근무 등록 개수
        int totalCount = dao.adminCountSitGenReg(searchKey, searchValue, currentOnly);
        
        // 페이징 처리 객체 생성
        PageHandler paging = new PageHandler(page, totalCount);
        		
        // 근무 등록 내역 목록 조회
        List<GenRegDTO> genRegList = dao.adminListSitGenReg(paging.getStart(), paging.getEnd(), searchKey, searchValue, currentOnly);
        
        // 모델에 데이터 담기
        model.addAttribute("genRegList", genRegList);
        model.addAttribute("paging", paging);
		
		return "WEB-INF/view/adminGenRegListAjax.jsp";
	}
	
	
	
	// 시터 등록요청 상세정보 페이지로 이동 및 데이터 전송
    @RequestMapping(value = "/admingenregdetail.action", method = RequestMethod.GET) 
    public String adminSitRegDetail(String sit_reg_id, String gen_reg_id, Model model, HttpSession session)
    {
    	// 관리자 확인 절차
	    if (!isAdmin(session))
		    return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("loginAdmin", dto);
		
		IGenRegDAO genReg = sqlSession.getMapper(IGenRegDAO.class);
		ISitCertDAO sitCert = sqlSession.getMapper(ISitCertDAO.class);
    	IAgesPreferedDAO ages = sqlSession.getMapper(IAgesPreferedDAO.class);
    	IWorkRegionPreferedDAO regions = sqlSession.getMapper(IWorkRegionPreferedDAO.class);
		
    	// 시터 근무등록 정보, 자격증, 선호 연령대, 활동 가능 지역
    	GenRegDTO genRegInfo = genReg.adminSitGenRegDetail(gen_reg_id);
    	List<SitCertDTO> certInfo = sitCert.search(sit_reg_id);
    	ArrayList<AgesPreferedDTO> age = ages.listAges(gen_reg_id);
    	WorkRegionPreferedDTO region = regions.listRegions(gen_reg_id);
    	
    	model.addAttribute("genRegInfo", genRegInfo);
    	model.addAttribute("sitCertList", certInfo);
    	model.addAttribute("age", age);
    	model.addAttribute("region", region);
    	
    	return "WEB-INF/view/adminGenRegDetail.jsp"; 
    }
	
	// 임금내역으로 이동 및 데이터 전송
	@RequestMapping(value = "/adminwagelist.action", method = RequestMethod.GET)
	public String wageList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
			return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("loginAdmin", dto);
		
		result = "WEB-INF/view/adminWageList.jsp";
		
		return result;
	}
	
	// 예약신청내역 공통 리스트 준비 메서드( + ajax)
	private Map<String, Object> prepareGenReqList(String careType, String statusFilter, String searchKey
											    , String searchValue, String dateRange, int page)
	{
	    Map<String, Object> params = new HashMap<>();
	    String dateRangeStart = null;

	    if (!"allDay".equals(dateRange)) 
	    {
	        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	        Calendar cal = Calendar.getInstance();

	        switch (dateRange) 
	        {
	            case "week": cal.add(Calendar.DATE, -7); break;
	            case "month": cal.add(Calendar.MONTH, -1); break;
	            case "3month": cal.add(Calendar.MONTH, -3); break;
	        }
	        dateRangeStart = sdf.format(cal.getTime());
	    }

	    params.put("statusFilter", statusFilter);
	    params.put("searchKey", searchKey);
	    params.put("searchValue", searchValue);
	    params.put("dateRange", dateRange);
	    params.put("dateRangeStart", dateRangeStart);

	    IGenReqDAO reqDao = sqlSession.getMapper(IGenReqDAO.class);

	    int totalCount = reqDao.adminCountGenReq(params);
	    PageHandler paging = new PageHandler(page, totalCount);

	    params.put("start", paging.getStart());
	    params.put("end", paging.getEnd());

	    List<GenReqDTO> list = reqDao.adminListSitGenReg(params);

	    Map<String, Object> result = new HashMap<>();
	    result.put("list", list);
	    result.put("paging", paging);

	    return result;
	}
	
	// 예약신청내역으로 이동 및 데이터 전송
	@RequestMapping(value = "/adminreqlist.action", method = RequestMethod.GET)
	public String adminReqList(Model model, HttpSession session
	                         , @RequestParam(defaultValue="normal") String careType
	                         , @RequestParam(defaultValue="all") String statusFilter
	                         , @RequestParam(required=false) String searchKey
	                         , @RequestParam(required=false) String searchValue
	                         , @RequestParam(defaultValue="allDay") String dateRange
	                         , @RequestParam(defaultValue="1") int page)
	{
	    // 관리자 로그인 체크
	    if (!isAdmin(session))
	        return "redirect:/loginform.action";

	    AdminDTO dto = getLoginAdmin(session);
	    model.addAttribute("loginAdmin", dto);

	    
	    // 공통 메서드 호출
	    Map<String, Object> result = prepareGenReqList(careType, statusFilter, searchKey, searchValue, dateRange, page);


	    // model 세팅
	    model.addAttribute("list", result.get("list"));
	    model.addAttribute("careType", careType);
	    model.addAttribute("statusFilter", statusFilter);
	    model.addAttribute("searchKey", searchKey);
	    model.addAttribute("searchValue", searchValue);
	    model.addAttribute("dateRange", dateRange);
	    model.addAttribute("paging", result.get("paging"));
	    
	    return "WEB-INF/view/adminReqList.jsp";
	}
	
	// 예약내역 ajax 처리
	@RequestMapping(value = "/admingenreqlistajax.action", method = RequestMethod.GET)
	public String adminGenReqListAjax(Model model
	                                , @RequestParam(defaultValue="normal") String careType
	                                , @RequestParam(defaultValue="all") String statusFilter
	                                , @RequestParam(required=false) String searchKey
	                                , @RequestParam(required=false) String searchValue
	                                , @RequestParam(defaultValue="allDay") String dateRange
	                                , @RequestParam(defaultValue="1") int page)
	{
		 // 공통 메서드 호출
	    Map<String, Object> result = prepareGenReqList(careType, statusFilter, searchKey, searchValue, dateRange, page);

	    model.addAttribute("list", result.get("list"));
	    model.addAttribute("paging", result.get("paging"));

	    return "WEB-INF/view/adminReqListAjax.jsp";
	}

	// 예약신청 내역 상세보기로 이동 및 데이터 전송
	@RequestMapping(value = "/admingenreqdetail.action", method = RequestMethod.GET)
	public String adminGenReqDetail(@RequestParam(defaultValue="normal") String careType
			 						, String gen_req_id, Model model, HttpSession session)
	{
		// 관리자 확인 절차
		if (!isAdmin(session))
			return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("loginAdmin", dto);
		
		IGenReqDAO dao = sqlSession.getMapper(IGenReqDAO.class);
		
		GenReqDTO genReq = dao.adminSearch(gen_req_id);
		
		model.addAttribute("genReq", genReq);
		
		return "WEB-INF/view/adminGenReqDetail.jsp";
	}
	
	// 결제내역으로 이동 및 데이터 전송
	@RequestMapping(value = "/adminpayreclist.action", method = RequestMethod.GET)
	public String adminPayRecList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
			return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("loginAdmin", dto);
		
		result = "WEB-INF/view/adminPayRecList.jsp";
		
		return result;
	}
	
	// 포인트 변동 내역으로 이동 및 데이터 전송
	@RequestMapping(value = "/adminpointlist.action", method = RequestMethod.GET)
	public String adminPointList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
			return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("loginAdmin", dto);
		
		result = "WEB-INF/view/adminPointList.jsp";
		
		return result;
	}
	
	
	// 등급 목록으로 이동 및 데이터 전송
	@RequestMapping(value = "/gradelist.action", method = RequestMethod.GET)
	public String gradeList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);
		        
		IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
		
		model.addAttribute("grade", dao.listGrade());
		
		result = "WEB-INF/view/gradeList.jsp";
		
		return result;
	}
	
	// 등급 추가 폼으로 이동 및 데이터 전송
	@RequestMapping(value = "/gradeinsertform.action", method = RequestMethod.GET)
	public String gradeInsertForm(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);
		
		result = "WEB-INF/view/gradeInsertForm.jsp";
		
		return result;
	}
	
	// 등급 추가
	@RequestMapping(value = "/gradeinsert.action", method = RequestMethod.POST)
	public String addGrade(GradesDTO grade, @RequestParam("uploadFile") MultipartFile uploadFile 
            			 , HttpServletRequest request, Model model, HttpSession session) throws Exception
	{
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);
		        
		String result = null;
		
		// 파일 업로드 처리
		// 업로드 경로 지정 (/WebContent/images/grades/)
		String uploadDir = request.getServletContext().getRealPath("/images/grades");
		
		File dir = new File(uploadDir);
		if (!dir.exists())
			dir.mkdirs();
		
		try
	    {
	        // Spring의 MultipartFile을 사용하여 파일 처리
	        if (!uploadFile.isEmpty())
	        {
	            // 원본 파일 이름 가져오기
	            String fileName = uploadFile.getOriginalFilename();
	            
	            // 파일 저장
	            File saveFile = new File(uploadDir, fileName);
	            uploadFile.transferTo(saveFile);
	            
	            //System.out.println("업로드된 파일 이름: " + fileName);
	            //System.out.println("업로드된 파일 경로 : " + uploadDir);
	            // 파일 경로를 DTO의 file_path에 설정
	            grade.setFile_path("images/grades/" + fileName);
	        }
	        
	        IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
	        dao.addGrade(grade);
	        
	        result = "redirect:gradelist.action";
	    }
	    catch (Exception e)
	    {
	        System.out.println("파일 업로드 중 오류 발생: " + e.getMessage());
	    }
		
		return result;
	}
	
	// 등급 수정 폼으로 이동 및 데이터 전송
	@RequestMapping(value = "/gradeupdateform.action", method = RequestMethod.GET)
	public String updateForm(String grade_id, Model model, HttpSession session)
	{
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);
		        
		String result = null;
		
		IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
		
		model.addAttribute("grade", dao.searchGrade(grade_id));
		
		result = "WEB-INF/view/gradeUpdateForm.jsp";
		
		return result;
	}
	
	// 등급 업데이트
	@RequestMapping(value = "/gradeupdate.action", method = RequestMethod.POST)
	public String updateGrade(GradesDTO grade, @RequestParam("uploadFile") MultipartFile uploadFile 
            			 , HttpServletRequest request, Model model, HttpSession session) throws Exception
	{
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);
		        
		String result = null;
		
		// 파일 업로드 처리
		// 업로드 경로 지정 (/WebContent/images/grades/)
		String uploadDir = request.getServletContext().getRealPath("/images/grades");
		
		
		// 폴더 없으면 해당위치에 폴더 생성
		File dir = new File(uploadDir);
		if (!dir.exists())
			dir.mkdirs();
		
		try
	    {
	        // Spring의 MultipartFile을 사용하여 파일 처리
	        if (!uploadFile.isEmpty())
	        {
	            // 원본 파일 이름 가져오기
	            String fileName = uploadFile.getOriginalFilename();
	            
	            // 파일 저장
	            File saveFile = new File(uploadDir, fileName);
	            uploadFile.transferTo(saveFile);
	            
				
				  // System.out.println("업로드된 파일 이름: " + fileName);
				  // System.out.println("업로드된 파일 경로 : " + uploadDir);
				  // 파일 경로를 DTO의 file_path에 설정
	            grade.setFile_path("images/grades/" + fileName);
	        }
	        
	        IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
	        dao.modifyGrade(grade);
	        
	        result = "redirect:gradelist.action";
	    }
	    catch (Exception e)
	    {
	        System.out.println("파일 업로드 중 오류 발생: " + e.getMessage());
	    }
		
		return result;
	}
	// 등급 삭제
	@RequestMapping(value = "/gradedelete.action", method = RequestMethod.GET)
	public String gradeDelete(String grade_id, Model model, HttpSession session)
	{
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);
		        
		String result = null;
	    
		IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
		
		dao.removeGrade(grade_id);
		
		result = "redirect:gradelist.action";
		
		return result;
	}
	
	
	
	// 시급 목록으로 이동
	@RequestMapping(value = "/hourlywagelist.action", method = RequestMethod.GET)
	public String hourlywageList(Model model, HttpSession session)
	{
		// 관리자 확인 절차
		if (!isAdmin(session))
	    	return "redirect:/loginform.action";
	    AdminDTO dto = getLoginAdmin(session);
	    model.addAttribute("loginAdmin", dto);
			    
		String result = null;
		
		IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
		
		model.addAttribute("genWage", dao.listGenWage());
		model.addAttribute("emgWage", dao.listEmgWage());
		
		result = "WEB-INF/view/hourlyWageList.jsp";
		
		return result;
	}
	
	// 시급 수정폼으로 이동 및 데이터 전송
	@RequestMapping(value = "/wageupdateform.action", method = RequestMethod.GET)
	public String wageUpdateForm(String type, String id, Model model, HttpSession session)
	{
		// 관리자 확인 절차
		if (!isAdmin(session))
	    	return "redirect:/loginform.action";
	    AdminDTO dto = getLoginAdmin(session);
	    model.addAttribute("loginAdmin", dto);
		        
		String result = null;
			
		IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
		
		if (type.equals("gen"))
		{
			model.addAttribute("genWage", dao.listGenWage());
		}
		else if (type.equals("emg"))
		{
			model.addAttribute("emgWage", dao.listEmgWage());
		}
		model.addAttribute("type", type);
		
		result = "WEB-INF/view/wageUpdateForm.jsp";
		
		return result;
	}
	
	// 시급 수정
	@RequestMapping(value = "/wageupdate.action", method = RequestMethod.POST)
	public String wageUpdate(String type, GradesDTO grades, Model model, HttpSession session)
	{
		// 관리자 확인 절차
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);
		        
		String result = null;
	    
		IGradesDAO dao = sqlSession.getMapper(IGradesDAO.class);
		
		if (type.equals("gen"))
		{
			dao.modifyGenWage(grades);
		}
		else if (type.equals("emg"))
		{
			dao.modifyEmgWage(grades);
		}
		
		result = "redirect:hourlywagelist.action";
		
		return result;
	}
	
	// 공지사항으로 이동 및 데이터 전송
	/*
	@RequestMapping(value = "/noticelist.action", method = RequestMethod.GET)
	public String noticeList(Model model, HttpSession session)
	{
		String result = null;
		
		// 관리자 확인 절차
		if (!isAdmin(session))
			return "redirect:/loginform.action";
		AdminDTO dto = getLoginAdmin(session);
		model.addAttribute("loginAdmin", dto);
		
		result = "WEB-INF/view/noticeList.jsp";
		
		return result;
	}
	*/
	
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
	

