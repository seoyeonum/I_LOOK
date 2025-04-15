/*================
	IGenPayDAO.java
===============*/


package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.GenPayDTO;

public interface IGenPayDAO
{
	// 1. 관리자 입장
	
	// 모든 일반 돌봄 결제 리스트 조회
	public ArrayList<GenPayDTO> listAllGenPayRec();
	
	// (부모 이름으로) 일반 돌봄 결제 내역 리스트 조회
	public ArrayList<GenPayDTO> searchNameGenPayRec();
	
	// 모든 일반 돌봄 포인트 차감 내역 리스트 조회
	public ArrayList<GenPayDTO> listAllGenPointUsed();
	
	// (부모 이름으로) 일반 돌봄 포인트 차감 내역 리스트 조회
	public GenPayDTO searchNameGenPointUsed(String par_name);
	
	
	// 2. 시터 입장 → 별도로 존재 Ⅹ
	
	// 일반 돌봄 결제 내역 - 시터 읽은 날짜 기록 → (Ⅹ)
	
	
	
	// 3. 부모 입장
	
	// 일반 돌봄 결제 내역 추가
	public int addGenPayRec(GenPayDTO e);
	
	// (일반 돌봄 예약 신청 코드로) 특정 일반 돌봄 결제 내역 상세 열람
	public GenPayDTO searchBackupIdGenPayRec(String par_backup_id);
	
	// 일반 돌봄 결제 내역 - 부모 읽은 날짜 기록
	// → gen_pay_rec_id 를 활용하여 par_read_date 수정
	public int updateGenPayRecParRead(String gen_pay_rec_id, String par_read_date);
	
	// 일반 돌봄 포인트 차감 내역 추가
	public int addGenPointUsed(GenPayDTO e);
	
	// (현재 시점에서의) 특정 부모의 잔여 포인트 조회→ ParDAO 로 이동 
	//public int searchTotalPoint(String par_backup_id);
	
	
}
