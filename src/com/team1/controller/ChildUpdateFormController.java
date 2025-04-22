package com.team1.controller;

import com.team1.dto.ChildDTO;
import com.team1.mybatis.IChildDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ChildUpdateFormController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping("/childupdateform.action")
    public String showUpdateForm(@RequestParam("child_backup_id") String child_backup_id, Model model)
    {
        IChildDAO dao = sqlSession.getMapper(IChildDAO.class);
        ChildDTO child = dao.findChildInfoByBackupId(child_backup_id);

        if (child == null)
        {
            model.addAttribute("error", "아이 정보를 찾을 수 없습니다.");
            return "/WEB-INF/view/Error.jsp";  // 또는 redirect:/parentmypage.action
        }

        model.addAttribute("child", child);
        model.addAttribute("disabilities", dao.getDisabilityTypes());
        model.addAttribute("allergies", dao.getAllergyTypes());
        model.addAttribute("medicals", dao.getMedicalTypes());

        return "/WEB-INF/view/ChildUpdateForm.jsp";
    }
}
