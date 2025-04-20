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
	public String genSearchResult(@RequestParam("child_backup_id") String childBackupId
								, GenRegDTO dto
								, @RequestParam(value = "page", defaultValue="1") int page
								, Model model
								, HttpSession session)
	{
		String result = null;
		
		// 입력값 기반으로 1차 필터 유지
		IChildDAO childDao = sqlSession.getMapper(IChildDAO.class);
		ArrayList<ChildDTO> listName = new ArrayList<ChildDTO>();
		String id = (String) session.getAttribute("id");
		listName = childDao.listName(id);
		
		// (이전 페이지에서 건넨 값을 다음 페이지로 전달)
		model.addAttribute("listName", listName);
		model.addAttribute("childBackupId", childBackupId);
		model.addAttribute("dateStart", dto.getStart_date());
		model.addAttribute("dateEnd", dto.getEnd_date());
		model.addAttribute("timeStart", dto.getStart_time());
		model.addAttribute("timeEnd", dto.getEnd_time());
		
		// (추가로 세션에 필터 값 저장)
	    session.setAttribute("childBackupId", childBackupId);
	    session.setAttribute("dateStart", dto.getStart_date());
	    session.setAttribute("dateEnd", dto.getEnd_date());
	    session.setAttribute("timeStart", dto.getStart_time());
	    session.setAttribute("timeEnd", dto.getEnd_time());
		
	    //----------------------------------------------------------------
	    
		// 입력값 기반으로 1차 필터 수행 결과 건수
		IGenRegDAO RegDao = sqlSession.getMapper(IGenRegDAO.class);
		int countPrimaryGenReg = RegDao.countPrimaryGenReg(dto);

		// 페이징 객체 생성
	    PageHandler paging = new PageHandler(page, countPrimaryGenReg);
	    
	    // (이전 페이지에서 건네 받은) dto 에 페이징 정보 추가
	    dto.setStart(paging.getStart());
	    dto.setEnd(paging.getEnd());
	    
	    // 입력값 기반으로 1차 필터 수행 결과 리스트
	    ArrayList<GenRegDTO> listPrimaryGenReg = new ArrayList<GenRegDTO>();
	    listPrimaryGenReg = RegDao.listPrimaryGenReg(dto);
		
		// GenRegDTO 리스트(listPrimaryGenReg) ← 자격증 및 지역 정보 추가
		// → 『setCertAndRegion』 메소드 호출
		setCertAndRegion(listPrimaryGenReg);
		
		// 다음 페이지로 넘겨주는 값
		// → 1차 필터 결과 리스트 건수, 리스트, 페이징 객체 
	    model.addAttribute("countPrimaryGenReg", countPrimaryGenReg);
	    model.addAttribute("listPrimaryGenReg", listPrimaryGenReg);
	    model.addAttribute("paging", paging);
	    
	    //----------------------------------------------------------------
	    
		// 2차 필터 범례 리스트 - 등급
	    IGradesDAO gradeDao = sqlSession.getMapper(IGradesDAO.class);
	  	ArrayList<GradesDTO> listGrade = new ArrayList<GradesDTO>();
	  	listGrade = gradeDao.listGrade();
	    
	    // 2차 필터 범례 리스트 - 지역
	  	IWorkRegionPreferedDAO regionDao = sqlSession.getMapper(IWorkRegionPreferedDAO.class);
	  	ArrayList<WorkRegionPreferedDTO> listAllRegions = new ArrayList<WorkRegionPreferedDTO>();
	  	listAllRegions = regionDao.listAllRegions();
	    
	  	// 2차 필터 범례 리스트 - 자격증
	  	ISitCertDAO certDao = sqlSession.getMapper(ISitCertDAO.class);
	  	ArrayList<SitCertDTO> listCertType = new ArrayList<SitCertDTO>();
	  	listCertType = certDao.listCertType();
	  	
	  	// 다음 페이지로 넘겨주는 값
	 	// → 2차 필터 범례 (등급, 지역, 자격증) 
	    model.addAttribute("listGrade", listGrade);
	    model.addAttribute("listAllRegions", listAllRegions);
	    model.addAttribute("listCertType", listCertType);

	    result = "WEB-INF/view/genSearchResult.jsp";
		
		return result;
	}
	
	
	@RequestMapping(value = "/genregpossiblelist.action", method = RequestMethod.POST)
	public String genRegPossibleList( @RequestParam(value = "page", defaultValue="1") int page
									, @RequestParam("grades") List<String> grades
									, @RequestParam("regions") List<String> regions
									, @RequestParam("genders") List<String> genders
									, @RequestParam("ages") List<String> ages
									, @RequestParam("certs") List<String> certs
									, HttpServletResponse response
									, Model model
									, HttpSession session )
	{
		// AJAX 응답 → 한글 인코딩 설정
		response.setContentType("text/html; charset=UTF-8");
	    response.setCharacterEncoding("UTF-8");
	    
	    // 확인 (이전 페이지에서 온 2차 필터 선택 항목)
	    //System.out.println("Grades: " + grades);
	    //System.out.println("Regions: " + regions);
	    //System.out.println("Genders: " + genders);
	    //System.out.println("Ages: " + ages);
	    //System.out.println("Certs: " + certs);
	    
	    // 세션에서 1차 필터 정보 가져오기
        GenRegDTO dto = new GenRegDTO();
        dto.setStart_date((String) session.getAttribute("dateStart"));
        dto.setEnd_date((String) session.getAttribute("dateEnd"));
        dto.setStart_time((Integer) session.getAttribute("timeStart"));
        dto.setEnd_time((Integer) session.getAttribute("timeEnd"));
        
        //-----------------------------------------------------------
        
        // 입력값 기반으로 2차 필터 수행 결과 건수
        IGenRegDAO regDao = sqlSession.getMapper(IGenRegDAO.class);
        int countPrimaryGenReg = regDao.countPrimaryGenReg(dto);
        
    	// 2차 필터 매개변수 준비
        // → Map 에 이전 페이지에서 수신한 매개변수 추가(put)
        Map<String, Object> params = new HashMap<String, Object>();
        
        params.put("start_date", dto.getStart_date());
        params.put("end_date", dto.getEnd_date());
        params.put("start_time", dto.getStart_time());
        params.put("end_time", dto.getEnd_time());
        
        // 페이징 객체 생성
        PageHandler paging = new PageHandler(page, countPrimaryGenReg);
        
        // Map 에 페이징 정보 추가
        params.put("start", paging.getStart());
        params.put("end", paging.getEnd());

  	    // Map 에 (이전 페이지에서 온 2차 필터 선택 항목) 추가
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

		// 위 Map 을 2차 필터 쿼리의 params 로 제공
		ArrayList<GenRegDTO> listSecondaryGenReg = regDao.listSecondaryGenReg(params);
        
        // GenRegDTO 리스트(listSecondaryGenReg) ← 자격증 및 지역 정보 추가
		// → 『setCertAndRegion』 메소드 호출
        setCertAndRegion(listSecondaryGenReg);

        // 다음 페이지로 넘겨주는 값
		// → 2차 필터 결과 리스트 건수, 리스트, 페이징 객체 
        model.addAttribute("countSecondaryGenReg", countPrimaryGenReg);
        model.addAttribute("listSecondaryGenReg", listSecondaryGenReg);
        model.addAttribute("paging", paging);
        
        // 1차 필터 결과도 모델에 추가
        model.addAttribute("listPrimaryGenReg", listSecondaryGenReg); // 2차 필터 결과로 대체
        model.addAttribute("countPrimaryGenReg", listSecondaryGenReg.size());
        
        // JSP 파일 반환
        return "WEB-INF/view/genRegListFragment.jsp";
    
	}
	
	
	@RequestMapping(value="/genregpossibledetail.action", method = RequestMethod.GET)
	public String genRegDetail(@RequestParam("genRegId") String genRegId
							 , Model model, HttpSession session )
	{
		String result = null;
		
		// (이전 페이지에서 건네 받은) 근무 등록 코드로 특정 근무 정보 조회
		IGenRegDAO regDao = sqlSession.getMapper(IGenRegDAO.class);
		GenRegDTO genDetail = regDao.searchGenRegDetail(genRegId);
		
		// (이전 페이지에서 건네 받은) 근무 등록 코드로 시터 선호 근무 지역 조회
		ArrayList<String> preferedRegion = regDao.listSitPreferedRegion(genRegId);
		
		// (이전 페이지에서 건네 받은) 근무 등록 코드로 시터 선호 돌봄 연령대 조회
		ArrayList<String> preferedAge = regDao.listSitPreferedAge(genRegId);
				
				
		// (시터 백업 코드로) 시터 보유 자격증 조회
		String sitBackupId = genDetail.getSit_backup_id();
		ISitCertDAO certDao = sqlSession.getMapper(ISitCertDAO.class);
        ArrayList<String> listSitCert = certDao.listSitCert(sitBackupId);
        
        
		// 다음 페이지로 넘겨주는 값
		// → 근무 등록 코드, 특정 근무 등록 정보
		//    , 시터 선호 근무 지역, 시터 선호 돌봄 연령대, 시터 보유 자격증
		model.addAttribute("genRegId", genRegId);
		model.addAttribute("genDetail", genDetail);
		model.addAttribute("preferedRegion", preferedRegion);
		model.addAttribute("preferedAge", preferedAge);
		model.addAttribute("listSitCert", listSitCert);
		
		result = "WEB-INF/view/genRegDetail.jsp";
		
		return result;
	}
	
	@RequestMapping(value="/genReqInsertForm.action", method = RequestMethod.GET)
	public String genReqInsertForm(@RequestParam("genRegId") String genRegId
								 , Model model, HttpSession session )
	{
		String result = null;
		
		// (이전 페이지에서 건네 받은) 근무 등록 코드로 특정 근무 정보 조회
		IGenRegDAO regDao = sqlSession.getMapper(IGenRegDAO.class);
		GenRegDTO genDetail = regDao.searchGenRegDetail(genRegId);
		
		// (이전 페이지에서 건네 받은) 근무 등록 코드로 시터 선호 근무 지역 조회
		ArrayList<String> preferedRegion = regDao.listSitPreferedRegion(genRegId);
		
		// (이전 페이지에서 건네 받은) 근무 등록 코드로 시터 선호 돌봄 연령대 조회
		ArrayList<String> preferedAge = regDao.listSitPreferedAge(genRegId);
				
		
		// (시터 백업 코드로) 시터 보유 자격증 조회
		String sitBackupId = genDetail.getSit_backup_id();
		ISitCertDAO certDao = sqlSession.getMapper(ISitCertDAO.class);
        ArrayList<String> listSitCert = certDao.listSitCert(sitBackupId);
        
        
		// 다음 페이지로 넘겨주는 값
		// → 근무 등록 코드, 특정 근무 등록 정보
		//    , 시터 선호 근무 지역, 시터 선호 돌봄 연령대, 시터 보유 자격증
		model.addAttribute("genRegId", genRegId);
		model.addAttribute("genDetail", genDetail);
		model.addAttribute("preferedRegion", preferedRegion);
		model.addAttribute("preferedAge", preferedAge);
		model.addAttribute("listSitCert", listSitCert);
		
		
		//--------------------------------------------------
		
		// (아이 백업 코드로) 아이 정보 조회
		String childBackupId = (String) session.getAttribute("childBackupId");
		IChildDAO childDao = sqlSession.getMapper(IChildDAO.class);
		ChildDTO childInfo = childDao.searchChildInfo(childBackupId);
		
		// (아이 백업 코드로) 아이 보유 지병/알레르기/장애 조회
		ArrayList<String> listMedical = childDao.listChildMedicalName(childBackupId);

		// 세션에서 돌봄 정보 가져오기
		String dateStart = (String) session.getAttribute("dateStart");
		String dateEnd = (String) session.getAttribute("dateEnd");
		int timeStart = (Integer) session.getAttribute("timeStart");
		int timeEnd = (Integer) session.getAttribute("timeEnd");
		
		// 다음 페이지로 넘겨주는 값
		// → 특정 아이 정보(일반돌봄), 아이 보유 지병/알레르기/장애 리스트
		//   , 돌봄 희망 시작일, 종료일, 시작시, 종료시
		model.addAttribute("childInfo", childInfo);
		model.addAttribute("listMedical", listMedical);
		model.addAttribute("dateStart", dateStart);
		model.addAttribute("dateEnd", dateEnd);
		model.addAttribute("timeStart", timeStart);
		model.addAttribute("timeEnd", timeEnd);
		
		//--------------------------------------------------
		
		// 현 시점 일반 돌봄 시급 조회
		
		// 시터 등급에 따른 등급 배수 조회
		//genDetail.grade
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
	
	
	// GenRegDTO 리스트에 자격증 및 지역 정보 설정
	private void setCertAndRegion(ArrayList<GenRegDTO> genRegList)
	{
	    for (GenRegDTO genReg : genRegList)
	    {
	        // 1. sitBackupId로 보유 자격증 조회
	        String sitBackupId = genReg.getSit_backup_id();
	        
	        ISitCertDAO certDao = sqlSession.getMapper(ISitCertDAO.class);
	        ArrayList<String> certList = certDao.listSitCert(sitBackupId);
	        genReg.setCertList(certList);  // 각 시터 돌봄 건에 개별 자격증 리스트 설정
	        
	        // 2. genRegId로 시터 선호 근무 지역 조회
	        String genRegId = genReg.getGen_reg_id();
	        
	        IGenRegDAO regDao = sqlSession.getMapper(IGenRegDAO.class);
	        ArrayList<String> regions = regDao.listSitPreferedRegion(genRegId);
	        genReg.setRegionList(regions);  // 각 시터 돌봄 건에 선호 근무 지역 리스트 설정
	    }
	}
	
}