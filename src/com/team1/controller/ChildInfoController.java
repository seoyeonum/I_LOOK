package com.team1.controller;

import java.time.LocalDate;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.team1.dto.ChildDTO;
import com.team1.dto.ParDTO;
import com.team1.mybatis.IChildDAO;
import com.team1.mybatis.IParDAO;

@Controller
public class ChildInfoController
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/childinfoview.action")
	public String showChildInfo(HttpServletRequest request, Model model)
	{
		String child_backup_id = request.getParameter("child_backup_id");
		System.out.println("▶ child_backup_id: " + child_backup_id);  // 로그 꼭 찍기
		
        IChildDAO childDao = sqlSession.getMapper(IChildDAO.class);
        IParDAO parDao = sqlSession.getMapper(IParDAO.class);
        
        // 아이 상세 정보
        ChildDTO child = childDao.findChildInfoByBackupId(child_backup_id);
        
        // 아이와 연결된 부모 정보
        String par_backup_id = child.getPar_backup_id();	// 뷰에서 가져옴.
        ParDTO parent = parDao.search(par_backup_id);
        
        // 나이 계산
        int age = 0;
        
        try
        {
            String ssnFirst = child.getSsn_first();       // 예: "180101"
            String ssnSecond = child.getSsn_second();     // 예: "3******"

            String yearPart = ssnFirst.substring(0, 2);   // "18"
            String genderDigit = ssnSecond.substring(0, 1); // "1" ~ "4"

            int birthYear = Integer.parseInt(yearPart);

            if (genderDigit.equals("1") || genderDigit.equals("2"))
                birthYear += 1900;
            else if (genderDigit.equals("3") || genderDigit.equals("4"))
                birthYear += 2000;
            else
                birthYear += 2000; // 혹시 모를 예외

            int currentYear = LocalDate.now().getYear();
            age = currentYear - birthYear + 1;
        }
        catch (Exception e)
        {
            System.out.println("▶ 나이 계산 오류: " + e.getMessage());
        }
        
        model.addAttribute("child", child);
        model.addAttribute("parent", parent);
        model.addAttribute("age", age);
        
		return "/WEB-INF/view/ChildInfo.jsp";
		
	}
}
