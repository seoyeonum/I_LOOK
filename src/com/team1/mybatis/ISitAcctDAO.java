/*============================
	ISitAcctDAO.java
	시터 계좌 IDAO
=============================*/

package com.team1.mybatis;

<<<<<<< HEAD
=======
import java.util.ArrayList;

>>>>>>> origin/develop
import com.team1.dto.SitAcctDTO;

public interface ISitAcctDAO
{
<<<<<<< HEAD
=======
	// 시터 계좌 열람
	public ArrayList<SitAcctDTO> list(String sit_regid);
	
>>>>>>> origin/develop
	// 시터 계좌 추가
	public int addAcct(SitAcctDTO acct);
	
	// 시터 계좌 수정
	public int modifyAcct(SitAcctDTO acct);
	
	// 시터 계좌 제거
	public int removeAcct(String sit_regid);
	
}
