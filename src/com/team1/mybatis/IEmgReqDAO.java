package com.team1.mybatis;

import java.util.ArrayList;

public interface IEmgReqDAO
{
	
	// 긴급돌봄 요청 리스트 조회
	public ArrayList<EmgReqDTO> list();
	
	// 긴급돌봄 요청 데이터 추가
	public int add(EmgReqDTO emgReq);
	
	// 긴급돌봄 요청 데이터 삭제
	public int remove(String emg_req_id);
	
	// 긴급돌봄 요청 수
	public int count();
	
	// 찾기
	public EmgReqDTO search(String emg_req_id);
	
}
