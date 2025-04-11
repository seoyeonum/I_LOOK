/* =========================
 	IGenCanceledDAO.java
========================== */

/*
	1-1.예약 확정 전 취소 내역
	1-2. 예약 확정 후 시터의 취소 내역
	1-3. 예약 확정 후 부모의 취소 내역
	
	2-1. 예약 확정 전 취소 환불 내역
	2-2. 예약 확정 후 시터의 취소 환불 내역
	2-3. 예약 확정 후 부모의 취소 환불 내역
*/


package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.GenCanceledDTO;

public interface IGenCanceledDAO
{
	/* 1-1.예약 확정 전 취소 내역 */
	// 예약 확정 전 취소 내역 추가
	public int addGenCanceled(GenCanceledDTO g);
	
	// 예약 확정 전 취소 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenCanceled();
	
	// 예약 확정 전 취소 내역 확인
	// → gen_canceled_id 를 활용하여 취소 내역 조회
	public GenCanceledDTO searchGenCanceled(String gen_canceled_id);

	// 예약 확정 전 취소 내역 수 확인
	public int countGenCanceled();
	
	// 예약 확정 전 취소 내역 - 시터 읽은 날짜 기록
	// → gen_canceled_id 를 활용하여 sit_read_date 수정
	public int updateGenCanceledSitRead(String gen_canceled_id, String sit_read_date);
	
	// 예약 확정 전 취소 내역 - 부모 읽은 날짜 기록
	// → gen_canceled_id 를 활용하여 par_read_date 수정
	public int updateGenCanceledParRead(String gen_canceled_id, String par_read_date);
	
	// 예약 확정 전 취소 내역 삭제 → (Ⅹ)
	
	
	/* 1-2. 예약 확정 후 시터의 취소 내역 */
	// 예약 확정 후 (시터의) 취소 내역 추가
	public int addGenSitConfirmedCanceled(GenCanceledDTO g);
	
	// 예약 확정 후 (시터의) 취소 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenSitConfirmedCanceled();
	
	// 예약 확정 후 (시터의) 취소 내역 확인
	// → gen_sit_confirmed_canceled_id 를 활용하여 취소 내역 조회
	public GenCanceledDTO searchGenSitConfirmedCanceled(String gen_sit_confirmed_canceled_id);
	
	// 예약 확정 후 (시터의) 취소 내역 수 확인
	public int countGenSitConfirmedCanceled();
	
	// 예약 확정 후 (시터의) 취소 내역 - 시터 읽은 날짜 기록
	// → gen_sit_confirmed_canceled_id 를 활용하여 sit_read_date 수정
	public int updateGenSitConfirmedCanceledSitRead(String gen_sit_confirmed_canceled_id, String sit_read_date);
	
	// 예약 확정 후 (시터의) 취소 내역 - 부모 읽은 날짜 기록
	// → gen_par_confirmed_canceled_id 를 활용하여 par_read_date 수정
	public int updateGenSitConfirmedCanceledParRead(String gen_par_confirmed_canceled_id, String par_read_date);
	
	// 예약 확정 후 (시터의) 취소 내역 삭제 → (Ⅹ)

	
	/* 1-3. 예약 확정 후 부모의 취소 내역 */
	// 예약 확정 후 (부모의) 취소 내역 추가
	public int addGenParConfirmedCanceled(GenCanceledDTO g);
	
	// 예약 확정 후 (부모의) 취소 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenParConfirmedCanceled();
	
	// 예약 확정 후 (부모의) 취소 내역 확인
	// → gen_par_confirmed_canceled_id 를 활용하여 취소 내역 조회
	public GenCanceledDTO searchGenParConfirmedCanceled(String gen_par_confirmed_canceled_id);
	
	// 예약 확정 후 (부모의) 취소 내역 수 확인
	public int countGenParConfirmedCanceled();
	
	// 예약 확정 후 (부모의) 취소 내역 - 시터 읽은 날짜 기록
	// → gen_par_confirmed_canceled_id 를 활용하여 sit_read_date 수정
	public int updateGenParConfirmedCanceledSitRead(String gen_par_confirmed_canceled_id, String sit_read_date);
	
