/* =================
 	IChildDAO.java
=================== */

package com.team1.mybatis;

import java.util.ArrayList;
import java.util.List;

import com.team1.dto.ChildDTO;

public interface IChildDAO
{
    // 아이 등록 및 수정
    public int add(ChildDTO child);                        // CHILD_REG INSERT
    public int modifyByBackupId(ChildDTO child);           // CHILD_REG UPDATE by CHILD_BACKUP_ID

    // 아이 삭제 (CHILD_REG, CHILD_BACKUP)
    public int removeByBackupId(String child_backup_id);   // CHILD_REG 삭제
    public int removeChildBackup(String child_backup_id);  // CHILD_BACKUP 삭제

    // 부모 아이디로 부모 백업 ID 조회
    public String findParBackupId(String id);

    // 부모 기준 아이 전체 목록 조회
    public List<ChildDTO> findChildrenByParent(String parBackupId);

    // 아이 단일 조회 (CHILD_BACKUP_ID 기준)
    public ChildDTO findByBackupId(String child_backup_id);

    // 아이 백업 등록
    public int addChildBackup(ChildDTO child);

    // 아이 지병
    public int addDisease(ChildDTO disease);
    public ArrayList<String> searchDisease(String child_backup_id);
    public int removeDiseaseByBackup(String child_backup_id);

    // 아이 알레르기
    public int addAllergy(ChildDTO allergy);
    public ArrayList<String> searchAllergy(String child_backup_id);
    public int removeAllergyByBackup(String child_backup_id);

    // 아이 장애
    public int addDisability(ChildDTO disability);
    public ArrayList<String> searchDisability(String child_backup_id);
    public int removeDisabilityByBackup(String child_backup_id);

    // 자격/질환/장애 유형 목록
    public ArrayList<ChildDTO> getDisabilityTypes();
    public ArrayList<ChildDTO> getAllergyTypes();
    public ArrayList<ChildDTO> getMedicalTypes();
}
