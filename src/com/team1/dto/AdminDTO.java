package com.team1.dto;

public class AdminDTO
{
	// 주소 속성 구성 -- 관리자 번호, 아이디, 비밀번호, 계좌번호, 은행명
	private String admin_reg_id, id, pw, bank_name;
	// private String admin_acct_code;
	private String acct_number;
	
	// 매출액
	private int pay_amount;
	

	// getter / setter 구성
	
	public String getAdmin_reg_id()
	{
		return admin_reg_id;
	}
	public void setAdmin_reg_id(String admin_reg_id)
	{
		this.admin_reg_id = admin_reg_id;
	}
	public String getId()
	{
		return id;
	}
	public void setId(String id)
	{
		this.id = id;
	}
	public String getPw()
	{
		return pw;
	}
	public void setPw(String pw)
	{
		this.pw = pw;
	}
	public String getBank_name()
	{
		return bank_name;
	}
	public void setBank_name(String bank_name)
	{
		this.bank_name = bank_name;
	}
	public String getAcct_number()
	{
		return acct_number;
	}
	public void setAcct_number(String acct_number)
	{
		this.acct_number = acct_number;
	}
	public int getPay_amount()
	{
		return pay_amount;
	}
	public void setPay_amount(int pay_amount)
	{
		this.pay_amount = pay_amount;
	}	

	
}

