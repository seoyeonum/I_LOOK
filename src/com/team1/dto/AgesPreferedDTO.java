/*==========================
	AgesPreferedDTO.java
	- 시터 돌봄 선호 연령대 데이터 자료형 클래스
	
	  돌봄 선호 연령대 종류 코드, 일반 돌봄 근무 등록 코드, 연령대 종류 코드
	, 연령대 종류
========================*/

package com.team1.dto;

public class AgesPreferedDTO
{
	// 주요 속성 구성
	
	// 돌봄 선호 연령대 종류 코드, 일반 돌봄 근무 등록 코드, 연령대 종류 코드
	private String age_prefered_id, gen_reg_id, age_type_id;
	
	// 연령대 종류
	private String type;

	
	// getter / setter 구성
	public String getAge_prefered_id()
	{
		return age_prefered_id;
	}

	public void setAge_prefered_id(String age_prefered_id)
	{
		this.age_prefered_id = age_prefered_id;
	}

	public String getGen_reg_id()
	{
		return gen_reg_id;
	}

	public void setGen_reg_id(String gen_reg_id)
	{
		this.gen_reg_id = gen_reg_id;
	}

	public String getAge_type_id()
	{
		return age_type_id;
	}

	public void setAge_type_id(String age_type_id)
	{
		this.age_type_id = age_type_id;
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
