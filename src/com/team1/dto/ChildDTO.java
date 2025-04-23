package com.team1.dto;
// 아이 데이터 자료형 클래스 (백업, 아이등록, 지병/알레르기/장애)

import java.util.List;

public class ChildDTO
{
	// CHILD_BACKUP_ID, PAR_BACKUP_ID, REG_DATE
	// CHILD_REG_ID, NAME, HEIGHT, WEIGHT, SSN_FIRST, SSN_SECOND, SPECIAL_NOTES, BLOOD_TYPE, REG_DATE
	// CHILD_MEDICAL_ID, MEDICAL_TYPE_ID, REG_DATE, TYPE
	// CHILD_ALLERGY_ID, ALLERGY_TYPE_ID
	// CHILD_DISABILITY_ID, DISABILITY_TYPE_ID
	
	// 주요 속성 구성
	private String child_backup_id, par_backup_id, reg_date;
	private String child_reg_id, name, ssn_first, ssn_second, special_notes, blood_type;
	private int age, height, weight;				//-- 연령(만나이), 키, 몸무게
	private String child_medical_id, medical_type_id, type;
	private String child_allergy_id, allergy_type_id;
	private String child_disability_id, disability_type_id;
	private String disability; 
	private String disease;    
	private String allergy;
	
	private String gender;							//-- 성별
	private String road_addr, detailed_addr;		//-- 도로명 주소, 상세주소
	
	// 아이별 상태 리스트
    private List<ChildConditionDTO> medicalList;
    private List<ChildConditionDTO> allergyList;
    private List<ChildConditionDTO> disabilityList;
    
	// getter / setter 구성
	public String getChild_backup_id()
	{
		return child_backup_id;
	}
	public void setChild_backup_id(String child_backup_id)
	{
		this.child_backup_id = child_backup_id;
	}
	public String getPar_backup_id()
	{
		return par_backup_id;
	}
	public void setPar_backup_id(String par_backup_id)
	{
		this.par_backup_id = par_backup_id;
	}
	public String getReg_date()
	{
		return reg_date;
	}
	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}
	public String getChild_reg_id()
	{
		return child_reg_id;
	}
	public void setChild_reg_id(String child_reg_id)
	{
		this.child_reg_id = child_reg_id;
	}
	public String getName()
	{
		return name;
	}
	public void setName(String name)
	{
		this.name = name;
	}
	public String getSsn_first()
	{
		return ssn_first;
	}
	public void setSsn_first(String ssn_first)
	{
		this.ssn_first = ssn_first;
	}
	public String getSsn_second()
	{
		return ssn_second;
	}
	public void setSsn_second(String ssn_second)
	{
		this.ssn_second = ssn_second;
	}
	public String getSpecial_notes()
	{
		return special_notes;
	}
	public void setSpecial_notes(String special_notes)
	{
		this.special_notes = special_notes;
	}
	public String getBlood_type()
	{
		return blood_type;
	}
	public void setBlood_type(String blood_type)
	{
		this.blood_type = blood_type;
	}
	public int getAge()
	{
		return age;
	}
	public void setAge(int age)
	{
		this.age = age;
	}
	public int getHeight()
	{
		return height;
	}
	public void setHeight(int height)
	{
		this.height = height;
	}
	public int getWeight()
	{
		return weight;
	}
	public void setWeight(int weight)
	{
		this.weight = weight;
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
	public String getType()
	{
		return type;
	}
	public void setType(String type)
	{
		this.type = type;
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
	public String getDisability()
	{
		return disability;
	}
	public void setDisability(String disability)
	{
		this.disability = disability;
	}
	public String getDisease()
	{
		return disease;
	}
	public void setDisease(String disease)
	{
		this.disease = disease;
	}
	public String getAllergy()
	{
		return allergy;
	}
	public void setAllergy(String allergy)
	{
		this.allergy = allergy;
	}
	public String getGender()
	{
		return gender;
	}
	public void setGender(String gender)
	{
		this.gender = gender;
	}
	public String getRoad_addr()
	{
		return road_addr;
	}
	public void setRoad_addr(String road_addr)
	{
		this.road_addr = road_addr;
	}
	public String getDetailed_addr()
	{
		return detailed_addr;
	}
	public void setDetailed_addr(String detailed_addr)
	{
		this.detailed_addr = detailed_addr;
	}
	public List<ChildConditionDTO> getMedicalList()
	{
		return medicalList;
	}
	public void setMedicalList(List<ChildConditionDTO> medicalList)
	{
		this.medicalList = medicalList;
	}
	public List<ChildConditionDTO> getAllergyList()
	{
		return allergyList;
	}
	public void setAllergyList(List<ChildConditionDTO> allergyList)
	{
		this.allergyList = allergyList;
	}
	public List<ChildConditionDTO> getDisabilityList()
	{
		return disabilityList;
	}
	public void setDisabilityList(List<ChildConditionDTO> disabilityList)
	{
		this.disabilityList = disabilityList;
	}
	
}
