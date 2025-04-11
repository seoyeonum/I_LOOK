package com.team1.mybatis;

import java.util.ArrayList;


public interface INoticeDAO
{
	// 공지사항 유형 추가
	public int addType(NoticeDTO notice);
	
	// 공지사항 유형 조회
	public ArrayList<String> listType();
	
	// 공지사항 조회
	public ArrayList<NoticeDTO> listNotice();
	
	// 공지사항 데이터 추가
	public int addNotice(NoticeDTO notice);
	
	// 공지사항 수정
	public int update(NoticeDTO notice);
	
	// 공지사항 삭제
	public int remove(String notice_id);
	
	// 공지사항 검색
	public NoticeDTO search(String notice_id);
	
	// 공지사항 게시물 수 확인
	public int count();

}
