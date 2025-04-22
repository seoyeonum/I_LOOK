package com.team1.controller;

import javax.servlet.http.HttpSession;

import com.team1.dto.ParDTO;
import com.team1.dto.ParWithdrawedDTO;
import com.team1.mybatis.IParDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ParentUpdateController
{
    @Autowired
    private SqlSession sqlSession;

    // ▶ 부모 정보 조회 (수정 폼)
    @RequestMapping(value = "/parentupdateform.action", method = RequestMethod.GET)
    public String parentUpdateForm(HttpSession session, Model model)
    {
        // 로그인 부모 정보 확인
        ParDTO parent = (ParDTO) session.getAttribute("loginParent");
        if (parent == null)
            return "redirect:/loginform.action";

        IParDAO dao = sqlSession.getMapper(IParDAO.class);
        ParDTO parentInfo = dao.search(parent.getPar_backup_id());

        model.addAttribute("parent", parentInfo);
        return "/WEB-INF/view/ParentUpdateForm.jsp";
    }

    // ▶ 부모 정보 수정 처리
    @RequestMapping(value = "/parentupdate.action", method = RequestMethod.POST)
    public String parentUpdate(ParDTO parent, HttpSession session, Model model)
    {
        IParDAO dao = sqlSession.getMapper(IParDAO.class);
        dao.update(parent);  // ⚠️ update 메서드 (modify 말고!)

        // 수정된 정보 재조회
        ParDTO updatedParent = dao.search(parent.getPar_backup_id());
        model.addAttribute("parent", updatedParent);
        model.addAttribute("updated", true);  // 수정 완료 시 알림 표시

        return "/WEB-INF/view/ParentUpdateForm.jsp";
    }

    // ▶ 부모 회원 탈퇴 처리
    @RequestMapping(value = "/parentwithdraw.action", method = RequestMethod.GET)
    public String parentWithdraw(HttpSession session, String reason_withdrawed_id)
    {
        // 로그인 부모 세션 확인
        ParDTO parent = (ParDTO) session.getAttribute("loginParent");
        if (parent == null)
            return "redirect:/loginform.action";

        IParDAO dao = sqlSession.getMapper(IParDAO.class);

        // 탈퇴 정보 구성
        ParWithdrawedDTO withdrawed = new ParWithdrawedDTO();
        withdrawed.setPar_backup_id(parent.getPar_backup_id());
        withdrawed.setReason_withdrawed_id(reason_withdrawed_id);

        // 탈퇴 처리 (탈퇴 테이블 insert)
        dao.addWithdrawed(withdrawed);

        // 세션 비우기 (로그아웃)
        session.invalidate();

        // 로그인 페이지로 이동 + 탈퇴 완료 메시지
        return "redirect:/loginform.action?message=탈퇴가 완료되었습니다.";
    }
}
