/*==============================
 	SitterMypageController.java
 	- 사용자 정의 컨트롤러
 	- 시터의 각종 개인 정보를 가져와야 함
 	- ISitDAO, ISitAcctDAO, ISitCertDAO
 =============================*/
package com.team1.controller;

import java.util.ArrayList;
import java.util.Iterator;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.dto.AgesPreferedDTO;
import com.team1.dto.GenRegDTO;
import com.team1.dto.SitCareListDTO;
import com.team1.dto.SitDTO;
import com.team1.dto.WorkRegionPreferedDTO;
import com.team1.mybatis.IAcctDAO;
import com.team1.mybatis.IAgesPreferedDAO;
import com.team1.mybatis.IGenRegDAO;
import com.team1.mybatis.IGradesDAO;
import com.team1.mybatis.ISitAcctDAO;
import com.team1.mybatis.ISitCareListDAO;
import com.team1.mybatis.ISitCertDAO;
import com.team1.mybatis.ISitDAO;
import com.team1.mybatis.IWorkRegionPreferedDAO;

@Controller
public class SitterMypageController
{
	// 주요 속성 활용
	// mybatis 객체 활용
	@Autowired
	private SqlSession sqlSession;
	
	
	// 시터 마이 페이지 >> 개인정보 수정 컨트롤러
	@RequestMapping(value = "/sitterinfolist.action", method = RequestMethod.GET)
	public String infoList(Model model)
	{
		ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
		ISitAcctDAO sitAcctDao = sqlSession.getMapper(ISitAcctDAO.class);
		ISitCertDAO certDao = sqlSession.getMapper(ISitCertDAO.class);
		IAcctDAO acctDao = sqlSession.getMapper(IAcctDAO.class);
		
		model.addAttribute("list", dao.sitIdSearch("SBAC0001"));
		model.addAttribute("bank", sitAcctDao.list(dao.sitIdSearch("SBAC0001").getSit_reg_id()));
		model.addAttribute("banklist", acctDao.list());
		
		return "/WEB-INF/view/SitterinfoList.jsp";
	}
	
	
	// 등급 확인 페이지 컨트롤러
	@RequestMapping(value = "/gradescheck.action", method = RequestMethod.GET)
	public String GradeCheck(Model model, String sit_backup_id)
	{
		ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
		IGradesDAO gradeDao = sqlSession.getMapper(IGradesDAO.class);
		
		// [시터] 자기 등급 찾기
		model.addAttribute("mygrade", dao.searchGrades(sit_backup_id));
		
		// [시터 가입일 찾기]
		model.addAttribute("list", dao.sitIdSearch(sit_backup_id));
		
		// [시터가 그동안 맡은 일반 돌봄 서비스 수]
		model.addAttribute("genCareCount", dao.genCareCount(sit_backup_id));
		
		// [시터가 그동안 맡은 긴급 돌봄 서비스 수]
		model.addAttribute("emgCareCount", dao.emgCareCount(sit_backup_id));
		
		// 등급 리스트 조회
		model.addAttribute("grade", gradeDao.listGrade());
		
		// [시터] 승급 시간 계산
		model.addAttribute("promotion", dao.searchNextTime(dao.searchGrades(sit_backup_id).getGrade()));
		
		// [시터] 백업 아이디로 자신의 평균 점수 찾기
		model.addAttribute("totalrating", dao.searchRating(sit_backup_id));
		
		// [시터] 아이디로 자신의 최근 3개월 평균 점수 찾기
		model.addAttribute("month3rating", dao.searchM3Rating(sit_backup_id));
		
		return "/WEB-INF/view/GradesCheck.jsp";
	}
	
