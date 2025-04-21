package com.team1.controller;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import com.team1.dto.ChildDTO;
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
        IChildDAO dao = sqlSession.getMapper(IChildDAO.class);

        String loginId = (String) session.getAttribute("id");
        String parBackupId = dao.findParBackupId(loginId);

        child.setPar_backup_id(parBackupId);

        String childBackupId = generateId("CBAC");
        String childRegId = generateId("CREG");

        child.setChild_backup_id(childBackupId);
        child.setChild_reg_id(childRegId);

        dao.addChildBackup(child);
        dao.add(child);

        if (child.getDisability_type_id() != null && !"없음".equals(child.getDisability_type_id()))
        {
            child.setChild_disability_id(generateId("CDS"));
            dao.addDisability(child);
        }

        if (child.getMedical_type_id() != null && !"없음".equals(child.getMedical_type_id()))
        {
            child.setChild_medical_id(generateId("CMD"));
            dao.addDisease(child);
        }

        if (child.getAllergy_type_id() != null && !"없음".equals(child.getAllergy_type_id()))
        {
            child.setChild_allergy_id(generateId("CAL"));
            dao.addAllergy(child);
        }

        return "redirect:/parentmypage.action";
    }

    private String generateId(String prefix)
    {
        return prefix + UUID.randomUUID().toString().substring(0, 5).toUpperCase();
    }
}
