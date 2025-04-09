package com.team1.mybatis;
// 부모 위반 내역 데이터 자료형 클래스
public class ParViolDTO
{
	// PAR_VIOL_REC_ID, PAR_BACKUP_ID, VIOL_TYPE_ID, RECORDED_DATE, TYPE
	
	// 주요 속성 구성
	private String par_viol_rec_id, par_backup_id, viol_type_id, recorded_date, type;

	// getter / setter 구성
	public String getPar_viol_rec_id()
	{
		return par_viol_rec_id;
	}

	public void setPar_viol_rec_id(String par_viol_rec_id)
	{
		this.par_viol_rec_id = par_viol_rec_id;
	}

	public String getPar_backup_id()
	{
		return par_backup_id;
	}

	public void setPar_backup_id(String par_backup_id)
	{
		this.par_backup_id = par_backup_id;
	}

	public String getViol_type_id()
	{
		return viol_type_id;
	}

	public void setViol_type_id(String viol_type_id)
	{
		this.viol_type_id = viol_type_id;
	}

	public String getRecorded_date()
	{
		return recorded_date;
	}

	public void setRecorded_date(String recorded_date)
	{
		this.recorded_date = recorded_date;
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
