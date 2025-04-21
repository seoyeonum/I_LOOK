package com.team1.controller;

import com.team1.mybatis.IChildDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ChildInsertFormController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping("/childinsertform.action") // <<== OK!
    public String childInsertForm(Model model)
    {
        IChildDAO dao = sqlSession.getMapper(IChildDAO.class);

        model.addAttribute("disabilities", dao.getDisabilityTypes());
        model.addAttribute("allergies", dao.getAllergyTypes());
        model.addAttribute("medicals", dao.getMedicalTypes());

        return "/WEB-INF/view/ChildInsertForm.jsp"; // ViewResolver가 "/WEB-INF/view/ChildInsertForm.jsp"로 연결
    }
}
