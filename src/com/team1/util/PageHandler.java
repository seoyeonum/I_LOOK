package com.team1.util;

// PageHandler - 페이징 처리를 위한 클래스
// 페이지 번호, 시작/끝 번호, 블록 단위 번호 등을 계산
public class PageHandler
{
	// 모든 JSP에서 공통으로 사용할 기본값
	public static final int PAGE_SIZE = 10; // 한 페이지에 출력할 게시물 수
	public static final int BLOCK_SIZE = 7; // 하단에 표시할 페이지 번호 수 (1~7, 8~14 이런 식)

	// 주요 변수 선언
	private int page; 		 // 현재 페이지 번호
	private int totalPage;	 // 전체 페이지 수
	private int start; 		 // DB 조회 시작 행(Row) 번호
	private int end;		 // DB 조회 끝 행(Row) 번호
	private int startPage;   // 하단 페이지 블록 시작 번호
	private int endPage; 	 // 하단 페이지 블록 끝 번호
	private int startNum; 	 // 화면에 출력할 시작 번호 (ex: 100번부터 시작)

	// 기본 생성자 - page, totalCount만 넘기면 PAGE_SIZE, BLOCK_SIZE 기본값으로 처리
	public PageHandler(int page, int totalCount)
	{
		// 현재 페이지가 1 미만이면 1페이지로 고정
		if (page < 1)
			page = 1;

		// 총 페이지 수 계산 (올림 처리)
		int calcTotalPage = (int) Math.ceil((double) totalCount / PAGE_SIZE);
		if (calcTotalPage < 1)
			calcTotalPage = 1;

		// 현재 페이지가 총 페이지 수보다 크면 마지막 페이지로 고정
		if (page > calcTotalPage)
			page = calcTotalPage;

		this.page = page;
		this.totalPage = calcTotalPage;

		// 현재 페이지 기준 DB 조회 시작 row, 끝 row 계산
		this.start = (page - 1) * PAGE_SIZE + 1;
		this.end = page * PAGE_SIZE;

		// 하단 페이지 블록 시작/끝 번호 계산
		this.startPage = ((page - 1) / BLOCK_SIZE) * BLOCK_SIZE + 1;
		int calcEndPage = this.startPage + BLOCK_SIZE - 1;
		if (calcEndPage > this.totalPage)
			calcEndPage = this.totalPage;
		this.endPage = calcEndPage;

		// 현재 페이지의 첫 게시물 번호 계산 (번호를 역순으로)
		this.startNum = totalCount - (page - 1) * PAGE_SIZE;
	}

	// getter 메서드 (외부에서 읽기 전용)
	public int getPage()
	{
		return page;
	}

	public int getTotalPage()
	{
		return totalPage;
	}

	public int getStart()
	{
		return start;
	}

	public int getEnd()
	{
		return end;
	}

	public int getStartPage()
	{
		return startPage;
	}

	public int getEndPage()
	{
		return endPage;
	}

	public int getStartNum()
	{
		return startNum;
	}
}
