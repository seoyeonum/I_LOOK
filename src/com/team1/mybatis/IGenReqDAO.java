/* ====================
 	IGenReqDAO.java
===================== */

package com.team1.mybatis;

import java.util.ArrayList;

public interface IGenReqDAO
{
	// 일반 돌봄 예약 신청(등록)
	public int add(GenReqDTO gen_req);
	
	// 일반 돌봄 예약 삭제
	public int remove(GenReqDTO gen_req);
	
	// 신청이 등록된 리스트
	public ArrayList<GenReqDTO> list();
	
	// 신청이 등록된 전체 수 확인
	public int countGenReq();
}
