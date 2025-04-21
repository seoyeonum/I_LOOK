package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.GradesDTO;


public interface IGradesDAO
{
	// 등급 리스트 조회
	public ArrayList<GradesDTO> listGrade();
	
	// 등급 데이터 추가
	public int addGrade(GradesDTO grade);
	
	// 등급 수정
	public int modifyGrade(GradesDTO grade);
	
	// 등급 리스트 조회
	public GradesDTO searchGrade(String grade_id);
	
	// 등급 삭제
	public int removeGrade(String grade_id);
	
	// 일반돌봄 시급 조회
	public GradesDTO listGenWage();
	
	// (마지막으로 등록한) 일반 돌봄 시급 조회
	public int searchGenWageLately();
	
	// 일반돌봄 시급 수정
	public int modifyGenWage(GradesDTO grade);
	
	// 긴급돌봄 시급 조회
	public GradesDTO listEmgWage();
	
	// (마지막으로 등록한) 긴급 돌봄 시급 조회
	public int searchEmgWageLately();
	
	// 긴급돌봄 시급 수정
	public int modifyEmgWage(GradesDTO grade);
	
	
}
