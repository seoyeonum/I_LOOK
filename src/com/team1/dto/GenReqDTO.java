package com.team1.dto;
//일반 돌봄 신청 데이터 자료형 클래스 (신청**, 삭제**)

public class GenReqDTO
{
	// GEN_REQ_ID, GEN_REG_ID, CHILD_BACKUP_ID, MESSAGE, START_DATE, END_DATE
	// START_TIME, END_TIME, REQ_DATE, SIT_READ_DATE
	
	// 주요 속성 구성
	private String gen_req_id, gen_reg_id, child_backup_id, message;
	private String start_date, end_date;
	private int start_time, end_time;
	private String req_date, sit_read_date;
	
	// getter / setter 구성
	public String getGen_req_id()
	{
		return gen_req_id;
	}
	public void setGen_req_id(String gen_req_id)
	{
		this.gen_req_id = gen_req_id;
	}
	public String getGen_reg_id()
	{
		return gen_reg_id;
	}
	public void setGen_reg_id(String gen_reg_id)
	{
		this.gen_reg_id = gen_reg_id;
	}
	public String getChild_backup_id()
	{
		return child_backup_id;
	}
	public void setChild_backup_id(String child_backup_id)
	{
		this.child_backup_id = child_backup_id;
	}
	public String getMessage()
	{
		return message;
	}
	public void setMessage(String message)
	{
		this.message = message;
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
	public String getReq_date()
	{
		return req_date;
	}
	public void setReq_date(String req_date)
	{
		this.req_date = req_date;
	}
	public String getSit_read_date()
	{
		return sit_read_date;
	}
	public void setSit_read_date(String sit_read_date)
	{
		this.sit_read_date = sit_read_date;
	}
	
	
	
}
