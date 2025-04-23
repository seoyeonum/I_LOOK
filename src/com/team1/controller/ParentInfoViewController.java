/*

package com.team1.controller;

import javax.servlet.http.HttpSession;

import com.team1.dto.ParDTO;
import com.team1.mybatis.IParDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ParentInfoViewController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping("/parentinfoview.action")
    public String showParentInfo(HttpSession session, Model model)
    {
        // 1. 로그인한 사용자 ID (세션 기반)
        String id = (String) session.getAttribute("id");

        if (id == null)
        {
            // 로그인 안 된 상태면 로그인 페이지로 리다이렉트
            return "redirect:/loginform.action";
        }

        // 2. DAO 가져오기
        IParDAO dao = sqlSession.getMapper(IParDAO.class);

        // 3. 부모 상세정보 조회 (ID 기준)
        ParDTO parent = dao.search(id);  // 또는 findById, findByBackupId → 본인 스타일 유지 OK

        // 4. View 전달
        model.addAttribute("parent", parent);

        return "/WEB-INF/view/ParentInfo.jsp";
    }
}
*/