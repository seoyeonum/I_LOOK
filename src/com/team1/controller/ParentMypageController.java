package com.team1.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.team1.dto.ChildDTO;
import com.team1.dto.ParDTO;
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
    	 System.out.println("왕왕 집가고싶다.");
        // 1. 세션에서 부모 로그인 객체 꺼내기
        ParDTO parent = (ParDTO) session.getAttribute("loginParent");
        System.out.println(parent);
        // 2. 로그인 여부 확인
        if (parent == null || parent.getId() == null)
        {
            System.out.println("⚠ 로그인 정보가 없습니다.");
            return "redirect:/loginform.action";
        }

        // ✅ 3. 세션에서 바로 부모 백업 ID 가져오기 (쿼리 안 타도 됨)
        String parBackupId = parent.getPar_backup_id();

        System.out.println("▶ 부모 백업 ID: " + parBackupId);

        // 4. 아이 목록 조회
        IChildDAO dao = sqlSession.getMapper(IChildDAO.class);
        List<ChildDTO> childList = dao.listName(parBackupId);
        model.addAttribute("childList", childList);
System.out.println("childList");
        return "WEB-INF/view/ParentMypage.jsp";
    }

} 
