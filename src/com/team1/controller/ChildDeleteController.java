package com.team1.controller;

import com.team1.mybatis.IChildDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class ChildDeleteController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping("/childdelete.action")
    public String deleteChild(@RequestParam("child_backup_id") String child_backup_id,
                              HttpSession session)
    {
        IChildDAO dao = sqlSession.getMapper(IChildDAO.class);

        // 1. 연결된 테이블 데이터 먼저 삭제
        dao.removeDiseaseByBackup(child_backup_id);     // 지병
        dao.removeAllergyByBackup(child_backup_id);     // 알레르기
        dao.removeDisabilityByBackup(child_backup_id);  // 장애

        // 2. 아이 등록 정보 삭제
        dao.removeByBackupId(child_backup_id);          // CHILD_REG

        // 3. 아이 백업 정보 삭제
        dao.removeChildBackup(child_backup_id);         // CHILD_BACKUP

        // 4. 삭제 성공 플래그 세션에 저장 → JSP에서 alert 띄우기 위함
        session.setAttribute("deleteSuccess", true);

        // 5. 부모 마이페이지로 리디렉션
        return "redirect:/parentmypage.action";
    }
}
