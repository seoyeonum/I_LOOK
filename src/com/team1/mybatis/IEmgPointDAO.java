/*================
	IEmgPointUsedDAO.java
===============*/


package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.EmgPointDTO;

public interface IEmgPointDAO
{
	// 1. 관리자 입장
	
	// 모든 긴급 돌봄 포인트 적립 내역 리스트 조회
	public ArrayList<EmgPointDTO> listAllEmgPointSaved();
	
	// (부모 이름으로) 긴급 돌봄 포인트 적립 내역 리스트 조회
	public ArrayList<EmgPointDTO> searchNameEmgPointSaved();
	
	
	// 2. 시터 입장 → 별도로 존재 Ⅹ
	
	
	// 3. 부모 입장
	
	// 긴급 돌봄 포인트 적립 내역 추가
	public int addEmgPoint(EmgPointDTO e);
	
	
	// 긴급 돌봄 포인트 적립 내역 확인
	// → emg_confirmed_id 를 활용하여 포인트 적립 내역 조회
	public EmgPointDTO searchEmgPoint(String emg_confirmed_id);
	
	
	
	// 긴급 돌봄 포인트 적립 내역 수 확인
	// public int countEmgPoint();
	//--『adminPointList.jsp』에서 별도 명시하고 있지 않으므로 배제
	// → 필요 시 추가!
	
	// 긴급 돌봄 포인트 적립 내역 수정 → (Ⅹ)
	// 긴급 돌봄 포인트 적립 내역 삭제 → (Ⅹ)
	
	
}
