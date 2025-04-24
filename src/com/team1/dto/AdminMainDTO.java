package com.team1.dto;

public class AdminMainDTO
{
	private String reg_date, req_date;
	
	private int countReg, countGenReq, countEmgReq;
	
	// getter / setter 구성
	public int getCountReg()
	{
		return countReg;
	}

	public void setCountReg(int countReg)
	{
		this.countReg = countReg;
	}

	public int getCountGenReq()
	{
		return countGenReq;
	}

	public void setCountGenReq(int countGenReq)
	{
		this.countGenReq = countGenReq;
	}

	public int getCountEmgReq()
	{
		return countEmgReq;
	}

	public void setCountEmgReq(int countEmgReq)
	{
		this.countEmgReq = countEmgReq;
	}

	public String getReg_date()
	{
		return reg_date;
	}

	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}

	public String getReq_date()
	{
		return req_date;
	}

	public void setReq_date(String req_date)
	{
		this.req_date = req_date;
	}
	
	
	

	
	
	
}

