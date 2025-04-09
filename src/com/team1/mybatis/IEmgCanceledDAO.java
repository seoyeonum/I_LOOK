package com.team1.mybatis;

import java.util.ArrayList;

public interface IEmgCanceledDAO
{
	// 긴급돌봄 취소 리스트 조회
	public ArrayList<EmgCanceledDTO EmgCanceled> listEmgCanceled();
	
	// 긴급돌봄 환불 내역 리스트 조회
	public ArrayList<EmgCanceledDTO EmgRefunded> listEmgRefunded();
	
	// 긴급돌봄 취소 데이터 취소 사유 리스트 조회
	public ArrayList<String> listCanceledType();
		
	// 긴급돌봄 취소 데이터 추가
	public int addEmgCanceled(EmgCanceledDTO EmgCanceled);
	
	// 긴급돌봄 환불 내역 데이터 추가
	public int removeEmgRefunded(EmgCanceledDTO EmgRefunded);
		
	// 긴급돌봄 취소 데이터 삭제
	public int removeEmgCanceled(String emgCanceled_id);
	
	// 긴급돌봄 취소 리스트 갯수
	public int countCanceled();
	
	// 긴급돌봄 환불 리스트 갯수
	public int countRefunded();
	
	// 긴급돌봄 취소 내역 찾기
	public EmgCanceledDTO search(String emg_canceled_id);
	
	// 긴급돌봄 환불 내역 찾기
	public EmgCanceledDTO search(String emg_refunded_id);
	
}
