package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.EmgReqDTO;

public interface IEmgReqDAO
{
	// 1. 관리자 입장
	// 모든 긴급 돌봄 요청 리스트 조회
	public ArrayList<EmgReqDTO> listAllReq();
	
	// 모든 긴급 돌봄 요청 수
	public int countAllReq();
	
	// (부모 이름으로) 긴급 돌봄 요청 데이터 찾기
	public EmgReqDTO searchNameReq(String par_name);
	
	// (부모 이름으로) 긴급 돌봄 요청 찾은 건수
	// public int countNameReq(String par_name);
	//--『adminGenRegList.jsp』 기준 요청 건수 없어서 + 필요 없다고 하여 배제
	//→ 필요 시 추가 작성!

	
	// 2. 시터 입장
	
	// (지원 가능한) 긴급 돌봄 요청 리스트 조회
	public ArrayList<EmgReqDTO> listAllPossibleReq();
	
	// (지원 가능한) 긴급 돌봄 요청 수
	public int countAllPossibleReq();
	
	// (지역 선택해) 긴급 돌봄 요청 데이터 찾기
	//public EmgReqDTO search(String emg_req_id);
	public ArrayList<EmgReqDTO> searchPossibleReq(String region_id);
	
	// (지역 선택해) 긴급 돌봄 요청 수
	public int countPossibleReq();
	
	// 3. 부모 입장
	
	// 긴급 돌봄 요청 데이터 추가
	public int addReq(EmgReqDTO emgReq);
	
	// 긴급 돌봄 요청 데이터 삭제
	public int removeReq(String emg_req_id);
	
	// (부모 백업코드로) 긴급 돌봄 요청 데이터 찾기
	public EmgReqDTO searchBackupIdReq(String par_backup_id);
		
	// (부모 백업코드로) 긴급 돌봄 요청 찾은 건수
	public int countBackupIdReq(String par_backup_id);
}
