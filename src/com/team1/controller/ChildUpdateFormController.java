package com.team1.controller;

import javax.servlet.http.HttpServletRequest;

import com.team1.dto.ChildDTO;
import com.team1.mybatis.IChildDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChildUpdateFormController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping("/childupdateform.action")
    public String showUpdateForm(HttpServletRequest request, Model model)
    {
        String child_backup_id = request.getParameter("child_backup_id");

        IChildDAO dao = sqlSession.getMapper(IChildDAO.class);
        ChildDTO child = dao.findByBackupId(child_backup_id);

        model.addAttribute("child", child);
        model.addAttribute("disabilities", dao.getDisabilityTypes());
        model.addAttribute("allergies", dao.getAllergyTypes());
        model.addAttribute("medicals", dao.getMedicalTypes());

        return "/WEB-INF/view/ChildUpdateForm.jsp";  // /WEB-INF/view/ChildUpdateForm.jsp
    }
}
