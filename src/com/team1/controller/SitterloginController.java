/*package com.team1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.dto.SitDTO;
import com.team1.mybatis.ISitLoginDAO;
import com.team1.mybatis.ISitWithdrawedDAO;

@Controller
public class SitterloginController
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
        SitDTO sitter = dao.loginCheck(id, pw); // 로그인 체크 후 SitDTO 반환

        
        if (sitter != null) // 로그인 성공
        {
            session.setAttribute("loginSitter", sitter);
            return "forward:/emgmain.action";
        }

        String sit_backup_id = sitterBackup.getSit_backup_id();

        // 2️. 탈퇴 여부 확인
        ISitWithdrawedDAO withdrawedDao = sqlSession.getMapper(ISitWithdrawedDAO.class);
        int withdrawCount = withdrawedDao.checkWithdrawed(sit_backup_id);

        if (withdrawCount > 0)
        {
            request.setAttribute("message", "탈퇴 회원입니다.");
            return "/WEB-INF/view/logIn.jsp";
        }

        // 3️. 여기서 PW 확인 (탈퇴 회원 아닐 때만 SIT_REG 조회 가능)
        SitDTO sitterReg = dao.findPwByBackupId(sit_backup_id);

        if (sitterReg == null || !sitterReg.getPw().equals(pw))
        {
            request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "/WEB-INF/view/logIn.jsp";
        }

        // 🔓 정상 로그인
        session.setAttribute("loginSitter", sitterBackup);
        session.setAttribute("sit_backup_id", sit_backup_id);
        return "forward:/sitterMain.action";  // 시터 메인 페이지로 이동
    }
}*/
