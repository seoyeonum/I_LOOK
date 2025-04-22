package com.team1.dto;
// 부모 데이터 자료형 클래스


public class ParDTO
{
	// PAR_REG_ID,NAME, PW, TEL, SSN_FIRST, SSN_SECOND, ROAD_ADDR, DETAILED_ADDR, ZIP_CODE
	// PAR_BACKUP_ID, ID, REG_DATE
	
	// 주요 속성 구성
	private String par_reg_id, par_backup_id, name, pw, tel, ssn_first,ssn_second, road_addr, detailed_addr;
	private String id, reg_date;
	private int zip_code, child_count;
	
	// getter / setter 구성
	public String getPar_reg_id()
	{
		return par_reg_id;
	}

	public void setPar_reg_id(String par_reg_id)
	{
		this.par_reg_id = par_reg_id;
	}

	public String getName()
	{
		return name;
	}

	public void setName(String name)
	{
		this.name = name;
	}

	public String getPw()
	{
		return pw;
	}

	public void setPw(String pw)
	{
		this.pw = pw;
	}

	public String getTel()
	{
		return tel;
	}

	public void setTel(String tel)
	{
		this.tel = tel;
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

	public String getPar_backup_id()
	{
		return par_backup_id;
	}

	public void setPar_backup_id(String par_backup_id)
	{
		this.par_backup_id = par_backup_id;
	}

	public String getId()
	{
		return id;
	}

	public void setId(String id)
	{
		this.id = id;
	}

	public String getReg_date()
	{
		return reg_date;
	}

	public void setReg_date(String reg_date)
	{
		this.reg_date = reg_date;
	}

	public int getZip_code()
	{
		return zip_code;
	}

	public void setZip_code(int zip_code)
	{
		this.zip_code = zip_code;
	}

	public int getChild_count()
	{
		return child_count;
	}

	public void setChild_count(int child_count)
	{
		this.child_count = child_count;
	}
	
	
}
