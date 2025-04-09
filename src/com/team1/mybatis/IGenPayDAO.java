/*================
	IGenPayDAO.java
===============*/


package com.team1.mybatis;

import java.util.ArrayList;

public interface IGenPayDAO
{
	// 일반 돌봄 결제 내역 추가
	public int addGenPay(GenPayDTO e);
	
	// 일반 돌봄 결제 내역 리스트 확인
	public ArrayList<GenPayDTO> listGenPay();
	
	// 일반 돌봄 결제 내역 확인
	// → gen_pay_rec_id 를 활용하여 결제 내역 조회
	public GenPayDTO searchGenPay(String gen_pay_rec_id);
	
	// 일반 돌봄 결제 내역 수 확인
	public int countGenPay();
	
	// 일반 돌봄 결제 수정 삭제 → (Ⅹ)
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
	
	// 일반 돌봄 포인트 차감 수정 삭제 → (Ⅹ)
	// 일반 돌봄 포인트 차감 내역 삭제 → (Ⅹ)
	
	
}
