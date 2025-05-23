/*==========================
	ISitCertDAO.java
	- 자격증 IDAO
===========================*/

package com.team1.mybatis;

import java.util.ArrayList;
import java.util.List;

import com.team1.dto.SitCertDTO;

public interface ISitCertDAO
{
	// [시터] 자격증 범례 열람
	public ArrayList<SitCertDTO> listCertType();

	// [시터] 자격증 열람
	public List<SitCertDTO> search(String sit_backup_id);
	
	// [시터] 자격증 등록
	public int addCert(SitCertDTO sitcert);
	
	// [시터] 자격증 수정
	public int modifyCert(SitCertDTO sitcert);
	
	// [시터] 자격증 삭제
	public int removeCert(String sit_reg_id);
	
	// [시터] 자격증 개수 확인
	public int countCert(String sit_reg_id);
	
	// [시터] 자격증 테이블 찾기
	public SitCertDTO searchCert(String sit_reg_id);
	
	// (시터 백업 코드로) 시터 보유 자격증 리스트
	public ArrayList<String> listSitCert (String sit_backup_id);
}
