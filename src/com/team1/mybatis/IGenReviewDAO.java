/* =========================
 	IGenReviewDAO.java
========================== */

package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.GenReviewDTO;

public interface IGenReviewDAO
{
	// 일반 돌봄 리뷰 등록
	public int addGenReviews(GenReviewDTO gen_review);
	
	// 일반 돌봄 리뷰 삭제
	public int removeGenReviews(GenReviewDTO gen_review);
	
	// 객관식 응답 등록
	public int insertMultiReviews(GenReviewDTO gen_review);
	
	// 객관식 응답 삭제
	public int removeMultiReviews(GenReviewDTO gen_review);
	
	// 객관식 응답 수정
	public int updateMultiReviews(GenReviewDTO gen_review);
	
	// 객관식 응답 종류 등록
	public int insertMultiTypes(GenReviewDTO gen_review);
	
	// 객관식 응답 종류 삭제
	public int removeMultiTypes(GenReviewDTO gen_review);
	
	// 객관식 응답 종류 수정
	public int updateMultiTypes(GenReviewDTO gen_review);
	
	// 일반 돌봄 리뷰 리스트
	public ArrayList<GenReviewDTO> list();
	
	// 일반 돌봄 리뷰 전체 수
	public int countReviews();
	
	// 아이디로 특정 리뷰 확인
	public GenReviewDTO findByRequestId(String gen_review_id);
	
	// [일반] 시터 백업 아이디로 객관식 응답 확인
	public ArrayList<String> listReviewByBackupId(String sit_back_id);
	
	// 객관식 응답 리스트

	// 객관식 응답 수
	
	// 객관식 응답 종류 리스트
	
	// 객관식 응답 종류 리스트 수
	
	//-- 필요 시 구문 추가
}
