package com.team1.dto;
// 일반 돌봄 확정 데이터 자료형 클래스 (확정, 시터 메모, 부모 메모, 임금)

public class GenConfirmedDTO
{
	// GEN_CONFIRMED_ID, GEN_REQ_ID, CONFIRMED_DATE, PAR_READ_DATE
	// GEN_MEMOS_STI_ID, REC_DATE, CONTENT
	// GEN_MEMOS_PAR_ID, REC_DATE, CONTENT
	// GEN_WAGE_ID, WAGE, PAID_DATE, ACCT_NUMBER, BANK_NAME
	
	// 주요 속성 구성
	private String gen_confirmed_id, gen_req_id, confirmed_date, par_read_date;
	private String gen_memos_sit_id, content;
	private String gen_memos_par_id, rec_date;
	private String gen_wage_id, paid_date, acct_number, bank_name;
	private int wage;
	private int num;   // 번호 (ROWNUM)
	private String sitter_name;
	private String child_name;
	private String start_date;
	private String end_date;
	private int work_hours;  
	private String par_backup_id;
	private String child_backup_id;
	private String care_status;
	private String care_type;
	
	// getter / setter 구성
	public String getGen_confirmed_id()
	{
		return gen_confirmed_id;
	}
	public void setGen_confirmed_id(String gen_confirmed_id)
	{
		this.gen_confirmed_id = gen_confirmed_id;
	}
	public String getGen_req_id()
	{
		return gen_req_id;
	}
	public void setGen_req_id(String gen_req_id)
	{
		this.gen_req_id = gen_req_id;
	}
	public String getConfirmed_date()
	{
		return confirmed_date;
	}
	public void setConfirmed_date(String confirmed_date)
	{
		this.confirmed_date = confirmed_date;
	}
	public String getPar_read_date()
	{
		return par_read_date;
	}
	public void setPar_read_date(String par_read_date)
	{
		this.par_read_date = par_read_date;
	}
	public String getGen_memos_sit_id()
	{
		return gen_memos_sit_id;
	}
	public void setGen_memos_sit_id(String gen_memos_sit_id)
	{
		this.gen_memos_sit_id = gen_memos_sit_id;
	}
	public String getContent()
	{
		return content;
	}
	public void setContent(String content)
	{
		this.content = content;
	}
	public String getGen_memos_par_id()
	{
		return gen_memos_par_id;
	}
	public void setGen_memos_par_id(String gen_memos_par_id)
	{
		this.gen_memos_par_id = gen_memos_par_id;
	}
	public String getRec_date()
	{
		return rec_date;
	}
	public void setRec_date(String rec_date)
	{
		this.rec_date = rec_date;
	}
	public String getGen_wage_id()
	{
		return gen_wage_id;
	}
	public void setGen_wage_id(String gen_wage_id)
	{
		this.gen_wage_id = gen_wage_id;
	}
	public String getPaid_date()
	{
		return paid_date;
	}
	public void setPaid_date(String paid_date)
	{
		this.paid_date = paid_date;
	}
	public String getAcct_number()
	{
		return acct_number;
	}
	public void setAcct_number(String acct_number)
	{
		this.acct_number = acct_number;
	}
	public String getBank_name()
	{
		return bank_name;
	}
	public void setBank_name(String bank_name)
	{
		this.bank_name = bank_name;
	}
	public int getWage()
	{
		return wage;
	}
	public void setWage(int wage)
	{
		this.wage = wage;
	}
	public int getNum()
	{
		return num;
	}
	public void setNum(int num)
	{
		this.num = num;
	}
	public String getSitter_name()
	{
		return sitter_name;
	}
	public void setSitter_name(String sitter_name)
	{
		this.sitter_name = sitter_name;
	}
	public String getChild_name()
	{
		return child_name;
	}
	public void setChild_name(String child_name)
	{
		this.child_name = child_name;
	}
	public String getStart_date()
	{
		return start_date;
	}
	public void setStart_date(String start_date)
	{
		this.start_date = start_date;
	}
	public String getEnd_date()
	{
		return end_date;
	}
	public void setEnd_date(String end_date)
	{
		this.end_date = end_date;
	}
	public int getWork_hours()
	{
		return work_hours;
	}
	public void setWork_hours(int work_hours)
	{
		this.work_hours = work_hours;
	}
	public String getPar_backup_id()
	{
		return par_backup_id;
	}
	public void setPar_backup_id(String par_backup_id)
	{
		this.par_backup_id = par_backup_id;
	}
	public String getChild_backup_id()
	{
		return child_backup_id;
	}
	public void setChild_backup_id(String child_backup_id)
	{
		this.child_backup_id = child_backup_id;
	}
	public String getCare_status()
	{
		return care_status;
	}
	public void setCare_status(String care_status)
	{
		this.care_status = care_status;
	}
	public String getCare_type()
	{
		return care_type;
	}
	public void setCare_type(String care_type)
	{
		this.care_type = care_type;
	}

}
