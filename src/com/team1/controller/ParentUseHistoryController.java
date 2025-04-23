package com.team1.controller;

import java.util.List;
import javax.servlet.http.HttpSession;

import com.team1.dto.ChildDTO;
import com.team1.dto.GenReqDTO;        // ✅ GenReqDTO만 사용!
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

        // 4. 부모의 신청한 예약 내역 전체 조회 (취소 포함 전부!)
        List<GenReqDTO> useList = genReqDao.findByParent(parBackupId);

        // 5. 현재 이용 중 or 최근 이용 구하기
        GenReqDTO currentUse = null;

        if (useList != null && !useList.isEmpty())
        {
            for (GenReqDTO dto : useList)
            {
                String careStatus = dto.getCare_status();

                if ("돌봄 중".equals(careStatus) || "예약 중".equals(careStatus))
                {
                    currentUse = dto;
                    break;  // 가장 첫 번째 진행 중 내역 사용
                }
            }

            // 진행 중이 없으면 가장 최근 이용 내역으로 설정
            if (currentUse == null)
            {
                GenReqDTO latest = useList.get(0);
                for (GenReqDTO dto : useList)
                {
                    if (dto.getEnd_date().compareTo(latest.getEnd_date()) > 0)
                    {
                        latest = dto;
                    }
                }
                currentUse = latest;
            }
        }

        // 6. JSP로 데이터 넘기기
        model.addAttribute("useList", useList);                 // 전체 이용 내역
        model.addAttribute("childList", childList);             // 아이 목록
        model.addAttribute("currentUse", currentUse);           // 현재 이용 내역
        model.addAttribute("currentStatus", (currentUse != null) ? currentUse.getCare_status() : "");  // 현재 이용 상태

        // 7. JSP 위치 반환
        return "/WEB-INF/view/ChildUsed.jsp";
    }
}