	// 예약 확정 후 (부모의) 취소 내역 - 부모 읽은 날짜 기록
	// → gen_par_confirmed_canceled_id 를 활용하여 par_read_date 수정
	public int updateGenParConfirmedCanceledParRead(String gen_par_confirmed_canceled_id, String par_read_date);
	
	// 예약 확정 후 (부모의) 취소 내역 삭제 → (Ⅹ)
	
	
	/* 2-1. 예약 확정 전 취소 환불 내역 */
	// 예약 확정 전 취소 환불 내역 추가
	public int addGenRefunded(GenCanceledDTO g);
	
	// 예약 확정 전 취소 환불 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenRefunded();
	
	// 예약 확정 전 취소 환불 내역 확인
	// → gen_refunded_id 를 활용하여 환불 내역 조회
	public GenCanceledDTO searchGenCRefunded(String gen_refunded_id);
	
	// 예약 확정 전 취소 환불 내역 수 확인
	public int countGenCanceledRefunded();
	
	// 예약 확정 전 취소 환불 내역 - 시터 읽은 날짜 기록 → (Ⅹ)
	
	// 예약 확정 전 취소 환불 내역 - 부모 읽은 날짜 기록
	// → gen_refunded_id 를 활용하여 par_read_date 수정
	public int updateGenCanceledRefundedParRead(String gen_refunded_id, String par_read_date);
	
	// 예약 확정 전 취소 환불 내역 삭제 → (Ⅹ)
	
	
	/* 2-2. 예약 확정 후 시터의 취소 환불 내역 */
	// 예약 확정 후 (시터의) 취소 환불 내역 추가
	public int addGenSitConfirmedRefunded(GenCanceledDTO g);
	
	// 예약 확정 후 (시터의) 취소 환불 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenSitConfirmedRefunded();
	
	// 예약 확정 후 (시터의) 취소 환불 내역 확인
	// → gen_sit_confirmed_refunded_id 를 활용하여 취소 환불 내역 조회
	public GenCanceledDTO searchGenSitConfirmedRefunded(String gen_sit_confirmed_refunded_id);
	
	// 예약 확정 후 (시터의) 취소 환불 내역 수 확인
	public int countGenSitConfirmedRefunded();
	
	// 예약 확정 후 (시터의) 취소 환불 내역 - 시터 읽은 날짜 기록 → (Ⅹ)

	// 예약 확정 후 (시터의) 취소 환불 내역 - 부모 읽은 날짜 기록
	// → gen_sit_confirmed_refunded_id 를 활용하여 par_read_date 수정
	public int updateGenSitConfirmedRefundedParRead(String gen_sit_confirmed_refunded_id, String par_read_date);
	
	// 예약 확정 후 (시터의) 취소 환불 내역 삭제 → (Ⅹ)
		
	
	/* 2-3. 예약 확정 후 부모의 취소 환불 내역 */
	// 예약 확정 후 (부모의) 취소 환불 내역 추가
	public int addGenParConfirmedRefunded(GenCanceledDTO g);
	
	// 예약 확정 후 (부모의) 취소 환불 내역 리스트 확인
	public ArrayList<GenCanceledDTO> listGenParConfirmedRefunded();
	
	// 예약 확정 후 (부모의) 취소 환불 내역 확인
	// → gen_par_confirmed_refunded_id 를 활용하여 취소 환불 내역 조회
	public GenCanceledDTO searchGenParConfirmedRefunded(String gen_par_confirmed_refunded_id);
	
	// 예약 확정 후 (부모의) 취소 환불 내역 수 확인
	public int countGenParConfirmedRefunded();
	
	// 예약 확정 후 (부모의) 취소 환불 내역 - 시터 읽은 날짜 기록 → (Ⅹ)

	// 예약 확정 후 (부모의) 취소 환불 내역 - 부모 읽은 날짜 기록
	// → gen_par_confirmed_refunded_id 를 활용하여 par_read_date 수정
	public int updateGenParConfirmedRefundedParRead(String gen_par_confirmed_refunded_id, String par_read_date);
	
	// 예약 확정 후 (부모의) 취소 환불 내역 삭제 → (Ⅹ)
	
}
