package com.team1.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.dto.GenConfirmedDTO;
import com.team1.mybatis.IGenConfirmedDAO;   // ✅ 수정 포인트

@Controller
public class CareDoneController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping(value = "/parentcaredone.action", method = RequestMethod.GET)
    public String careDoneList(HttpSession session, Model model)
    {
        String par_backup_id = (String) session.getAttribute("par_backup_id");

        if (par_backup_id == null)
        {
            return "redirect:/loginform.action";
        }

        IGenConfirmedDAO dao = sqlSession.getMapper(IGenConfirmedDAO.class);  // ✅ 여기 수정!
        ArrayList<GenConfirmedDTO> list = dao.findByParent(par_backup_id);   // ✅ DTO 타입 일치!

        model.addAttribute("careDoneList", list);
        return "/WEB-INF/view/CareCompleted.jsp";
    }
}
