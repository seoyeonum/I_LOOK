package com.team1.controller;

import com.team1.dto.ChildDTO;
import com.team1.mybatis.IChildDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ChildUpdateController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping(value = "/childupdate.action", method = RequestMethod.POST)
    public String updateChild(ChildDTO child, Model model)
    {
        IChildDAO dao = sqlSession.getMapper(IChildDAO.class);

        // 수정 처리 (백업 기준)
        dao.modifyByBackupId(child);

        // 최신 정보 다시 조회 (백업 기준)
        ChildDTO updated = dao.findByBackupId(child.getChild_backup_id());

        model.addAttribute("child", updated);
        model.addAttribute("disabilities", dao.getDisabilityTypes());
        model.addAttribute("allergies", dao.getAllergyTypes());
        model.addAttribute("medicals", dao.getMedicalTypes());
        model.addAttribute("updated", true);

        return "/WEB-INF/view/ChildUpdateForm.jsp";
    }
}
