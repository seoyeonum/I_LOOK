package com.team1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
 
 import com.team1.dto.SitDTO;
 import com.team1.mybatis.ISitDAO;
 import com.team1.mybatis.ISitLoginDAO;
 import com.team1.mybatis.ISitWithdrawedDAO;
 
 @Controller
 public class SitterLoginController
 {
     @Autowired
     private SqlSession sqlSession;
     
 
     // 시터 로그인 처리
     @RequestMapping(value = "/sitterlogin.action", method = RequestMethod.POST)
     public String sitterLogin(@RequestParam("id") String id,
             @RequestParam("pw") String pw,
             HttpSession session,
             HttpServletRequest request)
	{
	ISitLoginDAO dao = sqlSession.getMapper(ISitLoginDAO.class);
         
         String sit_backup_id = dao.findById(id);
 
         // 1️. ID가 없으면
         if (sit_backup_id == null)
         {
             request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
             return "/WEB-INF/view/logIn.jsp";
         }
 
         // 2️. 탈퇴 여부 확인
         ISitWithdrawedDAO withdrawedDao = sqlSession.getMapper(ISitWithdrawedDAO.class);
         int withdrawCount = withdrawedDao.checkWithdrawed(sit_backup_id);
 
         if (withdrawCount > 0)
         {
             request.setAttribute("message", "탈퇴 회원입니다.");
             return "/WEB-INF/view/logIn.jsp";
         }
 
         // 3️. 비밀번호 확인 (SIT_REG)
         SitDTO sitterReg = dao.loginCheck(id, pw);
 
         if (sitterReg == null || !sitterReg.getPw().equals(pw))
         {
             request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
             return "/WEB-INF/view/logIn.jsp";
         }
         
         // 4️. 거절 여부 확인 (SIT_REJECTED)
         ISitDAO sitDAO = sqlSession.getMapper(ISitDAO.class);
         int rejected = sitDAO.checkSitterRejected(sit_backup_id);
         if (rejected > 0)
         {
             request.setAttribute("message", "승인이 거절된 회원입니다. 관리자에게 문의하세요.");
             return "/WEB-INF/view/logIn.jsp";
         }
 
         // 5️. 승인 여부 확인 (SIT_CHK)
         int approved = sitDAO.checkSitterApproved(sit_backup_id);  // 이 메서드 추가해야 함!
         if (approved == 0)
         {
             request.setAttribute("message", "아직 승인 전입니다. 관리자 승인을 기다려주세요.");
             return "/WEB-INF/view/logIn.jsp";
         }
 
         // 🔓 정상 로그인
         session.setAttribute("loginSitter", sitterReg);
         session.setAttribute("sit_backup_id", sit_backup_id);
         return "forward:/emgmain.action";
     }
     
 }