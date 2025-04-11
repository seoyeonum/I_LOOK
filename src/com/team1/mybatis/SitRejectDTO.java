/*========================
	SitRejectDTO.java
	시터 승인 거절 데이터 자료형 클래스
	  시터 승인 거절 코드,  거절 일자
	, 시터 백업 코드, 거절 사유 코드
	, 거절 사유
========================*/

package com.team1.mybatis;

public class SitRejectDTO
{
	// 주요 속성 구성
	
	// 시터 승인 거절 코드, 시터 백업 코드, 거절 사유 코드, 거절 일자
	String sit_rejected_id, sit_backup_id, sit_rejected_reason_id, rejected_date;
	
	// 거절 사유
	String reason;

	
	// getter / setter 구성
	public String getSit_rejected_id()
	{
		return sit_rejected_id;
	}

	public void setSit_rejected_id(String sit_rejected_id)
	{
		this.sit_rejected_id = sit_rejected_id;
	}

	public String getSit_backup_id()
	{
		return sit_backup_id;
	}

	public void setSit_backup_id(String sit_backup_id)
	{
		this.sit_backup_id = sit_backup_id;
	}

	public String getSit_rejected_reason_id()
	{
		return sit_rejected_reason_id;
	}

	public void setSit_rejected_reason_id(String sit_rejected_reason_id)
	{
		this.sit_rejected_reason_id = sit_rejected_reason_id;
	}

	public String getRejected_date()
	{
		return rejected_date;
	}

	public void setRejected_date(String rejected_date)
	{
		this.rejected_date = rejected_date;
	}

	public String getReason()
	{
		return reason;
	}

	public void setReason(String reason)
	{
		this.reason = reason;
	}

	
	

}
