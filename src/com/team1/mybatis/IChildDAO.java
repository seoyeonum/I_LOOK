/* =================
 IChildDAO.java
=================== */

package com.team1.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.dto.ChildDTO;

public interface IChildDAO
{
    // 아이 등록 및 수정
    public int add(ChildDTO child);
    public int modifyByBackupId(ChildDTO child);

    // 아이 삭제
    public int removeByBackupId(String child_backup_id);
    public int removeChildBackup(String child_backup_id);

    // 부모 백업 ID 조회 (이름 통일 완료)
    public String findParBackupId(String id);

    // 아이 이름 목록
    //public ArrayList<ChildDTO> listName(String parBackupId);
    public ArrayList<ChildDTO> listName(@Param("parBackupId") String parBackupId);

    // 단일 아이 조회
    public ChildDTO findByBackupId(String child_backup_id);

    // 아이 백업 등록
    public int addChildBackup(ChildDTO child);

    // 지병 등록 및 조회
    public int addDisease(ChildDTO disease);
    public ArrayList<String> searchDisease(String child_backup_id);
    public int removeDiseaseByBackup(String child_backup_id);

    // 알레르기 등록 및 조회
    public int addAllergy(ChildDTO allergy);
    public ArrayList<String> searchAllergy(String child_backup_id);
    public int removeAllergyByBackup(String child_backup_id);

    // 장애 등록 및 조회
    public int addDisability(ChildDTO disability);
    public ArrayList<String> searchDisability(String child_backup_id);
    public int removeDisabilityByBackup(String child_backup_id);

    // 유형 목록
    public ArrayList<ChildDTO> getDisabilityTypes();
    public ArrayList<ChildDTO> getAllergyTypes();
    public ArrayList<ChildDTO> getMedicalTypes();
    
    public ChildDTO findChildInfoByBackupId(String child_backup_id);
    
    // 부모가 등록한 모든 아이들
	public List<ChildDTO> listByParent(String parBackupId);


}