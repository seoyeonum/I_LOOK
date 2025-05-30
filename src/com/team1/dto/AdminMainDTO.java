package com.team1.dto;

import java.util.List;

public class AdminMainDTO
{
	// 일일 회원가입 등록일, 돌봄 등록일
	private String reg_date, req_date;
	
	// 회원가입 수, 일반돌봄 예약 수
	private int countReg, countDayGenReq;
	
	// 월별 예약
	private List<String> monthLabels;       
	private List<Integer> countMonthGenReq;
	
	// getter / setter 구성
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
	public int getCountReg()
	{
		return countReg;
	}
	public void setCountReg(int countReg)
	{
		this.countReg = countReg;
	}
	public int getCountDayGenReq()
	{
		return countDayGenReq;
	}
	public void setCountDayGenReq(int countDayGenReq)
	{
		this.countDayGenReq = countDayGenReq;
	}
	public List<String> getMonthLabels()
	{
		return monthLabels;
	}
	public void setMonthLabels(List<String> monthLabels)
	{
		this.monthLabels = monthLabels;
	}
	public List<Integer> getCountMonthGenReq()
	{
		return countMonthGenReq;
	}
	public void setCountMonthGenReq(List<Integer> countMonthGenReq)
	{
		this.countMonthGenReq = countMonthGenReq;
	}
	

	
	
	
	
	
	
}

