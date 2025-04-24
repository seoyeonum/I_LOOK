package com.team1.mybatis;

import java.util.ArrayList;
import org.apache.ibatis.annotations.Param;
import com.team1.dto.GenReviewDTO;

public interface IGenReviewDAO
{
    // ⭐ 일반 돌봄 리뷰 등록
    public int addGenReviews(GenReviewDTO gen_review);

    // ⭐ 일반 돌봄 리뷰 삭제
    public int removeGenReviews(@Param("gen_review_id") String gen_review_id);

    // ⭐ 객관식 응답 등록 (GenReviewDTO 사용)
    public int insertMultiReviews(GenReviewDTO dto);

    // ⭐ 객관식 응답 삭제
    public int removeMultiReviews(@Param("gen_multiple_review_id") String gen_multiple_review_id);

    // ⭐ 객관식 응답 수정
    public int updateMultiReviews(
        @Param("gen_multiple_review_id") String gen_multiple_review_id,
        @Param("gen_review_id") String gen_review_id,
        @Param("gen_multiple_type_id") String gen_multiple_type_id  // String 유지!
    );

    // ⭐ 객관식 응답 종류 등록
    public int insertMultiTypes(
        @Param("gen_multiple_type_id") String gen_multiple_type_id,
        @Param("type") String type
    );

    // ⭐ 객관식 응답 종류 삭제
    public int removeMultiTypes(@Param("gen_multiple_type_id") String gen_multiple_type_id);

    // ⭐ 객관식 응답 종류 수정
    public int updateMultiTypes(
        @Param("gen_multiple_type_id") String gen_multiple_type_id,
        @Param("type") String type
    );

    // ⭐ 일반 돌봄 리뷰 전체 리스트
    public ArrayList<GenReviewDTO> list();

    // ⭐ 리뷰 전체 수 조회
    public int countRevies();

    // ⭐ 특정 리뷰 조회 (리뷰 ID 기준)
    public GenReviewDTO findByRequestId(@Param("gen_review_id") String gen_review_id);

    // ⭐ 리뷰 중복 확인 (예약 확정 ID 기준)
    public int checkReviewExists(@Param("gen_confirmed_id") String gen_confirmed_id);

    // ⭐ 부모가 받은 총 포인트 조회 (예약 확정 ID 기준)
    public int getParentCurrentPoint(@Param("gen_confirmed_id") String gen_confirmed_id);

    // ⭐ 부모가 알림 확인 시 읽은 날짜 업데이트
    public int updateParReadDate(@Param("gen_review_id") String gen_review_id);

    // ⭐ 일반/긴급 돌봄 완료 여부 확인 (리뷰 작성 가능 여부 체크)
    public int isConfirmedFinished(@Param("gen_confirmed_id") String gen_confirmed_id);

    // ⭐ 시터가 신입인지 여부 확인 (포인트 지급 기준 확인)
    public int isNewSitter(@Param("gen_confirmed_id") String gen_confirmed_id);

    // ⭐ 예약 확정 ID로 일한 시간(used_time / work_hours) 조회
    public int getWorkHoursByConfirmedId(@Param("gen_confirmed_id") String gen_confirmed_id);
}
