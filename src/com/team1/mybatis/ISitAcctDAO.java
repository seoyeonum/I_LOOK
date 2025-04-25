/*============================
	ISitAcctDAO.java
	시터 계좌 IDAO
=============================*/

package com.team1.mybatis;

import com.team1.dto.SitAcctDTO;

public interface ISitAcctDAO
{
	// [시터] 시터 계좌 열람
	public SitAcctDTO list(String sit_reg_id);
	
	// [시터] 시터 계좌 추가
	public String addAcct(SitAcctDTO acct);
	
	// [시터] 시터 계좌 수정
	public String modifyAcct(SitAcctDTO acct);
	
	// [시터] 시터 계좌 제거
	public String removeAcct(String sit_reg_id);
	
}
