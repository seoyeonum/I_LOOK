/*======================
	SitViolDTO.java
	- 시터 위반 내역 데이터 자료형 클래스
	
	  시터 위반 내역 코드, 시터 백업 코드
	, 위반 내역 종류 코드, 시터 위반 발생 일시
	, 위반 내역 종류
======================*/

package com.team1.dto;

public class SitViolDTO
{
	// 주요 속성 구성
	
	// 시터 위반 내역 코드, 시터 백업 코드
	private String sit_viol_rec_id, sit_backup_id;
	
	// 위반 내역 종류 코드, 시터 위반 발생 일시, 위반 내역 종류
	private String viol_type_id, recorded_date, type;

	
	// getter / setter 구성 
	public String getSit_viol_rec_id()
	{
		return sit_viol_rec_id;
	}

	public void setSit_viol_rec_id(String sit_viol_rec_id)
	{
		this.sit_viol_rec_id = sit_viol_rec_id;
	}

	public String getSit_backup_id()
	{
		return sit_backup_id;
	}

	public void setSit_backup_id(String sit_backup_id)
	{
		this.sit_backup_id = sit_backup_id;
	}

	public String getViol_type_id()
	{
		return viol_type_id;
	}

	public void setViol_type_id(String viol_type_id)
	{
		this.viol_type_id = viol_type_id;
	}

	public String getRecorded_date()
	{
		return recorded_date;
	}

	public void setRecorded_date(String recorded_date)
	{
		this.recorded_date = recorded_date;
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
