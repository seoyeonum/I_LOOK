package com.team1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.dto.ParDTO;
import com.team1.mybatis.IParLoginDAO;
import com.team1.mybatis.IParWithdrawedDAO;

@Controller
public class ParentloginController
{
    @Autowired
    private SqlSession sqlSession;

    // 부모 로그인 처리
    @RequestMapping(value = "/parentlogin.action", method = RequestMethod.POST)
    public String parentLogin(@RequestParam("id") String id,
                              @RequestParam("pw") String pw,
                              HttpSession session,
                              HttpServletRequest request)
    {
        IParLoginDAO dao = sqlSession.getMapper(IParLoginDAO.class);

        // 1️. ID → PAR_BACKUP_ID 조회
        ParDTO parentBackup = dao.findById(id);  

        if (parentBackup == null)
        {
            request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "/WEB-INF/view/logIn.jsp";
        }

        String par_backup_id = parentBackup.getPar_backup_id();

        // 2️. 탈퇴 여부 확인
        IParWithdrawedDAO withdrawedDao = sqlSession.getMapper(IParWithdrawedDAO.class);
        int withdrawCount = withdrawedDao.checkWithdrawed(par_backup_id);

        if (withdrawCount > 0)
        {
            request.setAttribute("message", "탈퇴 회원입니다.");
            return "/WEB-INF/view/logIn.jsp";
        }

        // 3️. 여기서 PW 확인 (탈퇴 회원 아닐 때만 PAR_REG 조회 가능)
        ParDTO parentReg = dao.findPwByBackupId(par_backup_id);

        if (parentReg == null || !parentReg.getPw().equals(pw))
        {
            request.setAttribute("message", "아이디 또는 비밀번호가 일치하지 않습니다.");
            return "/WEB-INF/view/logIn.jsp";
        }

        // 🔓 정상 로그인
        session.setAttribute("loginParent", parentBackup);
        session.setAttribute("par_backup_id", par_backup_id);
        return "forward:/genmain.action";
    }

}
