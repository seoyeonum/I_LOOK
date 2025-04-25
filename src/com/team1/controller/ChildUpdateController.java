package com.team1.controller;

import com.team1.dto.ChildDTO;
import com.team1.mybatis.IChildDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ChildUpdateController
{
    @Autowired
    private SqlSession sqlSession;

    @RequestMapping(value = "/childupdate.action", method = RequestMethod.POST)
    public String updateChild(ChildDTO child, Model model)
    {
        IChildDAO dao = sqlSession.getMapper(IChildDAO.class);

        // ✅ 1. 아이 기본 정보 수정
        dao.modifyByBackupId(child);

        // ✅ 2. 기존 지병/알레르기/장애 정보 삭제
        dao.removeDiseaseByBackup(child.getChild_backup_id());
        dao.removeAllergyByBackup(child.getChild_backup_id());
        dao.removeDisabilityByBackup(child.getChild_backup_id());

        // ✅ 3. 새롭게 등록 (없음은 등록하지 않음)
        if (isValid(child.getMedical_type_id()))
            dao.addDisease(child);

        if (isValid(child.getAllergy_type_id()))
            dao.addAllergy(child);

        if (isValid(child.getDisability_type_id()))
            dao.addDisability(child);

        // ✅ 4. 뷰 기반 재조회 (선택값 유지 가능)
        ChildDTO updated = dao.findChildInfoByBackupId(child.getChild_backup_id());

        // ✅ 5. 화면에 데이터 전달
        model.addAttribute("child", updated);
        model.addAttribute("disabilities", dao.getDisabilityTypes());
        model.addAttribute("allergies", dao.getAllergyTypes());
        model.addAttribute("medicals", dao.getMedicalTypes());
        model.addAttribute("updated", true);

        // ✅ 로그 (개발 확인용)
        System.out.println("수정 대상 BACKUP ID: " + child.getChild_backup_id());
        System.out.println("선택된 지병 ID: " + child.getMedical_type_id());
        System.out.println("선택된 장애 ID: " + child.getDisability_type_id());
        System.out.println("선택된 알레르기 ID: " + child.getAllergy_type_id());

        return "forward:/WEB-INF/view/ChildUpdateForm.jsp";
    }

    // ✅ 유효성 검사 함수: null 또는 '없음'인 경우 false
    private boolean isValid(String value)
    {
        return value != null && !"없음".equals(value.trim());
    }
}
