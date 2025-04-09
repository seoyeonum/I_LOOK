/* =========================
 	IGenReviewDAO.java
========================== */

package com.team1.mybatis;

import java.util.ArrayList;

public interface IGenReviewDAO
{
	// 일반 돌봄 리뷰 등록
	public int addGenReviews(GenReviewDTO gr);
	
	// 일반 돌봄 리뷰 삭제
	public int removeGenReviews(GenReviewDTO gr);
	
	// 객관식 응답 등록
	public int insertMultiReviews(GenReviewDTO gr);
	
	// 객관식 응답 삭제
	public int removeMultiReviews(GenReviewDTO gr);
	
	// 객관식 응답 수정
	public int updateMultiReviews(GenReviewDTO gr);
	
	// 객관식 응답 종류 등록
	public int insertMultiTypes(GenReviewDTO gr);
	
	// 객관식 응답 종류 삭제
	public int removeMultiTypes(GenReviewDTO gr);
	
	// 객관식 응답 종류 수정
	public int updateMultiTypes(GenReviewDTO gr);
	
	// 일반 돌봄 리뷰 리스트
	public ArrayList<GenReviewDTO> list();
	
	// 일반 돌봄 리뷰 전체 수
	public int countRevies();
	
	// 돌봄 확정 아이디로 특정 리뷰 확인
	public GenReviewDTO findByRequestId(String gen_req_id);
	
	// 객관식 응답 리스트

	// 객관식 응답 수
	
	// 객관식 응답 종류 리스트
	
	// 객관식 응답 종류 리스트 수
	
	//-- 필요 시 구문 추가
}
