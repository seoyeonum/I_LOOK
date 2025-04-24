/* ======================================
    IParDAO.java
    부모(Parent) 관련 MyBatis DAO 인터페이스
    - 부모 회원 가입, 수정, 탈퇴, 조회, 포인트 조회
====================================== */
package com.team1.mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.dto.ParDTO;
import com.team1.dto.ParWithdrawedDTO;
import com.team1.dto.SitDTO;

public interface IParDAO
{

	// ■ 부모 회원 등록 (PAR_REG 테이블)
	public int add(ParDTO parent);

	// ■ 부모 백업 정보 등록 (PAR_BACKUP 테이블)
	public int addBackup(ParDTO parent);

	// ■ 부모 정보 조회 (PAR_BACKUP_ID 기준, JOIN 사용)
	public ParDTO search(String par_backup_id);

	// ■ 부모 회원 수정 (update 사용)
	public int update(ParDTO par); // ✅ 이 메서드만 사용 (modify는 삭제 또는 미사용)

	// ■ 부모 회원 탈퇴 (탈퇴 테이블 PAR_WITHDRAWED에 insert)
	public int addWithdrawed(ParWithdrawedDTO parent_withdrawed);

	// ■ 부모 전체 회원 목록 조회
	public ArrayList<ParDTO> list();

	// ■ 부모 회원 총 인원 수
	public int countMember();

	// ■ 부모 현재 보유 포인트 (백업코드 기준)
	public int searchPoint(String par_backup_id);

	// ■ 특정 시점 기준 포인트 조회 (변경일자 기준)
	public int searchPointAt(String par_backup_id, String date);

	// 회원 수정
	public int modify(ParDTO parent);

	// (아이 백업 코드로) 부모 백업 코드 조회
	public String seachParBackupId(String child_backup_id);
	

	// 부모 정보 삭제 (탈퇴 시)
	public int delete(String par_backup_id);
	

	// [관리자] 부모 전체 목록 조회 
	public List<ParDTO> adminListPar(@Param("start") int start
							 , @Param("end") int end
				             , @Param("searchKey") String searchKey
				             , @Param("searchValue") String searchValue);

	// [관리자] 부모 전체 인원 수 조회
	public int adminCountPar(@Param("searchKey") String searchKey
						, @Param("searchValue") String searchValue);
	
    

}
