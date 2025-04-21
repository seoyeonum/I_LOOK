/*=====================
	ISitRejectDAO
	- 시터 승인 거절 DAO 인터페이스
=====================*/

package com.team1.mybatis;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team1.dto.SitRejectDTO;

public interface ISitRejectDAO
{
	// [관리자] 승인 거절 내역 리스트 확인
	public List<SitRejectDTO> listSitRej(@Param("start") int start
											, @Param("end") int end
											, @Param("searchKey") String searchKey
				                            , @Param("searchValue") String searchValue);
	// [관리자] 승인 거절 명수 확인
	public int countSitRej(String searchKey, String searchValue);
	
	// [관리자] 승인 거절
	public int rejectSit(SitRejectDTO rejectDto);
	
	// 거절 사유 리스트 조회
	public List<SitRejectDTO> listRejectedReasons();

	
	// 시터 백업코드로 거절내역 조회
	public SitRejectDTO searchRejectedReasonsList(String sit_backup_id);
	
	
	
}
