package com.team1.mybatis;

import java.util.ArrayList;

public interface IEmgConfirmedDAO
{

	// 긴급돌봄 확정 리스트 조회
	public ArrayList<EmgConfirmedDTO emgConfirmed> listEmgConfirmed();
	
	// 긴급돌봄 확정 데이터 추가
	public int addEmgConfirmed(EmgConfirmedDTO emgConfirmed);
	
	// 긴급돌봄 확정 데이터 삭제
	public int remove(String emg_confirmed_id);
	
	
	// 긴급돌봄 확정 후 시터 메모 리스트 조회
	public ArrayList<EmgConfirmedDTO emgConfirmed> listMemosSit();
	
	// 긴급돌봄 확정 후 시터 메모 데이터 추가
	public int addEmgMemoSit(EmgConfirmedDTO emgConfirmed);
	
	// 긴급돌봄 확정 후 부모 메모 리스트 조회
	public ArrayList<EmgConfirmedDTO emgConfirmed> listMemosPar();
	
	// 긴급돌봄 확정 후 부모 메모 데이터 추가
	public int addEmgMemoPar(EmgConfirmedDTO emgConfirmed);
	
	// 긴급돌봄 임급 지급 내역 리스트 조회
	public ArrayList<EmgConfirmedDTO emgConfirmed> listEmgWage();
	
	// 긴급돌봄 임금 지급 내역 데이터 추가
	public int addEmgWage(EmgConfirmedDTO emgConfirmed);
	
	// 긴급돌봄 확정 리스트 갯수
	public int count();
	
	// 찾기
	public EmgConfirmedDTO search(String emg_confirmed_id);
	
}
