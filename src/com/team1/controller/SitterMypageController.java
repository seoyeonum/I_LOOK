/*==============================
 	SitterMypageController.java
 	- 사용자 정의 컨트롤러
 	- 시터의 각종 개인 정보를 가져와야 함
 	- ISitDAO, ISitAcctDAO, ISitCertDAO
 =============================*/
package com.team1.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.dto.SitDTO;
import com.team1.mybatis.IAcctDAO;
import com.team1.mybatis.IGradesDAO;
import com.team1.mybatis.ISitAcctDAO;
import com.team1.mybatis.ISitCareListDAO;
import com.team1.mybatis.ISitCertDAO;
import com.team1.mybatis.ISitDAO;

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
	
	
	// 근무 등록 내역 확인 컨트롤러
	
	
	// 
	// 돌봄 완료 내역 확인 >> 일반 돌봄 클릭 >> 상세 정보 버튼 클릭 >> 새창으로 나오는 상세 정보.
	@RequestMapping(value = "/pargenreqdetail.action", method = RequestMethod.GET)
	public String ParGenReqDetailList(@RequestParam("gen_req_id") String gen_req_id, Model model)
	{
		ISitCareListDAO sitCareListDao = sqlSession.getMapper(ISitCareListDAO.class);
		
		model.addAttribute("list", sitCareListDao.answerDetailedList(gen_req_id));
		
		
		return "/WEB-INF/view/ParGenReqDetail.jsp";
	}
	
	// 돌봄 완료 내역 확인 띄우기
	@RequestMapping(value = "/carecompletelist.action", method = RequestMethod.GET)
	public String CareCompleteList(Model model)
	{
		ISitCareListDAO sitCareListDao = sqlSession.getMapper(ISitCareListDAO.class);
		
		model.addAttribute("completeList", sitCareListDao.genCompleteList("SBAC0007"));
		
		
		return "/WEB-INF/view/CareCompleteList.jsp";
	}
	
}
