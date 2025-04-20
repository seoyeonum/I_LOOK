/*=============================
	GenReqController
=============================*/

package com.team1.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.team1.dto.ChildDTO;
import com.team1.dto.GenPayDTO;
import com.team1.dto.GenRegDTO;
import com.team1.dto.GradesDTO;
import com.team1.dto.SitCertDTO;
import com.team1.dto.WorkRegionPreferedDTO;
import com.team1.mybatis.IChildDAO;
import com.team1.mybatis.IGenRegDAO;
import com.team1.mybatis.IGradesDAO;
import com.team1.mybatis.ISitCertDAO;
import com.team1.mybatis.IWorkRegionPreferedDAO;
import com.team1.util.PageHandler;

@Controller
public class GenReqController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value="/genmain.action", method = RequestMethod.GET)
	public String genMain(@RequestParam("id") String id, HttpSession session, Model model)
	{
		String result = null;
		
		// 부모 id 기반으로 아이 이름 조회
		IChildDAO ChildDao = sqlSession.getMapper(IChildDAO.class);
		ArrayList<ChildDTO> listName = new ArrayList<ChildDTO>();
		listName = ChildDao.listName(id);
		
		model.addAttribute("listName", listName);
		session.setAttribute("id", id);
		
		result = "WEB-INF/view/genMain.jsp";
		return result;
	}
	
	@RequestMapping(value="/gensearchresult.action", method = RequestMethod.POST)
	public String genSearchResult(@RequestParam("child_backup_id") String childBackupId, GenRegDTO dto
								, @RequestParam(value = "page", defaultValue="1") int page
								, Model model, HttpSession session)
	{
		String result = null;
		
		// 입력값 기반으로 1차 필터 유지
		IChildDAO childDao = sqlSession.getMapper(IChildDAO.class);
		ArrayList<ChildDTO> listName = new ArrayList<ChildDTO>();
		String id = (String) session.getAttribute("id");
		listName = childDao.listName(id);
		
		model.addAttribute("listName", listName);
		model.addAttribute("childBackupId", childBackupId);
		model.addAttribute("dateStart", dto.getStart_date());
		model.addAttribute("dateEnd", dto.getEnd_date());
		model.addAttribute("timeStart", dto.getStart_time());
		model.addAttribute("timeEnd", dto.getEnd_time());
		
		// 세션에 필터 값 저장 (추가)
	    session.setAttribute("childBackupId", childBackupId);
	    session.setAttribute("dateStart", dto.getStart_date());
	    session.setAttribute("dateEnd", dto.getEnd_date());
	    session.setAttribute("timeStart", dto.getStart_time());
	    session.setAttribute("timeEnd", dto.getEnd_time());
		
		// 입력값 기반으로 1차 필터 수행 결과 건수
		IGenRegDAO RegDao = sqlSession.getMapper(IGenRegDAO.class);
		int countPrimaryGenReg = RegDao.countPrimaryGenReg(dto);
		
		// 페이징 객체 생성
	    PageHandler paging = new PageHandler(page, countPrimaryGenReg);
	    
	    // DTO에 페이징 정보 추가
	    dto.setStart(paging.getStart());
	    dto.setEnd(paging.getEnd());
		
		// 입력값 기반으로 1차 필터 수행 결과 리스트
		//IGenRegDAO RegDao = sqlSession.getMapper(IGenRegDAO.class);
		ArrayList<GenRegDTO> listPrimaryGenReg = new ArrayList<GenRegDTO>();
		listPrimaryGenReg = RegDao.listPrimaryGenReg(dto);
		
		
		// 각 일반 돌봄 근무 등록에서 시터 백업코드 추출
		// → 보유 자격증 map 에 담기
		// → 
		
		
		// 각 일반 돌봄 근무 건에서 근무 등록 코드 추출
		// → 선호 근무 지역 담기
		// → 선호 돌봄 연령대 담기
		
		ArrayList<String> listCert = new ArrayList<String>();
		
		// 각 일반 돌봄 근무 등록에서 sitBackupId 추출하여 추가 정보 가져오기
	    for (GenRegDTO genReg : listPrimaryGenReg)
	    {
	    	// 1. sitBackupId로 보유 자격증 조회
	        String sitBackupId = genReg.getSit_backup_id();
        
	        ISitCertDAO certDao = sqlSession.getMapper(ISitCertDAO.class);
	        ArrayList<String> certs = certDao.listSitCert(sitBackupId);
	        genReg.setCertList(certs); 		// 각 시터 돌봄 건에 개별 자격증 리스트 설정
	        
	        // 2. genRegId로 시터 선호 근무 지역 조회
	        String genRegId = genReg.getGen_reg_id();
	        
	        //IGenRegDAO RegDao = sqlSession.getMapper(IGenRegDAO.class);
	        List<String> regions = RegDao.listSitPreferedRegion(genRegId);
			genReg.setRegionList(regions); 	// 각 시터 돌봄 건에 선호 근무 지역 리스트 설정
			
	        
	    }
		
	    model.addAttribute("countPrimaryGenReg", countPrimaryGenReg);
	    model.addAttribute("listPrimaryGenReg", listPrimaryGenReg);
	    model.addAttribute("listCert", listCert);
	    model.addAttribute("paging", paging);
	    
		// 2차 필터 등급 범례 리스트
	    IGradesDAO gradeDao = sqlSession.getMapper(IGradesDAO.class);
	  	ArrayList<GradesDTO> listGrade = new ArrayList<GradesDTO>();
	  	listGrade = gradeDao.listGrade();
	    
	    // 2차 필터 지역 범례 리스트
	  	IWorkRegionPreferedDAO regionDao = sqlSession.getMapper(IWorkRegionPreferedDAO.class);
	  	ArrayList<WorkRegionPreferedDTO> listAllRegions = new ArrayList<WorkRegionPreferedDTO>();
	  	listAllRegions = regionDao.listAllRegions();
	    
	  	// 2차 필터 자격증 범례 리스트
	  	ISitCertDAO certDao = sqlSession.getMapper(ISitCertDAO.class);
	  	ArrayList<SitCertDTO> listCertType = new ArrayList<SitCertDTO>();
	  	listCertType = certDao.listCertType();
	  	
	    model.addAttribute("listGrade", listGrade);
	    model.addAttribute("listAllRegions", listAllRegions);
	    model.addAttribute("listCertType", listCertType);

	    // 확인
		//System.out.println("countPrimaryGenReg: " + countPrimaryGenReg);
		//System.out.println("listPrimaryGenReg size: " + listPrimaryGenReg.size());
		
		result = "WEB-INF/view/genSearchResult.jsp";
		
		return result;
	}
	
	@RequestMapping(value = "/genregpossiblelist.action", method = RequestMethod.POST)
	//@ResponseBody
	public String genRegList(//@RequestParam("child_backup_id") String childBackupId, GenRegDTO dto
						   //, @RequestParam(value = "page", defaultValue="1") int page
						    @RequestParam(value = "grades", required = false) List<String> grades
				           , @RequestParam(value = "regions", required = false) List<String> regions
				           , @RequestParam(value = "genders", required = false) List<String> genders
				           , @RequestParam(value = "ages", required = false) List<String> ages
				           , @RequestParam(value = "certs", required = false) List<String> certs
				           , HttpServletResponse response, Model model, HttpSession session )
	{
		String result = null;
	    
		// 응답 → 한글 인코딩 설정
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    
	    // 입력값 기반으로 1차 필터 값 전달
 		//IChildDAO childDao = sqlSession.getMapper(IChildDAO.class);
 		//ArrayList<ChildDTO> listName = new ArrayList<ChildDTO>();
 		//String id = (String) session.getAttribute("id");
 		//listName = childDao.listName(id);
 		
 		//model.addAttribute("listName", listName);
 		//model.addAttribute("childBackupId", childBackupId);
 		//model.addAttribute("dateStart", dto.getStart_date());
 		//model.addAttribute("dateEnd", dto.getEnd_date());
 		//model.addAttribute("timeStart", dto.getStart_time());
 		//model.addAttribute("timeEnd", dto.getEnd_time());
	 		
		// 2차 필터 선택 항목 확인
	    //System.out.println("Grades: " + grades);
	    //System.out.println("Regions: " + regions);
	    //System.out.println("Genders: " + genders);
	    //System.out.println("Ages: " + ages);
	    //System.out.println("Certs: " + certs);
	    
	    try
	    {
	    	// 세션에서 1차 필터 정보 가져오기
	        GenRegDTO dto = new GenRegDTO();
	        dto.setStart_date((String) session.getAttribute("dateStart"));
	        dto.setEnd_date((String) session.getAttribute("dateEnd"));
	        dto.setStart_time((Integer) session.getAttribute("timeStart"));
	        dto.setEnd_time((Integer) session.getAttribute("timeEnd"));
	        
	    	// (커다란) map 에 수신 받은 매개변수 추가(put)
	        Map<String, Object> params = new HashMap<String, Object>();
	        
	        params.put("start_date", dto.getStart_date());
	        params.put("end_date", dto.getEnd_date());
	        params.put("start_time", dto.getStart_time());
	        params.put("end_time", dto.getEnd_time());
	        
	        if (grades != null)
	        	params.put("grades", grades);
	        if (regions != null)
	        	params.put("regions", regions);
	        if (genders != null)
	        	params.put("genders", genders);
	        if (ages != null)
	        	params.put("ages", ages);
	        if (certs != null)
	        	params.put("certs", certs);

			// 위 map 을 2차 필터 쿼리의 params 로 제공
			IGenRegDAO regDao = sqlSession.getMapper(IGenRegDAO.class);
	        ArrayList<GenRegDTO> listSecondaryGenReg = regDao.listSecondaryGenReg(params);
	        
	        // 모델에 데이터 추가
	        model.addAttribute("listSecondaryGenReg", listSecondaryGenReg);
	        model.addAttribute("countSecondaryGenReg", listSecondaryGenReg.size());
	        
	        // 1차 필터 결과도 모델에 추가
	        model.addAttribute("listPrimaryGenReg", listSecondaryGenReg); // 2차 필터 결과로 대체
	        model.addAttribute("countPrimaryGenReg", listSecondaryGenReg.size());
	        
	        // JSP 파일 반환
	        return "WEB-INF/view/genRegListFragment.jsp";
	        
	        /*
	        // 위 쿼리의 결과(ArrayList<GenRegDTO>)를 html 조각으로 변환
	        StringBuilder htmlBuilder = new StringBuilder();
	        
	        htmlBuilder.append("");
	        htmlBuilder.append("");
	        htmlBuilder.append("");
	        htmlBuilder.append("");
	        htmlBuilder.append("");
	        htmlBuilder.append("");
	        
	        
	        result = htmlBuilder.toString();
	        return result;
	        */
	    }
	    catch (Exception e)
	    {
	        e.printStackTrace();
	        result = "<div class='error'>필터링 중 오류가 발생했습니다: " + e.getMessage() + "</div>";
	        return result;
	    }
	    
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
		
		System.out.println("Session ID: " + session.getId());
		System.out.println("Parent ID in Session: " + session.getAttribute("id"));
		
		return result;
	}
	
}