	// 폼으로 가는 링크
	@RequestMapping(value = "/genreginsertform.action", method = RequestMethod.GET)
	public String SitGenRegInsertForm(Model model, String sit_backup_id)
	{
		String result = null;
		
		IAgesPreferedDAO agePreferdao = sqlSession.getMapper(IAgesPreferedDAO.class);
		IWorkRegionPreferedDAO workRegionPreferedDao = sqlSession.getMapper(IWorkRegionPreferedDAO.class);
		ISitDAO sitDao = sqlSession.getMapper(ISitDAO.class);
		
		// 시터 백업 아이디 갖다 놓기.
		model.addAttribute("sit_backup_id", sit_backup_id);
		
		// 신입인지 아닌지 알려주기 위해 등급 갖다 놓기
		model.addAttribute("grade", sitDao.searchGrades(sit_backup_id).getGrade());
		
		// 전체 선호 연령대 가져오기
		model.addAttribute("agesList", agePreferdao.listAllAges());
		
		// 전체 선호 지역 가져오기
		model.addAttribute("regionList", workRegionPreferedDao.listAllRegions());
		
		// 파일 가져오기
		result = "/WEB-INF/view/genRegInsertForm.jsp";
		return result;
	}
	
	
	// 근무 등록 테이블에 넣는 액션
	@RequestMapping(value = "/genreginsert.action", method = RequestMethod.POST)
	public String GenRegList(String sit_backup_id, @ModelAttribute GenRegDTO genRegdto
												, @ModelAttribute WorkRegionPreferedDTO workRPDto
												, @ModelAttribute AgesPreferedDTO agePDto
												, Model model)
	{
		String result = null;

		IGenRegDAO genRegDao = sqlSession.getMapper(IGenRegDAO.class);
		IWorkRegionPreferedDAO workRPDao = sqlSession.getMapper(IWorkRegionPreferedDAO.class);
		IAgesPreferedDAO agesPDao = sqlSession.getMapper(IAgesPreferedDAO.class);

		// 그런데 이 genRegdto에는 sit_backup_id가 없다.
		genRegdto.setSit_backup_id(sit_backup_id);
		// int 나오니까 이걸로 분기 처리 가능.
		genRegDao.add(genRegdto);
		workRPDao.addRegions(workRPDto);
		agesPDao.addAges(agePDto);
		
		// 사이드바 이용을 위한 시터 백업 아이디 보내주기
		model.addAttribute("sit_backup_id", sit_backup_id);
		
		result = "/WEB-INF/view/genRegInsertFormComplete.jsp";
		
		return result;
	}
	
	
	// 근무 등록 내역 확인 컨트롤러
	@RequestMapping(value = "/genreglist.action", method = RequestMethod.GET)
	public String GenRegList(Model model, String sit_backup_id)
	{
		// 주소
		String result = null;
		
		// sqlSession 으로 의존성 주입
		ISitCareListDAO sitcarelistDao = sqlSession.getMapper(ISitCareListDAO.class);
		IWorkRegionPreferedDAO regionDao = sqlSession.getMapper(IWorkRegionPreferedDAO.class);
		
		// 근무 등록 내역 리스트 보내주기
		model.addAttribute("regList", sitcarelistDao.regList(sit_backup_id));
		
		// 사이드바 이용을 위한 시터 백업 아이디 보내주기
		model.addAttribute("sit_backup_id", sit_backup_id);
		
		// 근무 등록 내역 리스트를 정렬화해서 리스트로 만듦.
		Iterator<SitCareListDTO> it = sitcarelistDao.regList(sit_backup_id).iterator();
		
		// 꺼내서 DTO로 만들고 그 안에 있는 근무 등록 아이디를 가져온다.
		while (it.hasNext())
		{
			int i = 1;
			// 근무 등록 내역 1건에 있는 그 근무 등록 아이디로 
			// 시터가 근무 등록 때 선택한 근무 지역을 열람한다.
			String gen_reg_id = it.next().getGen_reg_id();
			
			regionDao.listRegions(gen_reg_id);
		}
		
		// 시터가 선택한 근무 지역 보내주기
		
		// 주소 지정
		result = "/WEB-INF/view/GenRegList.jsp";
		return result;
	}
	
