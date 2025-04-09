/*====================
	DocRegDTO.java
	- 시터 검증 서류 데이터 자료형 클래스
	
	  검증 서류 등록 코드, 서류 종류 카드, 시터 회원가입 코드
	, 첨부파일 저장경로, 서류 등록일
	, 서류 종류
===================*/

package com.team1.mybatis;

public class DocRegDTO
{
	// 주요 속성 구성
	
	// 검증 서류 등록 코드, 서류 종류 코드, 시터 회원가입 코드
	String doc_reg_id, doc_type_id, sit_reg_id;
	
	// 첨부파일 저장경로, 서류 등록일
	String file_path, reg_date;

	// 서류 종류
	String type;

	
	// getter / setter 구성
	public String getDoc_reg_id()
	{
		return doc_reg_id;
	}

	public void setDoc_reg_id(String doc_reg_id)
	{
		this.doc_reg_id = doc_reg_id;
	}

	public String getDoc_type_id()
	{
		return doc_type_id;
	}

	public void setDoc_type_id(String doc_type_id)
	{
		this.doc_type_id = doc_type_id;
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
