package com.team1.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.team1.dto.ChildDTO;
import com.team1.mybatis.IChildDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ParentMypageController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping("/parentmypage.action")
    public String parentMypage(HttpSession session, Model model)
    {
        String loginId = (String) session.getAttribute("id");
        IChildDAO dao = sqlSession.getMapper(IChildDAO.class);
        
        String parBackupId = dao.findParBackupId(loginId);

        List<ChildDTO> childList = dao.findChildrenByParent(parBackupId); 
        model.addAttribute("childList", childList);

        return "ParentMypage";
    }
}
