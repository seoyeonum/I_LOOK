package com.team1.dto;

public class NoticeDTO
{
	// 주요 속성 구성 -- 공지사항 유형 코드, 유형 이름, 공지사항 코드, 제목, 내용, 조회수, 작성일
	private String notice_type_id, type, notice_id, subject, content, noticed_date;
	private int hitcount;
	
	// 속성 추가
	private int rnum;									//-- 페이지 넘버
	private int start;									//-- 시작 페이지
    private int end;									//-- 끝 페이지
	
	// getter / setter 구성
	public String getNotice_type_id()
	{
		return notice_type_id;
	}
	public void setNotice_type_id(String notice_type_id)
	{
		this.notice_type_id = notice_type_id;
	}
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
	}
	public String getNotice_id()
	{
		return notice_id;
	}
	public void setNotice_id(String notice_id)
	{
		this.notice_id = notice_id;
	}
	public String getSubject()
	{
		return subject;
	}
	public void setSubject(String subject)
	{
		this.subject = subject;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getNoticed_date()
	{
		return noticed_date;
	}
	public void setNoticed_date(String noticed_date)
	{
		this.noticed_date = noticed_date;
	}
	public int getHitcount()
	{
		return hitcount;
	}
	public void setHitcount(int hitcount)
	{
		this.hitcount = hitcount;
	}
	public int getRnum()
	{
		return rnum;
	}
	public void setRnum(int rnum)
	{
		this.rnum = rnum;
	}
	public int getStart()
	{
		return start;
	}
	public void setStart(int start)
	{
		this.start = start;
	}
	public int getEnd()
	{
		return end;
	}
	public void setEnd(int end)
	{
		this.end = end;
	}
	
}
