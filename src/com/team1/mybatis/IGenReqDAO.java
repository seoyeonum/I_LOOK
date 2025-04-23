/* ====================
 	IGenReqDAO.java
===================== */

package com.team1.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.team1.dto.ChildDTO;
import com.team1.dto.GenReqDTO;

public interface IGenReqDAO
{
	// 일반 돌봄 예약 신청(등록)
	public int add(GenReqDTO gen_req);
	
	// 일반 돌봄 예약 삭제
	public int remove(GenReqDTO gen_req);
	
	// 신청이 등록된 리스트
	public ArrayList<GenReqDTO> list();
	
	// 관리자가 보는 신청이 등록된 일반돌봄 예약 전체 리스트
	public List<GenReqDTO> adminListSitGenReg(Map<String, Object> params);

	// 신청이 등록된 전체 수 확인
	public int adminCountGenReq(Map<String, Object> params);
	
	// 특정 아이디의 예약 등록건 찾기
	public int search(GenReqDTO gen_req);
	
	// 부모 기준 예약 내역 조회 (최근 이용 내역 및 이용 상태 표시용)
	public ArrayList<GenReqDTO> findByParent(String par_backup_id);
	
	public ArrayList<ChildDTO> listByParent(String parBackupId);
}
