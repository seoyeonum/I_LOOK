package com.team1.dto;
// 부모 탈퇴 데이터 자료형 클래스

public class ParWithdrawedDTO
{
	// PAR_WITHDRAWED_ID, WITHDRAWED_DATE, PAR_BACKUP_ID, REASON_WITHDRAWED_ID, TYPE
	
	// 주요 속성 구성
	private String par_withdrawed_id, withdrawed_date, par_backup_id, reason_withdrawed_id, type;

	// getter / setter 구성
	public String getPar_withdrawed_id()
	{
		return par_withdrawed_id;
	}

	public void setPar_withdrawed_id(String par_withdrawed_id)
	{
		this.par_withdrawed_id = par_withdrawed_id;
	}

	public String getWithdrawed_date()
	{
		return withdrawed_date;
	}

	public void setWithdrawed_date(String withdrawed_date)
	{
		this.withdrawed_date = withdrawed_date;
	}

	public String getPar_backup_id()
	{
		return par_backup_id;
	}

	public void setPar_backup_id(String par_backup_id)
	{
		this.par_backup_id = par_backup_id;
	}

	public String getReason_withdrawed_id()
	{
		return reason_withdrawed_id;
	}

	public void setReason_withdrawed_id(String reason_withdrawed_id)
	{
		this.reason_withdrawed_id = reason_withdrawed_id;
	}

	public String getType()
	{
		return type;
	}

	public void setType(String type)
	{
		this.type = type;
	}
	
	
}
