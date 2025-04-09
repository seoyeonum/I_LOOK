/*=====================
	SitAcctDTO.java
	시터 계좌 백업 코드
	  시터 보유 계좌 코드, 시터 회원가입 코드, 은행 종류 코드
	, 계좌 번호, 예금주명, 계좌 정보 등록일시, 은행 종류
=====================*/

package com.team1.mybatis;

public class SitAcctDTO
{
	// 주요 속성 구성
	
	// 시터 보유 계좌 코드, 시터 회원가입 코드, 은행 종류 코드
	String acct_regid, sit_regid, bank_type_id;

	// 계좌 번호, 예금주명, 계좌 정보 등록일시
	String acct_number, depositor, reg_date;
	
	// 은행 종류
	String type;

	
	// getter / setter 구성
	public String getAcct_regid()
	{
		return acct_regid;
	}

	public void setAcct_regid(String acct_regid)
	{
		this.acct_regid = acct_regid;
	}

	public String getSit_regid()
	{
		return sit_regid;
	}

	public void setSit_regid(String sit_regid)
	{
		this.sit_regid = sit_regid;
	}

	public String getBank_type_id()
	{
		return bank_type_id;
	}

	public void setBank_type_id(String bank_type_id)
	{
		this.bank_type_id = bank_type_id;
	}

	public String getAcct_number()
	{
		return acct_number;
	}

	public void setAcct_number(String acct_number)
	{
		this.acct_number = acct_number;
	}

	public String getDepositor()
	{
		return depositor;
	}

	public void setDepositor(String depositor)
	{
		this.depositor = depositor;
	}

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

	
}
