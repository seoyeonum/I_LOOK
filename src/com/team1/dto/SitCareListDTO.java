/*============================
	SitCareListDTO.java
	- 안예지가 만든 시터 마이페이지에서
	  근무 등록 내역 확인, 같은 페이지의 상세 정보 AJAX 처리,
	  돌봄 제공 내역 확인, 같은 페이지의 상세 정보 새창 처리,
	  돌봄 완료 내역 확인(일반 혹은 긴급)
	  에 필요한 모든 쿼리와 변수를 담아놓는 DTO.
	  
==========================*/

package com.team1.dto;

public class SitCareListDTO
{
	// 주요 속성 구성
	
	// 시터 백업 코드, 등록 코드, 등록일, 제목
	private String sit_backup_id, gen_reg_id, reg_date, title;
	// 근무 가능 시작 날짜, 근무 가능 종료 날짜, 근무 가능 시작 시각, 근무 가능 종료 시각
	private String sit_start_date, sit_end_date, sit_start_time, sit_end_time;
	// 소개, 신청 현황
	private String introduction, request_result;
	
	// 신청 코드, 신청 날짜 
	private String gen_req_id, req_date;
	// 이용 시작 날짜, 이용 종료 날짜, 이용 시작 시각, 이용 종료 시각
	private String par_start_date, par_end_date, par_start_time, par_end_time; 
	// 구까지만 잘린 주소, 아이 성별, 아이 연령
	private String gu_addr, child_gender, child_age;
	// 아이 지병, 아이 알레르기, 아이 장애, 신청시 전달 메시지
	private String medical_type, allergie_type, disability_type, message;
	
	
	// 전체 주소, 상세 주소, 아이 키, 아이 몸무게, 아이 혈액형
	private String road_addr, detailed_addr, height, weight, blood_type;
	// 특이사항
	private String special_notes;
	
	
	// 긴급 요청 코드, 신청 부모 이름, 아이 이름
	private String emg_req_id, par_name, chi_name;


	// getter / setter 구성
	public String getSit_backup_id()
	{
		return sit_backup_id;
	}

	public void setSit_backup_id(String sit_backup_id)
	{
		this.sit_backup_id = sit_backup_id;
	}

	public String getGen_reg_id()
	{
		return gen_reg_id;
	}

	public void setGen_reg_id(String gen_reg_id)
	{
		this.gen_reg_id = gen_reg_id;
	}

	public String getReg_date()
	{
		return reg_date;
	}

	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}

	public String getTitle()
	{
		return title;
	}

	public void setTitle(String title)
	{
		this.title = title;
	}

	public String getSit_start_date()
	{
		return sit_start_date;
	}

	public void setSit_start_date(String sit_start_date)
	{
		this.sit_start_date = sit_start_date;
	}

	public String getSit_end_date()
	{
		return sit_end_date;
	}

	public void setSit_end_date(String sit_end_date)
	{
		this.sit_end_date = sit_end_date;
	}

	public String getSit_start_time()
	{
		return sit_start_time;
	}

	public void setSit_start_time(String sit_start_time)
	{
		this.sit_start_time = sit_start_time;
	}

	public String getSit_end_time()
	{
		return sit_end_time;
	}

	public void setSit_end_time(String sit_end_time)
	{
		this.sit_end_time = sit_end_time;
	}

	public String getIntroduction()
	{
		return introduction;
	}

	public void setIntroduction(String introduction)
	{
		this.introduction = introduction;
	}

	public String getRequest_result()
	{
		return request_result;
	}

	public void setRequest_result(String request_result)
	{
		this.request_result = request_result;
	}

	public String getGen_req_id()
	{
		return gen_req_id;
	}

	public void setGen_req_id(String gen_req_id)
	{
		this.gen_req_id = gen_req_id;
	}

	public String getReq_date()
	{
		return req_date;
	}

	public void setReq_date(String req_date)
	{
		this.req_date = req_date;
	}

	public String getPar_start_date()
	{
		return par_start_date;
	}

	public void setPar_start_date(String par_start_date)
	{
		this.par_start_date = par_start_date;
	}

	public String getPar_end_date()
	{
		return par_end_date;
	}

	public void setPar_end_date(String par_end_date)
	{
		this.par_end_date = par_end_date;
	}

	public String getPar_start_time()
	{
		return par_start_time;
	}

	public void setPar_start_time(String par_start_time)
	{
		this.par_start_time = par_start_time;
	}

	public String getPar_end_time()
	{
		return par_end_time;
	}

	public void setPar_end_time(String par_end_time)
	{
		this.par_end_time = par_end_time;
	}

	public String getGu_addr()
	{
		return gu_addr;
	}

	public void setGu_addr(String gu_addr)
	{
		this.gu_addr = gu_addr;
	}

	public String getChild_gender()
	{
		return child_gender;
	}

	public void setChild_gender(String child_gender)
	{
		this.child_gender = child_gender;
	}

	public String getChild_age()
	{
		return child_age;
	}

	public void setChild_age(String child_age)
	{
		this.child_age = child_age;
	}

	public String getMedical_type()
	{
		return medical_type;
	}

	public void setMedical_type(String medical_type)
	{
		this.medical_type = medical_type;
	}

	public String getAllergie_type()
	{
		return allergie_type;
	}

	public void setAllergie_type(String allergie_type)
	{
		this.allergie_type = allergie_type;
	}

	public String getDisability_type()
	{
		return disability_type;
	}

	public void setDisability_type(String disability_type)
	{
		this.disability_type = disability_type;
	}

	public String getMessage()
	{
		return message;
	}

	public void setMessage(String message)
	{
		this.message = message;
	}

	public String getRoad_addr()
	{
		return road_addr;
	}

	public void setRoad_addr(String road_addr)
	{
		this.road_addr = road_addr;
	}

	public String getHeight()
	{
		return height;
	}

	public void setHeight(String height)
	{
		this.height = height;
	}

	public String getWeight()
	{
		return weight;
	}

	public void setWeight(String weight)
	{
		this.weight = weight;
	}

	public String getBlood_type()
	{
		return blood_type;
	}

	public void setBlood_type(String blood_type)
	{
		this.blood_type = blood_type;
	}

	public String getSpecial_notes()
	{
		return special_notes;
	}

	public void setSpecial_notes(String special_notes)
	{
		this.special_notes = special_notes;
	}

	public String getEmg_req_id()
	{
		return emg_req_id;
	}

	public void setEmg_req_id(String emg_req_id)
	{
		this.emg_req_id = emg_req_id;
	}

	public String getDetailed_addr()
	{
		return detailed_addr;
	}

	public void setDetailed_addr(String detailed_addr)
	{
		this.detailed_addr = detailed_addr;
	}

	public String getPar_name()
	{
		return par_name;
	}

	public void setPar_name(String par_name)
	{
		this.par_name = par_name;
	}

	public String getChi_name()
	{
		return chi_name;
	}

	public void setChi_name(String chi_name)
	{
		this.chi_name = chi_name;
	}

	
}
