package com.team1.mybatis;

import java.util.ArrayList;

import com.team1.dto.NoticeDTO;


public interface INoticeDAO
{
	// 공지사항 유형 추가
	// public int addType(NoticeDTO notice);
	
	// 공지사항 유형 조회
	public ArrayList<NoticeDTO> listType();
	
	// 공지사항 조회
	public ArrayList<NoticeDTO> listNotice(NoticeDTO dto);
	
	// 공지사항 조회 (최근 5건만)
	public ArrayList<NoticeDTO> listNoticeLately();
	
	// 공지사항 상세 열람
	public NoticeDTO noticeDetail(String notice_id);
	
	// 공지사항 데이터 추가
	public int add(NoticeDTO notice);
	
	// 공지사항 수정
	public int modify(NoticeDTO notice);
	
	// 공지사항 삭제
	public int remove(String notice_id);
	
	// 공지사항 검색(제목)
	public NoticeDTO searchSubject(String search_text);
	
	// 공지사항 검색(내용)
	public NoticeDTO searchContent(String search_text);
	
	// 공지사항 검색(제목+내용)
	public NoticeDTO searchSubjectOrContent(String search_text);
	
	// 조회 수 1 씩 증가
	public int increaseHit(String notice_id);
	
	// 공지사항 게시물 수 확인
	public int count();

}
