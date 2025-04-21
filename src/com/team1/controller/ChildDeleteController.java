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

        // 연결 테이블 삭제
        dao.removeDiseaseByBackup(child_backup_id);
        dao.removeAllergyByBackup(child_backup_id);
        dao.removeDisabilityByBackup(child_backup_id);

        // 본문 삭제
        dao.removeByBackupId(child_backup_id);      // CHILD_REG
        dao.removeChildBackup(child_backup_id);     // CHILD_BACKUP

        // 세션에 삭제 성공 정보 저장
        session.setAttribute("deleteSuccess", true);

        return "redirect:/parentmypage.action";
    }
}
