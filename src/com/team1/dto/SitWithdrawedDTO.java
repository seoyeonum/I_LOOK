/*==========================
	SitWithdrawedDTO.java
	시터 탈퇴 내역 데이터 자료형 클래스
	
	  시터 탈퇴 코드, 탈퇴 사유 코드
	, 시터 백업 코드, 탈퇴일, 탈퇴 사유
=============================*/

package com.team1.dto;

public class SitWithdrawedDTO
{
	// 주요 속성 구성
	
	// 시터 탈퇴 코드, 탈퇴 사유 코드
	private String sit_withdrawed_id, reason_withdrawed_id;
	
	// 시터 백업 코드, 탈퇴일, 탈퇴 사유
	private String sit_backup_id, withdrawed_date, type;

	
	// getter / setter 구성
	public String getSit_withdrawed_id()
	{
		return sit_withdrawed_id;
	}

	public void setSit_withdrawed_id(String sit_withdrawed_id)
	{
		this.sit_withdrawed_id = sit_withdrawed_id;
	}

	public String getReason_withdrawed_id()
	{
		return reason_withdrawed_id;
	}

	public void setReason_withdrawed_id(String reason_withdrawed_id)
	{
		this.reason_withdrawed_id = reason_withdrawed_id;
	}

	public String getSit_backup_id()
	{
		return sit_backup_id;
	}

	public void setSit_backup_id(String sit_backup_id)
	{
		this.sit_backup_id = sit_backup_id;
	}

	public String getWithdrawed_date()
	{
		return withdrawed_date;
	}

	public void setWithdrawed_date(String withdrawed_date)
	{
		this.withdrawed_date = withdrawed_date;
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
