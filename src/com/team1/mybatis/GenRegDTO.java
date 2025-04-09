package com.team1.mybatis;
// 일반 돌봄 근무 등록 데이터 자료형 클래스

public class GenRegDTO
{
	// GEN_REG_ID, SIT_BACKUP_ID, TITLE, START_DATE, END_DATE
	// START_TIME, END_TIME
	// REG_DATE, INTRODUCTION
	
	// 주요 속성 구성
	private String gen_reg_id, sit_backup_id, title;
	private String start_date, end_date, reg_date, introduction;
	private int start_time, end_time;
	
	// getter / setter 구성
	public String getGen_reg_id()
	{
		return gen_reg_id;
	}
	public void setGen_reg_id(String gen_reg_id)
	{
		this.gen_reg_id = gen_reg_id;
	}
	public String getSit_backup_id()
	{
		return sit_backup_id;
	}
	public void setSit_backup_id(String sit_backup_id)
	{
		this.sit_backup_id = sit_backup_id;
	}
	public String getTitle()
	{
		return title;
	}
	public void setTitle(String title)
	{
		this.title = title;
	}
	public String getStart_date()
	{
		return start_date;
	}
	public void setStart_date(String start_date)
	{
		this.start_date = start_date;
	}
	public String getEnd_date()
	{
		return end_date;
	}
	public void setEnd_date(String end_date)
	{
		this.end_date = end_date;
	}
	public String getReg_date()
	{
		return reg_date;
	}
	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}
	public String getIntroduction()
	{
		return introduction;
	}
	public void setIntroduction(String introduction)
	{
		this.introduction = introduction;
	}
	public int getStart_time()
	{
		return start_time;
	}
	public void setStart_time(int start_time)
	{
		this.start_time = start_time;
	}
	public int getEnd_time()
	{
		return end_time;
	}
	public void setEnd_time(int end_time)
	{
		this.end_time = end_time;
	}
	
	
}
