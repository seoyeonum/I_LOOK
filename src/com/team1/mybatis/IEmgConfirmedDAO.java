package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.EmgConfirmedDTO;

public interface IEmgConfirmedDAO
{

	// 긴급돌봄 확정 리스트 조회
	public ArrayList<EmgConfirmedDTO> listEmgConfirmed();
	
	// 긴급돌봄 확정 데이터 추가
	public int addEmgConfirmed(EmgConfirmedDTO emgConfirmed);
	
	// 긴급돌봄 확정 부모 검색
	public ArrayList<EmgConfirmedDTO> searchEmgConfirmedPar(String par_backup_id);
	
	// 긴급돌봄 확정 시터 검색
	public ArrayList<EmgConfirmedDTO> searchEmgConfirmedSit(String sit_backup_id);
		
	// 긴급돌봄 확정 리스트 갯수
	public int count();
	
		
	// 긴급돌봄 확정 데이터 삭제
	// public int remove(String emg_confirmed_id);
	
	
	// 긴급돌봄 확정 후 시터 메모 리스트 조회
	public ArrayList<EmgConfirmedDTO> listEmgMemosSit();
	
	// 긴급돌봄 확정 후 시터 메모 데이터 추가
	public int addEmgMemoSit(EmgConfirmedDTO emgConfirmed);
		
	// 긴급돌봄 확정 후 시터 메모 리스트 검색
	public ArrayList<EmgConfirmedDTO> searchEmgMemosSit(String emg_confirmed_id);
	
	
	// 긴급돌봄 확정 후 부모 메모 리스트 조회
	public ArrayList<EmgConfirmedDTO> listMemosPar();
	
	// 긴급돌봄 확정 후 부모 메모 데이터 추가
	public int addEmgMemoPar(EmgConfirmedDTO emgConfirmed);
	
	// 긴급돌봄 확정 후 부모 메모 리스트 검색
	public ArrayList<EmgConfirmedDTO> searchEmgMemosPar(String emg_confirmed_id);
			
	// 긴급돌봄 임급 지급 내역 리스트 조회
	public ArrayList<EmgConfirmedDTO> listEmgWage();
	
	// 긴급돌봄 임금 지급 내역 데이터 추가
	public int addEmgWage(EmgConfirmedDTO emgConfirmed);
	
	// 긴급돌봄 임급 지급 내역 리스트 검색
	public ArrayList<EmgConfirmedDTO> searchEmgWage(String emg_confirmed_id);
		
	// 긴급돌봄 확정 부모가 읽은 날짜 업데이트
	public int updateReadDate(String emg_confirmed_id);
	
	
	
}
