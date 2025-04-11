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
	public EmgReqDTO searchnNameReq(String par_name);
	
	// (부모 이름으로) 긴급 돌봄 요청 찾은 건수
	public int countNameReq(String par_name);
	
	// (부모 아이디로) 긴급 돌봄 요청 데이터 찾기
	public EmgReqDTO searchIdReq(String par_id);
	
	// (부모 아이디로) 긴급 돌봄 요청 찾은 건수
	public int countIdReq(String par_id);
	
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
}
