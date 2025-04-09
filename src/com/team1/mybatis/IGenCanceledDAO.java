/* =========================
 	IGenCanceledDAO.java
========================== */

package com.team1.mybatis;

public interface IGenCanceledDAO
{
	/*
	 테이블이 분리되어 있고, DTO는 통합되어 있다면
     DAO는 역할별로 나누되, DTO는 공유해서 사용하는 구조가 가장 적절 하다함.
	 */
	
	// 부모가 예약 확정 후 취소 건 등록
	int addParCanceled(GenCanceledDTO gen_canceled);
	GenCanceledDTO findByReqId(String gen_req_id);
	
	// 부모가 예약 확정 후 취소 환불에 대해 등록
	
	// 시터가 예약 확정 후 취소 건 등록
	int addSitCanceled(GenCanceledDTO gen_canceled);
	
	
	
}
