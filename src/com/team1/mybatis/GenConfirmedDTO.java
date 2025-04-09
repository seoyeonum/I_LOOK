package com.team1.mybatis;
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
	
}
