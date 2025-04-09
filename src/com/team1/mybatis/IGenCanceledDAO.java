/*================
	IGenCanceledDAO.java
===============*/


package com.team1.mybatis;

import java.util.ArrayList;

public interface IGenCanceledDAO
{
	// 취소 내역
	// 1.예약 확정 전 취소

	// 예약 확정 전 취소 내역 추가
	public int addGenCanceled(GenCanceledDTO e);
	
	// 예약 확정 전 취소 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenCanceled();
	
	// 예약 확정 전 취소 내역 확인
	// → gen_canceled_id 를 활용하여 결제 내역 조회
	public GenCanceledDTO searchGenCanceled(String gen_canceled_id);
	
	// 예약 확정 전 취소 내역 수 확인
	public int countGenCanceled();
	
	// 예약 확정 전 취소 내역 수정 → (Ⅹ)
	// 예약 확정 전 취소 내역 삭제 → (Ⅹ)
	
	
	// 2.예약 확정 후 취소(시터)
	
	// 예약 확정 후 취소(시터) 내역 추가
	public int addGenSitConfirmedCanceled(GenCanceledDTO e);
	
	// 예약 확정 후 취소(시터) 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenSitConfirmedCanceled();
	
	// 예약 확정 후 취소(시터) 내역 확인
	// → gen_canceled_id 를 활용하여 결제 내역 조회
	public GenCanceledDTO searchGenSitConfirmedCanceled(String gen_canceled_id);
	
	// 예약 확정 후 취소(시터) 내역 수 확인
	public int countGenSitConfirmedCanceled();
	
	// 예약 확정 후 취소(시터) 내역 수정 → (Ⅹ)
	// 예약 확정 후 취소(시터) 내역 삭제 → (Ⅹ)
	
	
	// 3.예약 확정 후 취소(부모)
	
	// 예약 확정 후 취소(부모) 내역 추가
	public int addGenParConfirmedCanceled(GenCanceledDTO e);
	
	// 예약 확정 후 취소(부모) 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenParConfirmedCanceled();
	
	// 예약 확정 후 취소(부모) 내역 확인
	// → gen_canceled_id 를 활용하여 결제 내역 조회
	public GenCanceledDTO searchGenParConfirmedCanceled(String gen_canceled_id);
	
	// 예약 확정 후 취소(부모) 내역 수 확인
	public int countGenParConfirmedCanceled();
	
	// 예약 확정 후 취소(부모) 내역 수정 → (Ⅹ)
	// 예약 확정 후 취소(부모) 내역 삭제 → (Ⅹ)
	
	//----------------------------------------------------------------------
	
	// 환불 내역
	// 1.예약 확정 전 취소 대한 환불

	// 예약 확정 전 취소 대한 환불 내역 추가
	public int addGenCanceled(GenCanceledDTO e);
	
	// 예약 확정 전 취소 대한 환불 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenCanceled();
	
	// 예약 확정 전 취소 대한 환불 내역 확인
	// → gen_canceled_id 를 활용하여 결제 내역 조회
	public GenCanceledDTO searchGenCanceled(String gen_canceled_id);
	
	// 예약 확정 전 취소 대한 환불 내역 수 확인
	public int countGenCanceled();
	
	// 예약 확정 전 취소 대한 환불 내역 수정 → (Ⅹ)
	// 예약 확정 전 취소 대한 환불 내역 삭제 → (Ⅹ)
	
	
	// 2.예약 확정 후 취소(시터) 대한 환불
	
	// 예약 확정 후 취소(시터) 대한 환불 내역 추가
	public int addGenSitConfirmedCanceled(GenCanceledDTO e);
	
	// 예약 확정 후 취소(시터) 대한 환불 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenSitConfirmedCanceled();
	
	// 예약 확정 후 취소(시터) 대한 환불 내역 확인
	// → gen_canceled_id 를 활용하여 결제 내역 조회
	public GenCanceledDTO searchGenSitConfirmedCanceled(String gen_canceled_id);
	
	// 예약 확정 후 취소(시터) 대한 환불 내역 수 확인
	public int countGenSitConfirmedCanceled();
	
	// 예약 확정 후 취소(시터) 대한 환불 내역 수정 → (Ⅹ)
	// 예약 확정 후 취소(시터) 대한 환불 내역 삭제 → (Ⅹ)
	
	
	// 3.예약 확정 후 취소(부모)
	
	// 예약 확정 후 취소(부모) 대한 환불 내역 추가
	public int addGenParConfirmedCanceled(GenCanceledDTO e);
	
	// 예약 확정 후 취소(부모) 대한 환불 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenParConfirmedCanceled();
	
	// 예약 확정 후 취소(부모) 대한 환불 내역 확인
	// → gen_canceled_id 를 활용하여 결제 내역 조회
	public GenCanceledDTO searchGenParConfirmedCanceled(String gen_canceled_id);
	
	// 예약 확정 후 취소(부모) 대한 환불 내역 수 확인
	public int countGenParConfirmedCanceled();
	
	// 예약 확정 후 취소(부모) 대한 환불 내역 수정 → (Ⅹ)
	// 예약 확정 후 취소(부모) 대한 환불 내역 삭제 → (Ⅹ)

}