	// 근무 등록 내역 상세보기 누르면 나오는 컨트롤러 >> AJAX 처리
	@RequestMapping(value = "/genregdetail.action", method = RequestMethod.GET)
	public String GenRegDetailList(@RequestParam("gen_req_id") String gen_req_id, String sit_backup_id, Model model) 
	{
		String result = null;
		
		model.addAttribute("sit_backup_id", sit_backup_id);
		model.addAttribute("gen_req_id", gen_req_id);
		
		result = "/WEB-INF/view/ParGenReqList.jsp";
		
		return result;
	}
	
	// 근무 등록 내역에서 돌봄 예스 누르면 나오는 컨트롤러
	@RequestMapping(value = "sittergenreqansweredyes.action", method = RequestMethod.GET)
	public String AnswerYes(String sit_backup_id, Model model)
	{
		String result = null;
		
		// 돌봄 확정에 insert
		
		// 돌봄 제공 내역으로 리다이렉트
		result = "redirect:sittergenreqansweredlist.action";
		
		return result;
	}
	
	
	// 근무 등록 내역에서 돌봄 취소하면 나오는 컨트롤러
	@RequestMapping(value = "sittergenreqansweredno.action", method = RequestMethod.GET)
	public String AnswerNo(String sit_backup_id, Model model)
	{
		String result = null;
		
		// 돌봄 취소에 insert
		
		// 돌봄 제공 내역으로 리다이렉트
		result = "redirect:sittergenreqansweredlist.action";
		
		return result;
	}
	
	
	
	// 돌봄 제공 내역 확인 컨트롤러
	@RequestMapping(value = "sittergenreqansweredlist.action", method = RequestMethod.GET)
	public String AnswerList(Model model, String sit_backup_id) 
	{
		String result = null;
		
		ISitCareListDAO sitcarelistDao = sqlSession.getMapper(ISitCareListDAO.class);
		
		model.addAttribute("answerList", sitcarelistDao.answerList(sit_backup_id));
		
		model.addAttribute("sit_backup_id", sit_backup_id);
		
		result = "/WEB-INF/view/SitterGenReqAnsweredList.jsp";
		
		return result;
	}
	
	
	// 돌봄 제공 내역 확인 상세 정보 새창 처리 컨트롤러
	// 돌봄 완료 내역 확인 + 돌봄 제공 내역 확인 >> 일반 돌봄 클릭 >> 상세 정보 버튼 클릭 >> 새창으로 나오는 상세 정보.
	@RequestMapping(value = "/pargenreqdetail.action", method = RequestMethod.GET)
	public String ParGenReqDetailList(@RequestParam("gen_req_id") String gen_req_id, Model model)
	{
		ISitCareListDAO sitCareListDao = sqlSession.getMapper(ISitCareListDAO.class);
		
		model.addAttribute("list", sitCareListDao.answerDetailedList(gen_req_id));
		
		
		return "/WEB-INF/view/ParGenReqDetail.jsp";
	}
	
	// 돌봄 제공 내역 확인 >> 자기소개서 자세히 보기 클릭 >> 새창으로 나오는 자기소개
	@RequestMapping(value = "/sitterregintroduction.action", method = RequestMethod.GET)
	public String SitterRegIntroduction(@RequestParam("gen_reg_id") String gen_reg_id, Model model)
	{
		IGenRegDAO genRegDao = sqlSession.getMapper(IGenRegDAO.class);
		
		model.addAttribute("register", genRegDao.regList(gen_reg_id));
		
		return "/WEB-INF/view/SitterRegIntroduction.jsp";
	}
	
	// 돌봄 완료 내역 띄우기
	@RequestMapping(value = "/carecompletelist.action", method = RequestMethod.GET)
	public String CareCompleteList(Model model, String sit_backup_id)
	{
		ISitCareListDAO sitCareListDao = sqlSession.getMapper(ISitCareListDAO.class);
		
		model.addAttribute("completeList", sitCareListDao.genCompleteList(sit_backup_id));
		model.addAttribute("sit_backup_id", sit_backup_id);
		
		
		return "/WEB-INF/view/CareCompleteList.jsp";
	}
	
}
