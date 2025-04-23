package com.team1.controller;

// 부모 마이페이지에서 아이 돌봄 정보 출력 리스트

import java.util.List;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.team1.dto.ChildDTO;
import com.team1.dto.GenReqDTO;
import com.team1.dto.ParDTO;
import com.team1.mybatis.IChildDAO;
import com.team1.mybatis.IGenReqDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ParentUseHistoryController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping("/sitterusehistory.action")
    public String showSitterUseHistory(HttpSession session, Model model)
    {
        // 1. 로그인 확인
        ParDTO parent = (ParDTO) session.getAttribute("loginParent");
        if (parent == null)
            return "redirect:/loginform.action";

        String parBackupId = parent.getPar_backup_id();

        // 2. DAO 매퍼 가져오기
        IGenReqDAO genReqDao = sqlSession.getMapper(IGenReqDAO.class);
        IChildDAO childDao = sqlSession.getMapper(IChildDAO.class);

        // 3. 부모의 모든 아이 목록 조회
        List<ChildDTO> childList = childDao.listByParent(parBackupId);

        // 4. 부모의 예약 내역 조회
        List<GenReqDTO> useList = genReqDao.findByParent(parBackupId);

        // 5. 현재 이용 중 or 최근 이용 구하기 (Java 7 compatible)
        GenReqDTO currentUse = null;
        String currentStatus = "";

        if (useList != null && !useList.isEmpty())
        {
            String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date());

            for (int i = 0; i < useList.size(); i++)
            {
                GenReqDTO dto = useList.get(i);
                String startDate = dto.getStart_date();
                String endDate = dto.getEnd_date();

                if (today.compareTo(startDate) >= 0 && today.compareTo(endDate) <= 0)
                {
                    currentUse = dto;
                    currentStatus = "이용 중";
                    break;
                }
            }

            // 이용 중이 없다면 가장 최근 이용
            if (currentUse == null)
            {
                GenReqDTO latest = useList.get(0);
                for (int i = 1; i < useList.size(); i++)
                {
                    if (useList.get(i).getEnd_date().compareTo(latest.getEnd_date()) > 0)
                    {
                        latest = useList.get(i);
                    }
                }
                currentUse = latest;
                currentStatus = "최근 이용";
            }
        }

        // 6. JSP로 데이터 넘기기
        model.addAttribute("useList", useList);
        model.addAttribute("childList", childList);
        model.addAttribute("currentUse", currentUse);
        model.addAttribute("currentStatus", currentStatus);

        // 7. JSP 위치 반환
        return "/WEB-INF/view/ChildUsed.jsp";
    }
}
