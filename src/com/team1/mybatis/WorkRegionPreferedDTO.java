/*==========================
	WorkRegionPreferedDTO.java
	- 시터 선호 근무 지역 데이터 자료형 클래스
	
	  선호 근무 지역 코드, 지역 코드, 일반 돌봄 근무 등록 코드
	, 지역 이름, 지역 분류
=========================*/

package com.team1.mybatis;

public class WorkRegionPreferedDTO
{
	// 주요 속성
	
	// 선호 근무 지역 코드, 지역 코드, 일반 돌봄 근무 등록 코드
	String work_region_prefered_id, region_id, gen_reg_id;
	
	// 지역 코드, 지역 이름, 지역 분류
	String name, district;

	// getter / setter 구성
	public String getWork_region_prefered_id()
	{
		return work_region_prefered_id;
	}

	public void setWork_region_prefered_id(String work_region_prefered_id)
	{
		this.work_region_prefered_id = work_region_prefered_id;
	}

	public String getRegion_id()
	{
		return region_id;
	}

	public void setRegion_id(String region_id)
	{
		this.region_id = region_id;
	}

	public String getGen_reg_id()
	{
		return gen_reg_id;
	}

	public void setGen_reg_id(String gen_reg_id)
	{
		this.gen_reg_id = gen_reg_id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getDistrict()
	{
		return district;
	}

	public void setDistrict(String district)
	{
		this.district = district;
	} 
	
	
}
