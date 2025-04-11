/*================
	IEmgPayDAO.java
===============*/


package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.EmgPayDTO;

public interface IEmgPayDAO
{
	// 긴급 돌봄 결제 내역 추가
	public int addEmgPayRec(EmgPayDTO e);
	
	// 긴급 돌봄 결제 내역 리스트 확인
	public ArrayList<EmgPayDTO> listEmgPayRec();
	
	// 긴급 돌봄 결제 내역 확인
	// → emg_pay_rec_id 를 활용하여 결제 내역 조회
	public EmgPayDTO searchEmgPayRec(String emg_pay_rec_id);
	
	// 긴급 돌봄 결제 내역 수 확인
	public int countEmgPayRec();
	
	// 긴급 돌봄 결제 내역 - 시터 읽은 날짜 기록 → (Ⅹ)

	// 긴급 돌봄 결제 내역 - 부모 읽은 날짜 기록
	// → emg_pay_rec_id 를 활용하여 par_read_date 수정
	public int updateEmgPayRecParRead(String emg_pay_rec_id, String par_read_date);
	
	// 긴급 돌봄 결제 내역 삭제 → (Ⅹ)
	
	
	// 긴급 돌봄 포인트 차감 내역 추가
	public int addEmgPointUsed(EmgPayDTO e);
	
	// 긴급 돌봄 포인트 차감 내역 리스트 확인
	public ArrayList<EmgPayDTO> listEmgPointUsed();
	
	// 긴급 돌봄 포인트 차감 내역 확인
	// → emg_point_used_id 를 활용하여 포인트 차감 내역 조회
	public EmgPayDTO searchEmgPointUsed(String emg_point_used_id);
	
	// 긴급 돌봄 포인트 차감 내역 수 확인
	public int countEmgPointUsed();
	
	// 긴급 돌봄 포인트 차감 내역 수정 → (Ⅹ)
	// 긴급 돌봄 포인트 차감 내역 삭제 → (Ⅹ)
	
	
}
