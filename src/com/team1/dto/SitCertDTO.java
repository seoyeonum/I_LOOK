/*======================
	SitCertDTO.java
	시터 보유 자격증 데이터 DTO
	  자격증 코드, 자격증 종류 코드, 시터 회원가입 코드
	, 첨부파일 저장 경로, 자격증 등록일
	, 자격증 종류
=====================*/

package com.team1.dto;

public class SitCertDTO
{
	// 주요 속성 구성
	
	// 자격증 코드, 자격증 종류 코드, 시터 회원가입 카드, 첨부파일 저장 경로, 자격증 등록일
	private String cert_reg_id, cert_type_id, sit_reg_id, file_path, reg_date;
	
	// 자격증 종류
	private String type;

	
	// getter / setter 구성
	public String getCert_reg_id()
	{
		return cert_reg_id;
	}

	public void setCert_reg_id(String cert_reg_id)
	{
		this.cert_reg_id = cert_reg_id;
	}

	public String getCert_type_id()
	{
		return cert_type_id;
	}

	public void setCert_type_id(String cert_type_id)
	{
		this.cert_type_id = cert_type_id;
	}

	public String getSit_reg_id()
	{
		return sit_reg_id;
	}

	public void setSit_reg_id(String sit_reg_id)
	{
		this.sit_reg_id = sit_reg_id;
	}

	public String getFile_path()
	{
		return file_path;
	}

	public void setFile_path(String file_path)
	{
		this.file_path = file_path;
	}

	public String getReg_date()
	{
		return reg_date;
	}

	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
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
