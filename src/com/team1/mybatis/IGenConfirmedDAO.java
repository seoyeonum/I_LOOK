/* =========================
 	IGenConfirmedDAO.java
========================== */

package com.team1.mybatis;

import java.util.ArrayList;

public interface IGenConfirmedDAO
{
	// 예약 확정 등록
	public int add(GenConfirmedDTO gen_confirmed);
	
	// 부모가 알림을 읽었을 때 시간 기록
	public int updateParentReadTime(String gen_req_id, String par_read_date);
	
	// 특정 예약 신청 코드로 조회
	public GenConfirmedDTO findByRequestId(String gen_req_id);
	
	// 예약 확정 등록에 대한 리스트
	public ArrayList<GenConfirmedDTO> list();
	
	// 예약 확정 등록건에 대한 수
	public int countGenConfirmed();
	
	// 일반 돌봄 시터 기록(메모) 저장
	public int addSitMemo(GenConfirmedDTO sit_memo);
	
	// 일반 돌봄 시터 기록(메모) 리스트
	public ArrayList<GenConfirmedDTO> sitMemolist();
	
	// 일반 돌봄 부모 기록(메모) 저장
	public int addParMemo(GenConfirmedDTO par_memo);
	
	// 일반 돌봄 부모 기록(메모) 리스트
	public ArrayList<GenConfirmedDTO> parMemolist();
	
}
