/*=====================
	ISitRejectDAO
	- 시터 승인 거절 DAO 인터페이스
=====================*/

package com.team1.mybatis;

import java.util.ArrayList;

public interface ISitRejectDAO
{
	// [관리자] 승인 거절 내역 리스트 확인
	public ArrayList<SitRejectDTO> listSitRej();
	
	// [관리자] 승인 거절 사유 확인
	public ArrayList<SitRejectDTO> listReason();
	
	// [관리자] 승인 거절 명수 확인
	public int countSitRej();
	
	// [관리자] 승인 거절
	public int rejectSit(String sit_backup_id);
}
