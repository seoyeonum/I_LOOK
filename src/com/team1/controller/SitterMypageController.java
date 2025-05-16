/*==============================
    SitterMypageController.java
    - 사용자 정의 컨트롤러
    - 시터의 각종 개인 정보를 가져와야 함
    - ISitDAO, ISitAcctDAO, ISitCertDAO
 =============================*/
package com.team1.controller;


import java.util.HashMap;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team1.dto.AgesPreferedDTO;
import com.team1.dto.GenCanceledDTO;
import com.team1.dto.GenConfirmedDTO;
import com.team1.dto.GenRegDTO;
import com.team1.dto.SitCareListDTO;
import com.team1.dto.SitDTO;
import com.team1.dto.WorkRegionPreferedDTO;
import com.team1.mybatis.IAcctDAO;
import com.team1.mybatis.IAgesPreferedDAO;
import com.team1.mybatis.IGenCanceledDAO;
import com.team1.mybatis.IGenConfirmedDAO;
import com.team1.mybatis.IGenPayDAO;
import com.team1.mybatis.IGenRegDAO;
import com.team1.mybatis.IGradesDAO;
import com.team1.mybatis.ISitAcctDAO;
import com.team1.mybatis.ISitCareListDAO;
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
   public String infoList(HttpSession session, Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      String sit_backup_id = sitter.getSit_backup_id();
      //System.out.println(sit_backup_id);

      // ============================================================================== 밑은 내가 이미 해놓은 것들.
      
      ISitDAO dao = sqlSession.getMapper(ISitDAO.class);
      ISitAcctDAO sitAcctDao = sqlSession.getMapper(ISitAcctDAO.class);
      //ISitCertDAO certDao = sqlSession.getMapper(ISitCertDAO.class);
      IAcctDAO acctDao = sqlSession.getMapper(IAcctDAO.class);
      
      model.addAttribute("list", dao.sitIdSearch(sit_backup_id));
      
      // 확인 ----------------------------------------------
      //System.out.println("시터 백업 코드: " + sit_backup_id);
      //System.out.println("시터 등록 코드: " + dao.sitIdSearch(sit_backup_id).getSit_reg_id());
      //System.out.println("계좌번호: " + sitAcctDao.list(dao.sitIdSearch(sit_backup_id).getSit_reg_id()).getAcct_number());
      //System.out.println("은행이름: " + sitAcctDao.list(dao.sitIdSearch(sit_backup_id).getSit_reg_id()).getBank_type());
      //----------------------------------------------------
      
      if (sitAcctDao.list(dao.sitIdSearch(sit_backup_id).getSit_reg_id()) == null)
      {
         HashMap<String, String> bank = new HashMap<String, String>();
         bank.put("BANK_TYPE", "미등록");
         bank.put("acct_number", "등록한 은행 계좌가 존재하지 않습니다.");
         model.addAttribute("bank", bank);
      }
      else
      {
         model.addAttribute("bank", sitAcctDao.list(dao.sitIdSearch(sit_backup_id).getSit_reg_id()));
      }
      
      
      model.addAttribute("banklist", acctDao.list());
      
      return "/WEB-INF/view/SitterinfoList.jsp";
      
   }
   
   
   // 등급 확인 페이지 컨트롤러
   @RequestMapping(value = "/gradescheck.action", method = RequestMethod.GET)
   public String GradeCheck(HttpSession session, Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      String sit_backup_id = sitter.getSit_backup_id();
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
      
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
      model.addAttribute("grade", gradeDao.searchGradeInfo(dao.searchGrades(sit_backup_id).getGrade()));
      
      // [시터] 승급 시간 계산
      model.addAttribute("promotion", dao.searchNextTime(dao.searchGrades(sit_backup_id).getGrade()));
      
      // [시터] 백업 아이디로 자신의 평균 점수 찾기
      model.addAttribute("totalrating", dao.searchRating(sit_backup_id));
      
      // [시터] 아이디로 자신의 최근 3개월 평균 점수 찾기
      model.addAttribute("month3rating", dao.searchM3Rating(sit_backup_id));
      
      return "/WEB-INF/view/GradesCheck.jsp";
   }
   
   /*
   // 스케줄러 페이지 컨트롤러
   @RequestMapping(value = "/sitterscheduler.action", method = RequestMethod.GET)
   public String SitScheduler(HttpSession session, Model model)
   {
	   String result = null;

	   // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
	   SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");

	   if (sitter == null)
		   return "redirect:/iLook.action";

	   // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.

	   String sit_backup_id = sitter.getSit_backup_id();

	   // ==============================================================================
	   // 밑은 내가 이미 해놓은 것들.
	   
	   return result;
   }
   */
   
   
   
   // 근무 등록 폼으로 가는 링크
   @RequestMapping(value = "/genreginsertform.action", method = RequestMethod.GET)
   public String SitGenRegInsertForm(HttpSession session, Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      String sit_backup_id = sitter.getSit_backup_id();
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
            
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
   public String GenRegList(HttpSession session, @ModelAttribute GenRegDTO genRegdto
                                    , @ModelAttribute WorkRegionPreferedDTO workRPDto
                                    , @ModelAttribute AgesPreferedDTO agePDto
                                    , Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      String sit_backup_id = sitter.getSit_backup_id();
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
            
      String result = null;

      IGenRegDAO genRegDao = sqlSession.getMapper(IGenRegDAO.class);
      IWorkRegionPreferedDAO workRPDao = sqlSession.getMapper(IWorkRegionPreferedDAO.class);
      IAgesPreferedDAO agesPDao = sqlSession.getMapper(IAgesPreferedDAO.class);

      // 그런데 이 genRegdto에는 sit_backup_id가 없다.
      genRegdto.setSit_backup_id(sit_backup_id);

      //System.out.println(sit_backup_id);
      
      // null 처리
      if (genRegdto.getIntroduction() == null || genRegdto.getIntroduction() == "")
      {
         genRegdto.setIntroduction(" ");
      }
      
      //System.out.println(genRegdto.getIntroduction());
      //System.out.println("빡침");
      genRegDao.add(genRegdto);
      
      //System.out.println(genRegdto.getSit_backup_id());
      String genregid = genRegdto.getGen_reg_id();
      workRPDto.setGen_reg_id(genregid);
      agePDto.setGen_reg_id(genregid);
        
      //System.out.println(genregid);
      workRPDao.addRegions(workRPDto);
      agesPDao.addAges(agePDto);
      
      // 사이드바 이용을 위한 시터 백업 아이디 보내주기
      model.addAttribute("sit_backup_id", sit_backup_id);
      
      result = "/WEB-INF/view/genRegInsertComplete.jsp";
      
      return result;
   }

   // genRegInsertComplete.jsp로 보내졌고, 그 파일엔 이미 알아서 버튼링크 처리가 되어 있으니 따로 뭘 더 안 만들어도 됨.
   
   // 근무 등록 내역 확인 컨트롤러
   @RequestMapping(value = "/genreglist.action", method = RequestMethod.GET)
   public String GenRegList(HttpSession session, Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      String sit_backup_id = sitter.getSit_backup_id();
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
      
      // 주소
      String result = null;
      
      // sqlSession 으로 의존성 주입
      ISitCareListDAO sitcarelistDao = sqlSession.getMapper(ISitCareListDAO.class);
      IWorkRegionPreferedDAO regionDao = sqlSession.getMapper(IWorkRegionPreferedDAO.class);
      IGenCanceledDAO genCanDao = sqlSession.getMapper(IGenCanceledDAO.class);
      
      // 사이드바 이용을 위한 시터 백업 아이디 보내주기
      model.addAttribute("sit_backup_id", sit_backup_id);
      
      // 근무 등록 내역 리스트 보내주기 >> 
      // SIT_BACKUP_ID, GEN_REG_ID, GEN_REQ_ID, REG_DATE, 
      // TITLE, SIT_START_DATE, SIT_END_DATE, SIT_START_TIME, SIT_END_TIME,
      // INTRODUCTION
      model.addAttribute("regList", sitcarelistDao.regList(sit_backup_id));

      /*------------------------------------------------------------------------------------
      // 저 메소드에는 지역이 없다. 따라서 근무 등록 아이디를 가져오기 위해 이터레이터를 써서 아이디를 하나씩 뽑아냈다.
      // 또한 근무 등록 아이디를 담아올 ArrayList를 만들었다. 
      ArrayList<String> genRegId = new ArrayList<String>();
      while (sitcarelistDao.regList(sit_backup_id).iterator().hasNext())
      {
         // 그걸 ArrayList<String>에 담을 것이다. 
         SitCareListDTO sCListdto = (SitCareListDTO) sitcarelistDao.regList(sit_backup_id).iterator().next();
         
         // ORDER BY GREG.REG_DATE DESC 이니, 이 순서대로 담겼을 것이다. 
         // 따라서 지역 리스트를 뽑아오는 쿼리도 같은 방식으로 정렬해야 옳게 나올 것이다. 
         genRegId.add(sCListdto.getGen_reg_id());
      }
      // 메소드에 지역이 없어서 근무 등록 아이디를 주면 
      // 근무 등록 1건의 지역 ID와, 이름 리스트를 WorkRegionPrefered에 담아 가져오는 쿼리를 WorkRegionPreferedDAO와 IWorkRegionPreferedDAO에 추가했다.  
      
      // 시터가 선택한 근무 지역 보내주기
      ---------------------------------------------------------------------------------------*/
      
      // 를 하려고 했으나.......복수선택된 지역을 한 행으로 압축시킬 수가 없어 지역을 하나만 선택하게끔 페이지를 변경했다.
      // 그래도 어쨌든 gen_reg_id는 필요하니 확인한다. 
      /* ---------------------------------------------------------------------------------------------------
      ArrayList<String> genRegId = new ArrayList<String>();
      //System.out.println("냐야아아아아ㅏ");
      while (sitcarelistDao.regList(sit_backup_id).iterator().hasNext())
      {
         // 그걸 ArrayList<String>에 담을 것이다. 
         SitCareListDTO sCListdto = (SitCareListDTO) sitcarelistDao.regList(sit_backup_id).iterator().next();
         
         // ORDER BY GREG.REG_DATE DESC 이니, 이 순서대로 담겼을 것이다. 
         // 따라서 지역 리스트를 뽑아오는 쿼리도 같은 방식으로 정렬해야 옳게 나올 것이다. 
         genRegId.add(sCListdto.getGen_reg_id());
      }
      
      //System.out.println("안돼ㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐㅐ");
      // 이제 gen_reg_id 묶음이 생겼다. 여기서 하나씩 꺼내서 WorkRegionPreferdDTO 묶음을 만들자. 
      // WorkRegionPreferedDTO 묶음 생성
      ArrayList<WorkRegionPreferedDTO> wRPdtolist = new ArrayList<WorkRegionPreferedDTO>();
      
      // genRegId(ArrayList<String>)에서 하나씩 꺼내기
      while (genRegId.iterator().hasNext())
      {
         // 그걸 문자열로 만들기
         String gen_reg_id = (String) genRegId.iterator().next();
         // 이제 그걸 다시 또 ArrayList<WorkRegionPreferdDTO>에 넣기
         wRPdtolist.add(regionDao.sitRegion(gen_reg_id));
      } 
      
      // 다 넣었으면 그걸 모델로 보내기.
      model.addAsttribute("wRPdtoList", wRPdtolist);
      ------------------------------------------------------------------------------------------------- */ 
      
      // 취소 범례 보여주기
      model.addAttribute("cancelList", genCanDao.CanceledReason());
      
      // 주소 지정
      result = "/WEB-INF/view/GenRegList.jsp";
      return result;
   }
   
   
   
   // 근무 등록 내역 상세보기 누르면 나오는 컨트롤러 >> AJAX 처리
   @ResponseBody 
   @RequestMapping(value = "/genregdetail.action", method = RequestMethod.POST)
   public String GenRegDetailList(HttpSession session, @RequestParam("gen_req_id") String gen_req_id
                           , Model model
                           , HttpServletResponse response) 
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.

      //System.out.println("컨트롤러 진입 성공");
      String result = null;
      
      ISitCareListDAO IsclDao = sqlSession.getMapper(ISitCareListDAO.class);
      
      // gen_req_id 필요하니 다시 보냄
       //model.addAttribute(gen_req_id, gen_req_id);
      
       SitCareListDTO dto = IsclDao.regDetailedList(gen_req_id);
      // 정보 보냄
       /*
      map.put("chi_name", IsclDao.regDetailedList(gen_req_id).getChi_name());
      map.put("par_start_date", IsclDao.regDetailedList(gen_req_id).getPar_start_date());
      map.put("par_end_date", IsclDao.regDetailedList(gen_req_id).getPar_end_date());
      map.put("par_start_time", IsclDao.regDetailedList(gen_req_id).getPar_start_time());
      map.put("par_end_time", IsclDao.regDetailedList(gen_req_id).getPar_end_time());
      map.put("gu_addr", IsclDao.regDetailedList(gen_req_id).getGu_addr());
      map.put("child_gender", IsclDao.regDetailedList(gen_req_id).getChild_gender());
      map.put("child_age", IsclDao.regDetailedList(gen_req_id).getChild_age());
      map.put("medical_type", IsclDao.regDetailedList(gen_req_id).getMedical_type());
      map.put("allergie_type", IsclDao.regDetailedList(gen_req_id).getAllergie_type());
      map.put("disability_type", IsclDao.regDetailedList(gen_req_id).getDisability_type());
      map.put("message", IsclDao.regDetailedList(gen_req_id).getMessage());
      */
       
       StringBuffer sb = new StringBuffer();
       sb.append("<div class=\"info tbody\" id=\"\">");
       sb.append("<div class=\"row\" id=\"detailInfo\">");
       sb.append("<div class='col-md-1' id='name'>" + dto.getPar_name() + "</div>");
       sb.append("<div class='col-md-2' id='careDays'>" + dto.getPar_start_date() +
             " ~ " + dto.getPar_end_date() + "<br />" + dto.getPar_start_time() + "시 ~ " + dto.getPar_end_time() + "시</div>");
       sb.append("<div class='col-md-2' id='gu_addr'>" + dto.getGu_addr() + "</div>");
       sb.append("<div class='col-md-1' id='child_gender'>" + dto.getChild_gender() + "</div>");
       sb.append("<div class='col-md-1' id='child_age'>" + dto.getChild_age() + "</div>");
       sb.append("<div class='col-md-1' id='medical_type'>" + dto.getMedical_type() +"</div>");
       sb.append("<div class='col-md-2' id='allergie_type'>" + dto.getAllergie_type() + "</div>");
       sb.append("<div class='col-md-2' id='disability_type'>" + dto.getDisability_type() + "</div>");
       sb.append("</div>");
       sb.append("</div>");
       sb.append("<div class='info thead'>");
       sb.append("<div class='row'>");
       sb.append("<div class='col-md-12' style='text-align: center;'> 전달 메시지</div>");
       sb.append("</div>");
       sb.append("</div>");
       sb.append("<div class='info tbody'>");
       sb.append("<div class='row'>");
       sb.append("<div class='col-md-12' id='message' style='text-align: left;''>" + dto.getMessage() + "</div>");
       sb.append("</div>");
       sb.append("</div>");
      
       response.setContentType("text/html; charset=UTF-8");
       response.setCharacterEncoding("UTF-8");
       
       result = sb.toString();
       //System.out.println(result);
      //System.out.println("냣뇨");
      
      return result;
   }
   
   // 근무 등록 내역에서 돌봄 예스 누르면 나오는 컨트롤러
   @RequestMapping(value = "/sittergenreqconfirminsert.action", method = RequestMethod.GET)
   public String AnswerYes(HttpSession session, @RequestParam("gen_req_id") String gen_req_id, Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      String sit_backup_id = sitter.getSit_backup_id();
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
            
      String result = null;
      
      IGenConfirmedDAO gcfDao = sqlSession.getMapper(IGenConfirmedDAO.class);
      GenConfirmedDTO gcfDto = new GenConfirmedDTO();
      
      gcfDto.setGen_req_id(gen_req_id);
      
      // 돌봄 확정에 insert >> int로 분기 처리 가능
      gcfDao.add(gcfDto);
      
      // 다음 페이지를 위해 아이디 추가
      model.addAttribute("sit_backup_id", sit_backup_id);
      
      // 돌봄 제공 내역으로 리다이렉트
      result = "redirect:sittergenreqansweredlist.action";
      
      return result;
   }
   
   
   // 근무 등록 내역에서 돌봄 거절하면 나오는 컨트롤러
   @RequestMapping(value = "/sittergenreqcancelinsert.action", method = RequestMethod.GET)
   public String AnswerNo(HttpSession session, @RequestParam("gen_req_id") String gen_req_id
                     , String reason_canceled_id, Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
            
      String result = null;
      
      // 의존성 주입
      IGenPayDAO payDao = sqlSession.getMapper(IGenPayDAO.class);
      IGenCanceledDAO gcDao = sqlSession.getMapper(IGenCanceledDAO.class);
      GenCanceledDTO gcDto = new GenCanceledDTO();
      
      // 취소 테이블에 넣으려면 gen_canceled_id, gen_pay_rec_id, reason_canceled_id가 필요한데, 
      // 이중 1은 시퀀스로 자동생성, 2는 찾아야 함, 3은 이미 있다.
      // 따라서 gen_pay_rec_id를 찾는다.
      //String gen_pay_rec_id = payDao.searchGenCC(gen_req_id);
      
      //System.out.println(gen_pay_rec_id);
      // 일반 결제 코드 주입
      gcDto.setReason_canceled_id(gen_req_id);
      gcDto.setReason_canceled_id(reason_canceled_id);
      
      
      //System.out.println(gen_req_id + reason_canceled_id); >> 데이터 잘 왔음
      
      // 일반 돌봄 예약 취소에 insert
      // >> 프로시저로 만들었기 때문에 프로시저로 처리한다. 
      gcDao.addGenCancelAndRefund(gcDto); // 이 처리가 실패한 것인 듯?
      
      
      // 돌봄 제공 내역으로 리다이렉트
      result = "redirect:sittergenreqansweredlist.action";
      
      return result;
   }
   
   // 돌봄 제공 내역 확인 컨트롤러
   @RequestMapping(value = "/sittergenreqansweredlist.action", method = RequestMethod.GET)
   public String AnswerList(HttpSession session, Model model) 
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      String sit_backup_id = sitter.getSit_backup_id();
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
            
      String result = null;
      
      ISitCareListDAO sitcarelistDao = sqlSession.getMapper(ISitCareListDAO.class);
      
      // 돌봄 제공 내역 확인 메소드 사용 >> 
      model.addAttribute("answerList", sitcarelistDao.answerList(sit_backup_id));
      
      model.addAttribute("sit_backup_id", sit_backup_id);
      
      //System.out.println("값 받아옴");
      result = "/WEB-INF/view/SitterGenReqAnsweredList.jsp";
      
      return result;
   }
   
   // 근무 등록 내역 확인 >> 자기소개서 자세히 보기 클릭 >> 새창으로 나오는 자기소개
   // 돌봄 제공 내역 확인 >> 자기소개서 자세히 보기 클릭 >> 새창으로 나오는 자기소개
   @RequestMapping(value = "/sitterregintroduction.action", method = RequestMethod.GET)
   public String SitterRegIntroduction(HttpSession session, @RequestParam("gen_reg_id") String gen_reg_id, Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
            
      IGenRegDAO genRegDao = sqlSession.getMapper(IGenRegDAO.class);
      
      model.addAttribute("register", genRegDao.regOnesearch(gen_reg_id));
      
      return "/WEB-INF/view/SitterRegIntroduction.jsp";
   }
   
   // 돌봄 제공 내역 확인 상세 정보 새창 처리 컨트롤러
   // 돌봄 완료 내역 확인 + 돌봄 제공 내역 확인 >> 일반 돌봄 클릭 >> 상세 정보 버튼 클릭 >> 새창으로 나오는 상세 정보.
   @RequestMapping(value = "/pargenreqdetail.action", method = RequestMethod.GET)
   public String ParGenReqDetailList(HttpSession session, @RequestParam("gen_req_id") String gen_req_id, Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
      
      ISitCareListDAO sitCareListDao = sqlSession.getMapper(ISitCareListDAO.class);
      
      model.addAttribute("list", sitCareListDao.answerDetailedList(gen_req_id));
      
      
      return "/WEB-INF/view/ParGenReqDetail.jsp";
   }
   
   
   // 돌봄 완료 내역 띄우기
   @RequestMapping(value = "/carecompletelist.action", method = RequestMethod.GET)
   public String CareCompleteList(HttpSession session, Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      String sit_backup_id = sitter.getSit_backup_id();
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
            
      ISitCareListDAO sitCareListDao = sqlSession.getMapper(ISitCareListDAO.class);
      
      model.addAttribute("completeList", sitCareListDao.genCompleteList(sit_backup_id));
      model.addAttribute("sit_backup_id", sit_backup_id);
      
      
      return "/WEB-INF/view/CareCompleteList.jsp";
   }
   
   
   // 시터 탈퇴
   @RequestMapping(value = "/sitterwithdraw.action", method = RequestMethod.GET)
   public String SitterWithdraw(HttpSession session, Model model)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      String sit_backup_id = sitter.getSit_backup_id();
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
            
      model.addAttribute("sit_backup_id", sit_backup_id);
      
      
      return "/WEB-INF/view/SitterWithdraw.jsp";
   }
   
   
   // 시터 탈퇴 완료
   @RequestMapping(value = "/sitterwithdrawed.action", method = RequestMethod.GET)
   public String SitterWithdrawed(HttpSession session, Model model, String entered_pw)
   {
      // 페이지 접근 권한 확인을 위해 세션에서 시터 파일을 받아 왔음 --------------------
      SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
      
      if (sitter == null)
         return "redirect:/iLook.action";
      
      // -------------------------------------- 접근 권한 확인. 하기 과정을 진행합니다.
      
      String sit_backup_id = sitter.getSit_backup_id();
      
      // ============================================================================== 밑은 내가 이미 해놓은 것들.
      
      //
      if (entered_pw == sitter.getPw())
      {
         return "/WEB-INF/view/SitterWithdrawed.jsp";
      }
      
      return "redirect:/sitterwithdraw.action";
   }
   
   
   
   
}
