package com.team1.dto;
// 아이 데이터 자료형 클래스 (백업, 아이등록, 지병/알레르기/장애)

public class ChildConditionDTO
{
	// REG_DATE, TYPE
	// CHILD_MEDICAL_ID, MEDICAL_TYPE_ID
	// CHILD_ALLERGY_ID, ALLERGY_TYPE_ID
	// CHILD_DISABILITY_ID, DISABILITY_TYPE_ID
	
	// 주요 속성 구성
	private String reg_date, type;
	private String conditionType;   // "지병", "알레르기", "장애"
	private String child_medical_id, medical_type_id;
	private String child_allergy_id, allergy_type_id;
	private String child_disability_id, disability_type_id;
	
	// getter / setter 구성
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
	public String getConditionType()
	{
		return conditionType;
	}
	public void setConditionType(String conditionType)
	{
		this.conditionType = conditionType;
	}
	public String getChild_medical_id()
	{
		return child_medical_id;
	}
	public void setChild_medical_id(String child_medical_id)
	{
		this.child_medical_id = child_medical_id;
	}
	public String getMedical_type_id()
	{
		return medical_type_id;
	}
	public void setMedical_type_id(String medical_type_id)
	{
		this.medical_type_id = medical_type_id;
	}
	public String getChild_allergy_id()
	{
		return child_allergy_id;
	}
	public void setChild_allergy_id(String child_allergy_id)
	{
		this.child_allergy_id = child_allergy_id;
	}
	public String getAllergy_type_id()
	{
		return allergy_type_id;
	}
	public void setAllergy_type_id(String allergy_type_id)
	{
		this.allergy_type_id = allergy_type_id;
	}
	public String getChild_disability_id()
	{
		return child_disability_id;
	}
	public void setChild_disability_id(String child_disability_id)
	{
		this.child_disability_id = child_disability_id;
	}
	public String getDisability_type_id()
	{
		return disability_type_id;
	}
	public void setDisability_type_id(String disability_type_id)
	{
		this.disability_type_id = disability_type_id;
	}
}
