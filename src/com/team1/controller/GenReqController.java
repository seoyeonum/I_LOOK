/*=============================
	GenReqController
=============================*/

package com.team1.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.format.DateTimeParseException;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.dto.ChildDTO;
import com.team1.dto.GenPayDTO;
import com.team1.dto.GenRegDTO;
import com.team1.dto.GenReqDTO;
import com.team1.dto.GradesDTO;
import com.team1.dto.ParDTO;
import com.team1.dto.SitCertDTO;
import com.team1.dto.WorkRegionPreferedDTO;
import com.team1.mybatis.IChildDAO;
import com.team1.mybatis.IGenPayDAO;
import com.team1.mybatis.IGenRegDAO;
import com.team1.mybatis.IGenReqDAO;
import com.team1.mybatis.IGradesDAO;
import com.team1.mybatis.IParDAO;
import com.team1.mybatis.IParLoginDAO;
import com.team1.mybatis.ISitCertDAO;
import com.team1.mybatis.IWorkRegionPreferedDAO;
import com.team1.util.PageHandler;

@Controller
public class GenReqController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	// ● 일반 돌봄 메인
	@RequestMapping(value="/genmain.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String genMain(HttpSession session, Model model)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		
		if (parent == null)
			return "redirect:/iLook.action";
		
		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
		String id = parent.getId();
		
		// 부모 id 기반으로 아이 이름 조회
		IChildDAO ChildDao = sqlSession.getMapper(IChildDAO.class);
		ArrayList<ChildDTO> listName = new ArrayList<ChildDTO>();
		listName = ChildDao.listName(id);
		
		model.addAttribute("listName", listName);
		//session.setAttribute("id", id);
		
		result = "WEB-INF/view/genMain.jsp";
		return result;
	}
	
	
	// ● 1차 필터 결과
	@RequestMapping(value="/gensearchresult.action", method = RequestMethod.POST)
	public String genSearchResult(@RequestParam("child_backup_id") String childBackupId
								, GenRegDTO dto
								, @RequestParam(value = "page", defaultValue="1") int page
								, Model model
								, HttpSession session)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		
		if (parent == null)
			return "redirect:/iLook.action";

		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
		// 입력값 기반으로 1차 필터 유지
		IChildDAO childDao = sqlSession.getMapper(IChildDAO.class);
		ArrayList<ChildDTO> listName = new ArrayList<ChildDTO>();
		//String id = (String) session.getAttribute("id");
		String id = parent.getId();
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
	
	// ● 2차 필터 결과
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
		// 페이지 접근 권한 확인 ------------------------------------------
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		
		if (parent == null)
			return "redirect:/iLook.action";

		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
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
	
	// ● 예약 가능한 근무 등록 상세 열람
	@RequestMapping(value="/genregpossibledetail.action", method = RequestMethod.GET)
	public String genRegDetail(@RequestParam("genRegId") String genRegId
							 , Model model, HttpSession session )
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		
		if (parent == null)
			return "redirect:/iLook.action";

		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
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
		
		// (추가로 세션에 필터 값 저장)
		session.setAttribute("genRegId", genRegId);
		
		result = "WEB-INF/view/genRegDetail.jsp";
		
		return result;
	}
	
	// ● 일반 돌봄 예약 신청 폼
	@RequestMapping(value="/gereqinsertform.action", method = RequestMethod.GET)
	public String genReqInsertForm(@RequestParam("genRegId") String genRegId
								 , Model model, HttpSession session )
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		
		if (parent == null)
			return "redirect:/iLook.action";

		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------

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
		//model.addAttribute("genRegId", genRegId);
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
		
		// 현 시점 일반 돌봄 기본급 조회
		IGradesDAO gradesDao = sqlSession.getMapper(IGradesDAO.class);
		int genWage = gradesDao.searchGenWageLately();
		
		// 시터 등급에 따른 등급 배수 조회
		String sitGradeName = genDetail.getGrade();
		GradesDTO searchGradeInfo = gradesDao.searchGradeInfo(sitGradeName);
		double gradePay = searchGradeInfo.getGrade_pay();
		
		int price, careDays, careHours;
		
		// 1일 돌봄 비용 계산(기본급 * 등급 배수 * 수수료)
		price = (int) Math.floor(genWage * gradePay * 1.05);
		
		// 총 이용 시간 계산 → 사용자 정의 함수(parseToDate) 활용
		LocalDate localDateStart = parseToDate(dateStart);
		LocalDate localDateEnd = parseToDate(dateEnd);
		
		long daysBetween = ChronoUnit.DAYS.between(localDateStart, localDateEnd);
		careDays = (int) daysBetween + 1;
		careHours = timeEnd - timeStart;
		
		// 총 지불 비용 계산
		int totalPrice = price * careDays * careHours;
		
		// 현 보유 포인트 조회
		IParDAO parDao = sqlSession.getMapper(IParDAO.class);
		String parBackupId = parent.getPar_backup_id();		// = parDao.seachParBackupId(childBackupId);		
		int point = parDao.searchPoint(parBackupId);
		
		// 다음 페이지로 넘겨주는 값
		// → 1일 돌봄 비용, 총 돌봄 일수, 일 돌봄 시간, 총 돌봄 비용
		model.addAttribute("price", price);
		model.addAttribute("careDays", careDays);
		model.addAttribute("careHours", careHours);
		model.addAttribute("totalPrice", totalPrice);
		
		result = "WEB-INF/view/genReqInsertForm.jsp";
		
		return result;
	}
	
	// ● 일반 돌봄 결제 진행 폼
	@RequestMapping(value="/genpayinsertform.action", method = RequestMethod.POST)
	public String genPayInsertForm(@RequestParam("message") String message
								, Model model, HttpSession session, HttpServletRequest request)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		
		if (parent == null)
			return "redirect:/iLook.action";

		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------

		// (결제/포인트 데이터)
		
		// 사용 포인트 가져오기
		String pointStr = request.getParameter("point");
		int point = (pointStr != null && !pointStr.isEmpty()) ? Integer.parseInt(pointStr) : 0;

		// 최종 결제 예정 금액 가져오기
		String finalPriceStr = request.getParameter("finalPrice");
		int finalPrice = (finalPriceStr != null && !finalPriceStr.isEmpty()) ? Integer.parseInt(finalPriceStr) : 0;

		// 상품명
		String productName = "I_LOOK_일반돌봄";
		
		// 다음 페이지로 넘겨주는 값
		// → 최종 결제 예정 금액, 상품명
		model.addAttribute("finalPrice", finalPrice);
		model.addAttribute("productName", productName);
		
		// (추가로 세션에 필터 값 저장)
		// 포인트 차감 대상자 → 세션에 있음(par_backup_id)
		// 포인트 차감액 → 세션에 추가
		session.setAttribute("point", point);
		session.setAttribute("finalPrice", finalPrice);
		
		//--------------------------------------------------
		
		// (일반 돌봄 신청 데이터)
		
		// 세션에 부쳐주는 값
		// 아이 백업코드, 돌봄 이용 시작일, 종료일, 시작시, 종료시 → 세션에 있음
		// 전달 메시지 → 세션에 추가
		session.setAttribute("message", message);
		
		// 확인
		System.out.println("결제 과정 수행");
		
		result = "WEB-INF/view/genPayInsertForm.jsp";
		
		return result;
	}
	
	// ● 일반 돌봄 결제 완료 안내
	@Transactional
	@RequestMapping(value="/genpayresult.action", method = RequestMethod.GET)
	public String genPayResult(Model model, HttpSession session)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		
		if (parent == null)
			return "redirect:/iLook.action";

		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
		try
		{
			// 액션 수행에 필요한 데이터가 세션에 없다면 초기 화면으로 이동!
			if (!checkSessionAttrs(session, "genRegId", "childBackupId", "message"
					, "dateStart", "dateEnd", "timeStart", "timeEnd", "finalPrice", "point"))
			{
			    return "redirect:/iLook.action";
			}
			
			// (일반 돌봄 신청 데이터 추가 액션)
			//-- 예약신청코드, 근무 등록 코드, 아이 백업코드, 전달메시지, 돌봄 시작/종료/시작/종료
			//   예약 신청일시
			GenReqDTO genReqDto = new GenReqDTO();
			
			String genRegId = (String) session.getAttribute("genRegId");
			String childBackupId = (String) session.getAttribute("childBackupId");
			String message = (String) session.getAttribute("message");
			String dateStart = (String) session.getAttribute("dateStart");
			String dateEnd = (String) session.getAttribute("dateEnd");
			int timeStart = (Integer) session.getAttribute("timeStart");
			int timeEnd = (Integer) session.getAttribute("timeEnd");
			
			System.out.println(childBackupId);
			System.out.println(dateStart);
			System.out.println(dateEnd);
			
			genReqDto.setGen_reg_id(genRegId);
			genReqDto.setChild_backup_id(childBackupId);
			genReqDto.setMessage(message);
			genReqDto.setStart_date(dateStart);
			genReqDto.setEnd_date(dateEnd);
			genReqDto.setStart_time(timeStart);
			genReqDto.setEnd_time(timeEnd);
			
			// 테스트 시 주석 풀기
			IGenReqDAO genReqDao = sqlSession.getMapper(IGenReqDAO.class);
			genReqDao.add(genReqDto);
			
			//-----------------------------------------------------------
			
			// (결제/포인트 추가 액션)
			
			//GenPayDTO genPayDto = new GenPayDTO();
			// 같은 DTO 사용하여 데이터 값 유지
			
			int payAmount = (Integer) session.getAttribute("finalPrice");
			String pgCode = "T123456789";
			
			genReqDto.setPay_amount(payAmount);
			genReqDto.setPg_code(pgCode);
			
			// 테스트 시 주석 풀기
			IGenPayDAO genPayDao = sqlSession.getMapper(IGenPayDAO.class);
			genPayDao.addGenPayRec(genReqDto);
			
			int point = (Integer) session.getAttribute("point");
			
			genPayDao.addGenPointUsed(genReqDto);
			
			//-----------------------------------------------------------
			
			// (돌봄 정보 세션 비워주기)
			
			if (session.getAttribute("dateStart") != null)
				session.removeAttribute("dateStart");
			if (session.getAttribute("dateEnd") != null)
				session.removeAttribute("dateEnd");
			if (session.getAttribute("timeStart") != null)
				session.removeAttribute("timeStart");
			if (session.getAttribute("timeEnd") != null)
				session.removeAttribute("timeEnd");
			if (session.getAttribute("genRegId") != null)
				session.removeAttribute("genRegId");
			if (session.getAttribute("childBackupId") != null)
				session.removeAttribute("childBackupId");
			if (session.getAttribute("message") != null)
				session.removeAttribute("message");
			if (session.getAttribute("finalPrice") != null)
				session.removeAttribute("finalPrice");
			if (session.getAttribute("point") != null)
				session.removeAttribute("point");
			
			
			// 확인 ------------------------------------------
			String id = parent.getId();
			String dateStart2 = (String) session.getAttribute("dateStart");
			
			System.out.println("Session ID: " + session.getId());
			System.out.println("dateStart in Session after: " + dateStart2);
			System.out.println("Parent ID in Session after: " + id);
			// -----------------------------------------------
			
		}
		catch (Exception e)
		{
			System.out.println("트랜잭션 오류 발생: " + e.getMessage());
            throw e; 		//-- 롤백을 위한 예외 throw
		}
		
		result = "WEB-INF/view/genPayResult.jsp";
		return result;
	}
	
	
	// ○ 함수 1. GenRegDTO 리스트에 자격증 및 지역 정보 설정
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
	
	// ○ 함수 2. 날짜 타입 변환 함수
	public static LocalDate parseToDate(String dateStr)
	{
		// 날짜 타입 변환을 위한 formatter 객체 생성
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
        
        try
        {
            return LocalDate.parse(dateStr, formatter);
        }
        catch (DateTimeParseException e)
        {
            System.err.println("날짜 형식이 잘못되었습니다: " + dateStr);
            return null;
        }
    }
	
	// ○ 함수 3. 세션 값 체크
	private boolean checkSessionAttrs(HttpSession session, String... keys)
	{
	    for (String key : keys)
	    {
	        if (session.getAttribute(key) == null)
	        {
	            System.out.println("세션에 " + key + " 없음!");
	            return false;
	        }
	    }
	    return true;
	}
	
}