/*================
	IEmgPayDAO.java
===============*/


package com.team1.mybatis;

import java.util.ArrayList;

public interface IEmgPayDAO
{
	// 긴급 돌봄 결제 내역 추가
	public int addEmgPay(EmgPayDTO e);
	
	// 긴급 돌봄 결제 내역 리스트 확인
	public ArrayList<EmgPayDTO> listEmgPay();
	
	// 긴급 돌봄 결제 내역 확인
	// → emg_pay_rec_id 를 활용하여 결제 내역 조회
	public EmgPayDTO searchEmgPay(String emg_pay_rec_id);
	
	// 긴급 돌봄 결제 내역 수 확인
	public int countEmgPay();
	
	// 긴급 돌봄 결제 수정 삭제 → (Ⅹ)
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
	
	// 긴급 돌봄 포인트 차감 수정 삭제 → (Ⅹ)
	// 긴급 돌봄 포인트 차감 내역 삭제 → (Ⅹ)
	
	
}
