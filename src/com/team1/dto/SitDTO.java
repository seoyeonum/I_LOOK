/*=======================
	SitDTO.java
	- 시터 정보 담는 DTO
	  시터 백업 코드, 등록일, 아이디
	, 시터 회원가입 코드, 비밀번호, 시터 이름
	, 주민등록번호 앞자리, 뒷자리, 도로명 주소
	, 상세주소, 우편번호, 전화번호
	, 시터 사진 저장 경로, 시터 승인 완료 코드
	, 승인 일자
======================*/

package com.team1.dto;

public class SitDTO
{
	// 주요 속성
	
	// 시터 백업 코드, 등록일, 아이디, 시터 회원가입 코드, 비밀번호, 이름
	String sit_backup_id, reg_date, id, sit_reg_id, pw, name;
	
	// 주민등록번호 앞자리, 뒷자리, 도로명 주소, 상세주소, 우편번호, 전화번호, 이미지 경로
	String ssn_first, ssn_second, road_addr, detailed_addr, zip_code
		 , tel, file_path;
	
	// 승인 일자
	String sit_chk_id, chk_date;
	
	// 총 근무 시간, 전체 평균 점수, 3개월 평균 점수, 시터가 가진 등급
	int totalworktime, totalrating, month3rating;
	String grade;

	
	// getter / setter 구성
	public int getTotalworktime()
	{
		return totalworktime;
	}

	public void setTotalworktime(int totalworktime)
	{
		this.totalworktime = totalworktime;
	}

	public int getTotalrating()
	{
		return totalrating;
	}

	public void setTotalrating(int totalrating)
	{
		this.totalrating = totalrating;
	}

	public int getMonth3rating()
	{
		return month3rating;
	}

	public void setMonth3rating(int month3rating)
	{
		this.month3rating = month3rating;
	}

	public String getGrade()
	{
		return grade;
	}

	public void setGrade(String grade)
	{
		this.grade = grade;
	}

	public String getSit_chk_id()
	{
		return sit_chk_id;
	}

	public void setSit_chk_id(String sit_chk_id)
	{
		this.sit_chk_id = sit_chk_id;
	}

	public String getSit_backup_id()
	{
		return sit_backup_id;
	}

	public void setSit_backup_id(String sit_backup_id)
	{
		this.sit_backup_id = sit_backup_id;
	}

	public String getReg_date()
	{
		return reg_date;
	}

	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getSit_reg_id()
	{
		return sit_reg_id;
	}

	public void setSit_reg_id(String sit_reg_id)
	{
		this.sit_reg_id = sit_reg_id;
	}

	public String getPw()
	{
		return pw;
	}

	public void setPw(String pw)
	{
		this.pw = pw;
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

	public String getZip_code()
	{
		return zip_code;
	}

	public void setZip_code(String zip_code)
	{
		this.zip_code = zip_code;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
	}

	public String getFile_path()
	{
		return file_path;
	}

	public void setFile_path(String file_path)
	{
		this.file_path = file_path;
	}

	public String getChk_date()
	{
		return chk_date;
	}

	public void setChk_date(String chk_date)
	{
		this.chk_date = chk_date;
	}

	
	
	
	
}
