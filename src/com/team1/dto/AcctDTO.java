/*================
	AcctDTO.java
===============*/

// ○○○DTO.java 파일 저장 경로 확인을 위한 샘플 파일


package com.team1.dto;

public class AcctDTO
{
	// 주요 속성 구성
	// 은행 종류 코드, 은행 종류 이름
	private String bank_type_id, type;

	// getter / setter 구성
	public String getBank_type_id()
	{
		return bank_type_id;
	}
	
	public void setBank_type_id(String bank_type_id)
	{
		this.bank_type_id = bank_type_id;
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
