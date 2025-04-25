/*================
	IEmgPayDAO.java
===============*/


package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.EmgPayDTO;

public interface IEmgPayDAO
{
	// 1. 관리자 입장
	
	// 모든 긴급 돌봄 결제 리스트 조회
	//-- 예약신청번호, 유형, 상태, 부모이름, 결제금액, 포인트내역, 예약일
	public ArrayList<EmgPayDTO> listAllEmgPayRec();
	
	// 모든 긴급 돌봄 결제 내역 수 조회
	// public int countAllEmgPayRec();
	//--『adminPayRecList.jsp』 기준 요청 사항 없어서 배제
	//→ 필요 시 추가 작성!
	
	// (부모 이름으로) 긴급 돌봄 결제 내역 리스트 조회
	public ArrayList<EmgPayDTO> searchNameEmgPayRec();
	
	// (부모 이름으로) 긴급 돌봄 결제 내역 수 조회
	// public int countNameEmgPayRec();
	//--『adminPayRecList.jsp』 기준 요청 사항 없어서 배제
	//→ 필요 시 추가 작성!
	
	// 모든 긴급 돌봄 포인트 차감 내역 리스트 조회
	//-- 예약신청번호, 유형(사용/적립), 부모이름, 변동(차감) 포인트, 잔여 포인트, 변동(차감)일 (, 비고)
	public ArrayList<EmgPayDTO> listAllEmgPointUsed();
	
	// 모든 긴급 돌봄 포인트 차감 내역 수 조회
	// public int countAllEmgPointUsed();
	//--『adminPointList.jsp』 기준 요청 사항 없어서 배제
	//→ 필요 시 추가 작성!
	
	// (부모 이름으로) 긴급 돌봄 포인트 차감 내역 리스트 조회
	public EmgPayDTO searchNameEmgPointUsed(String par_name);
	
	// (부모 이름으로) 긴급 돌봄 포인트 차감 내역 수 확인
	//public int countNameEmgPointUsed();
	//--『adminPointList.jsp』 기준 요청 사항 없어서 배제
	//→ 필요 시 추가 작성!
	
	
	// 2. 시터 입장 → 별도로 존재 Ⅹ
	
	// 긴급 돌봄 결제 내역 - 시터 읽은 날짜 기록 → (Ⅹ)
		
	
	// 3. 부모 입장
	
	// 긴급 돌봄 결제 내역 추가
	public int addEmgPayRec(EmgPayDTO e);
	
	// 긴급 돌봄 결제 내역 수정 → (Ⅹ)
	// 긴급 돌봄 결제 내역 삭제 → (Ⅹ)
	
	// (긴급 돌봄 예약 신청 코드로) 특정 긴급 돌봄 결제 내역 상세 열람
	//-- 결제 금액, 전체 보유 포인트, 차감 포인트, 총 결제 금액, 결제 방법(신용카드)
	public EmgPayDTO searchBackupIdEmgPayRec(String par_backup_id);
	
	// (부모 백업코드로) 긴급 돌봄 결제 내역 수 조회
	//public int countBackupIdEmgPayRec(String par_backup_id);
	//--『ChildUsed.jsp』 기준 요청 사항 없어서 배제
	//→ 필요 시 추가 작성!
	
	// 긴급 돌봄 결제 내역 - 부모 읽은 날짜 기록
	// → emg_pay_rec_id 를 활용하여 par_read_date 수정
	public int updateEmgPayRecParRead(String emg_pay_rec_id, String par_read_date);
	
	
	// 긴급 돌봄 포인트 차감 내역 추가
	public int addEmgPointUsed(EmgPayDTO e);
	
	// 긴급 돌봄 포인트 차감 내역 수정 → (Ⅹ)
	// 긴급 돌봄 포인트 차감 내역 삭제 → (Ⅹ)
	
	
	// (부모 백업코드로) 긴급 돌봄 포인트 차감 내역 리스트 확인
	// public ArrayList<EmgPayDTO> listEmgPointUsed(String emg_backup_id);
	//--『ChildUsed.jsp』 기준 요청 사항 없어서 배제
	//→ 필요 시 추가 작성!
	
	// (부모 백업코드로) 긴급 돌봄 포인트 차감 내역 확인
	// → emg_backup_id 를 활용하여 포인트 차감 내역 조회
	//public EmgPayDTO searchEmgPointUsed(String emg_backup_id);
	//--『ChildUsed.jsp』 기준 요청 사항 없어서 배제
	//→ 필요 시 추가 작성!
	
	// 긴급 돌봄 포인트 차감 내역 수 확인
	//public int countEmgPointUsed();
	//--『ChildUsed.jsp』 기준 요청 사항 없어서 배제
	//→ 필요 시 추가 작성!
	
	// (현재 시점에서의) 특정 부모의 잔여 포인트 조회
	//-- → 일반 돌봄『GenPayDAO.xml』에 명시

	
}
