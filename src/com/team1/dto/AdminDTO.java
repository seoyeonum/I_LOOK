package com.team1.dto;

public class AdminDTO
{
	// 주소 속성 구성 -- 관리자 번호, 아이디, 비밀번호, 계좌번호, 은행명
	private String admin_reg_id, id, pw, admin_acct_code, bank_name;
	

	
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

	public String getAdmin_acct_code()
	{
		return admin_acct_code;
	}

	public void setAdmin_acct_code(String admin_acct_code)
	{
		this.admin_acct_code = admin_acct_code;
	}

	public String getBank_name()
	{
		return bank_name;
	}

	public void setBank_name(String bank_name)
	{
		this.bank_name = bank_name;
	}
	
}

