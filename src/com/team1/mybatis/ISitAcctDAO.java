/*============================
	ISitAcctDAO.java
	시터 계좌 IDAO
=============================*/

package com.team1.mybatis;

import com.team1.dto.SitAcctDTO;

public interface ISitAcctDAO
{
	// 시터 계좌 추가
	public int addAcct(SitAcctDTO acct);
	
	// 시터 계좌 수정
	public int modifyAcct(SitAcctDTO acct);
	
	// 시터 계좌 제거
	public int removeAcct(String sit_regid);
	
}
