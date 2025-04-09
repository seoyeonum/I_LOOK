/*================
	IEmgPointUsedDAO.java
===============*/


package com.team1.mybatis;

import java.util.ArrayList;

public interface IEmgPointDAO
{
	// 긴급 돌봄 포인트 적립 내역 추가
	public int addEmgPoint(EmgPointDTO e);
	
	// 긴급 돌봄 포인트 적립 내역 리스트 확인
	public ArrayList<EmgPointDTO> listEmgPointUsed();
	
	// 긴급 돌봄 포인트 적립 내역 확인
	// → emg_point_id 를 활용하여 포인트 적립 내역 조회
	public EmgPointDTO searchEmgPoint(String emg_point_id);
	
	// 긴급 돌봄 포인트 적립 내역 수 확인
	public int countEmgPoint();
	
	// 긴급 돌봄 포인트 적립 수정 삭제 → (Ⅹ)
	// 긴급 돌봄 포인트 적립 내역 삭제 → (Ⅹ)
	
	
}
