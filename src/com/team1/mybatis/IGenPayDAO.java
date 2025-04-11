/*================
	IGenPayDAO.java
===============*/


package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.GenPayDTO;

public interface IGenPayDAO
{
	// 일반 돌봄 결제 내역 추가
	public int addGenPayRec(GenPayDTO e);
	
	// 일반 돌봄 결제 내역 리스트 확인
	public ArrayList<GenPayDTO> listGenPayRec();
	
	// 일반 돌봄 결제 내역 확인
	// → gen_pay_rec_id 를 활용하여 결제 내역 조회
	public GenPayDTO searchGenPayRec(String gen_pay_rec_id);
	
	// 일반 돌봄 결제 내역 수 확인
	public int countGenPayRec();
	
	// 일반 돌봄 결제 내역 - 시터 읽은 날짜 기록 → (Ⅹ)
	
	// 일반 돌봄 결제 내역 - 부모 읽은 날짜 기록
	// → gen_pay_rec_id 를 활용하여 par_read_date 수정
	public int updateGenPayRecParRead(String gen_pay_rec_id, String par_read_date);
	
	// 일반 돌봄 결제 내역 삭제 → (Ⅹ)
	
	
	// 일반 돌봄 포인트 차감 내역 추가
	public int addGenPointUsed(GenPayDTO e);
	
	// 일반 돌봄 포인트 차감 내역 리스트 확인
	public ArrayList<GenPayDTO> listGenPointUsed();
	
	// 일반 돌봄 포인트 차감 내역 확인
	// → gen_point_used_id 를 활용하여 포인트 차감 내역 조회
	public GenPayDTO searchGenPointUsed(String gen_point_used_id);
	
	// 일반 돌봄 포인트 차감 내역 수 확인
	public int countGenPointUsed();
	
	// 일반 돌봄 포인트 차감 내역 수정 → (Ⅹ)
	// 일반 돌봄 포인트 차감 내역 삭제 → (Ⅹ)
	
	
}
