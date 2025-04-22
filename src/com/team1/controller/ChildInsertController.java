package com.team1.controller;

import javax.servlet.http.HttpSession;

import com.team1.dto.ChildDTO;
import com.team1.dto.ParDTO;
import com.team1.mybatis.IChildDAO;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
public class ChildInsertController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping(value = "/childinsert.action", method = RequestMethod.POST)
    public String insertChild(ChildDTO child, HttpSession session)
    {
        // 1. 로그인된 부모 정보 가져오기
        ParDTO parent = (ParDTO) session.getAttribute("loginParent");
        if (parent == null)
        {
            return "redirect:/loginform.action";
        }

        // 2. 부모 백업 ID 설정
        String parBackupId = parent.getPar_backup_id();
        child.setPar_backup_id(parBackupId);

        // 3. DAO 호출
        IChildDAO dao = sqlSession.getMapper(IChildDAO.class);

        // 4. 백업 → 등록 순으로 아이 정보 저장
        dao.addChildBackup(child);   // 여기서 child_backup_id 생성됨
        dao.add(child);              // 여기서 child_reg_id 생성됨

        // 5. 선택 항목 (지병, 알레르기, 장애) 등록
        if (child.getDisability_type_id() != null && !"없음".equals(child.getDisability_type_id()))
        {
            dao.addDisability(child); // child_disability_id는 XML에서 selectKey로 생성
        }

        if (child.getMedical_type_id() != null && !"없음".equals(child.getMedical_type_id()))
        {
            dao.addDisease(child); // child_medical_id likewise
        }

        if (child.getAllergy_type_id() != null && !"없음".equals(child.getAllergy_type_id()))
        {
            dao.addAllergy(child);
        }

        // 6. 완료 후 마이페이지 이동
        return "redirect:/parentmypage.action";
    }
}
