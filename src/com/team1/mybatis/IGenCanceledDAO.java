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
	// 취소를 위한 취소 범례 테이블 가져오기
	public ArrayList<GenCanceledDTO> CanceledReason();
	
	// 일반 돌봄 예약 취소 리스트 확인
	public ArrayList<GenCanceledDTO> listAllCanceledReq();
	
	// (부모 이름으로) 일반 돌봄 예약 취소 데이터 찾기
	public GenCanceledDTO searchNameCanceledReq(String par_name);
	
	// (예약 신청 번호로) 일반 돌봄 예약 취소 데이터 상세 확인
	public GenCanceledDTO searchCanceledReqDetail(String gen_req_id);
	
	
	/* 1-1.예약 확정 전 취소 내역 */
	// 예약 확정 전 취소 내역 추가
	public int addGenCanceled(GenCanceledDTO g);
	
	// 예약 확정 전 (시터의) 취소 내역 추가 + 환불 진행
	public void addGenCancelAndRefund(GenCanceledDTO g);
		
	// 예약 확정 전 취소 내역 리스트 확인
	//public ArrayList<GenCanceledDTO> listGenCanceled();
	//-- 『adminReqList.jsp』 에 확정 전/후 따른 취소 내역은 없길래
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 전 취소 내역 확인
	// → gen_canceled_id 를 활용하여 취소 내역 조회
	//public GenCanceledDTO searchGenCanceled(String gen_canceled_id);
	//-- 『adminReqList.jsp』 에 확정 전/후 따른 취소 내역은 없길래
	//   → 필요 시 추가해주세요!

	// 예약 확정 전 취소 내역 수 확인
	// public int countGenCanceled();
	//-- 『adminReqList.jsp』 에 내역 수 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
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
	//public ArrayList<GenCanceledDTO> listGenSitConfirmedCanceled();
	//-- 『adminReqList.jsp』 에 확정 전/후 따른 취소 내역은 없길래
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 후 (시터의) 취소 내역 확인
	// → gen_sit_confirmed_canceled_id 를 활용하여 취소 내역 조회
	//public GenCanceledDTO searchGenSitConfirmedCanceled(String gen_sit_confirmed_canceled_id);
	//-- 『adminReqList.jsp』 에 확정 전/후 따른 취소 내역은 없길래
	//   → 필요 시 추가해주세요!
	
	
	// 예약 확정 후 (시터의) 취소 내역 수 확인
	//public int countGenSitConfirmedCanceled();
	//-- 『adminReqList.jsp』 에 내역 수 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
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
	//public ArrayList<GenCanceledDTO> listGenParConfirmedCanceled();
	//-- 『adminReqList.jsp』 에 확정 전/후 따른 취소 내역은 없길래
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 후 (부모의) 취소 내역 확인
	// → gen_par_confirmed_canceled_id 를 활용하여 취소 내역 조회
	//public GenCanceledDTO searchGenParConfirmedCanceled(String gen_par_confirmed_canceled_id);
	//-- 『adminReqList.jsp』 에 확정 전/후 따른 취소 내역은 없길래
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 후 (부모의) 취소 내역 수 확인
	//public int countGenParConfirmedCanceled();
	//-- 『adminReqList.jsp』 에 내역 수 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
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
	//public ArrayList<GenCanceledDTO> listGenRefunded();
	//-- 『adminPayRecList.jsp』 에 환불 내역 리스트 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 전 취소 환불 내역 확인
	// → gen_refunded_id 를 활용하여 환불 내역 조회
	//public GenCanceledDTO searchGenCRefunded(String gen_refunded_id);
	//-- 『adminPayRecDetail.jsp』 에 환불 내역 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 전 취소 환불 내역 수 확인
	//public int countGenCanceledRefunded();
	//-- 『adminPayRecList.jsp』 에 내역 수 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 전 취소 환불 내역 - 시터 읽은 날짜 기록 → (Ⅹ)
	
	// 예약 확정 전 취소 환불 내역 - 부모 읽은 날짜 기록
	// → gen_refunded_id 를 활용하여 par_read_date 수정
	public int updateGenCanceledRefundedParRead(String gen_refunded_id, String par_read_date);
	
	// 예약 확정 전 취소 환불 내역 삭제 → (Ⅹ)
	
	
	/* 2-2. 예약 확정 후 시터의 취소 환불 내역 */
	// 예약 확정 후 (시터의) 취소 환불 내역 추가
	public int addGenSitConfirmedRefunded(GenCanceledDTO g);
	
	// 예약 확정 후 (시터의) 취소 환불 내역 리스트 확인
	//public ArrayList<GenCanceledDTO> listGenSitConfirmedRefunded();
	//-- 『adminPayRecList.jsp』 에 환불 내역 리스트 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 후 (시터의) 취소 환불 내역 확인
	// → gen_sit_confirmed_refunded_id 를 활용하여 취소 환불 내역 조회
	//public GenCanceledDTO searchGenSitConfirmedRefunded(String gen_sit_confirmed_refunded_id);
	//-- 『adminPayRecDetail.jsp』 에 환불 내역 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 후 (시터의) 취소 환불 내역 수 확인
	//public int countGenSitConfirmedRefunded();
	//-- 『adminPayRecList.jsp』 에 내역 수 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 후 (시터의) 취소 환불 내역 - 시터 읽은 날짜 기록 → (Ⅹ)

	// 예약 확정 후 (시터의) 취소 환불 내역 - 부모 읽은 날짜 기록
	// → gen_sit_confirmed_refunded_id 를 활용하여 par_read_date 수정
	public int updateGenSitConfirmedRefundedParRead(String gen_sit_confirmed_refunded_id, String par_read_date);
	
	// 예약 확정 후 (시터의) 취소 환불 내역 삭제 → (Ⅹ)
		
	
	/* 2-3. 예약 확정 후 부모의 취소 환불 내역 */
	// 예약 확정 후 (부모의) 취소 환불 내역 추가
	public int addGenParConfirmedRefunded(GenCanceledDTO g);
	
	// 예약 확정 후 (부모의) 취소 환불 내역 리스트 확인
	//public ArrayList<GenCanceledDTO> listGenParConfirmedRefunded();
	//-- 『adminPayRecList.jsp』 에 환불 내역 리스트 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 후 (부모의) 취소 환불 내역 확인
	// → gen_par_confirmed_refunded_id 를 활용하여 취소 환불 내역 조회
	//public GenCanceledDTO searchGenParConfirmedRefunded(String gen_par_confirmed_refunded_id);
	//-- 『adminPayRecDetail.jsp』 에 환불 내역 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 후 (부모의) 취소 환불 내역 수 확인
	//public int countGenParConfirmedRefunded();
	//-- 『adminPayRecList.jsp』 에 내역 수 확인 항목 없어서 배제
	//   → 필요 시 추가해주세요!
	
	// 예약 확정 후 (부모의) 취소 환불 내역 - 시터 읽은 날짜 기록 → (Ⅹ)

	// 예약 확정 후 (부모의) 취소 환불 내역 - 부모 읽은 날짜 기록
	// → gen_par_confirmed_refunded_id 를 활용하여 par_read_date 수정
	public int updateGenParConfirmedRefundedParRead(String gen_par_confirmed_refunded_id, String par_read_date);
	
	// 예약 확정 후 (부모의) 취소 환불 내역 삭제 → (Ⅹ)
	
}
