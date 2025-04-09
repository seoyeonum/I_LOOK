package com.team1.mybatis;

import java.util.ArrayList;


public interface IGradesDAO
{
	// 등급 리스트 조회
	public ArrayList<GradesDTO> listGrade();
	
	// 등급 데이터 추가
	public int add(GradesDTO grades);
	
	// 등급 수정
	public int modifyGrade(GradesDTO grades);
	
	// 등급 삭제
	public int remove(String grade_id);
	
	// 일반돌봄 시급 조회
	public GradesDTO listGenWage(GradesDTO grades);
	
	// 일반돌봄 시급 수정
	public int modifyGenWage(GradesDTO grades);
	
	// 긴급돌봄 시급 조회
	public GradesDTO listEmgWage(GradesDTO grades);
	
	// 긴급돌봄 시급 수정
	public int modifyEmgWage(GradesDTO grades);
}
