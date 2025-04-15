/*==========================
	ISitCertDAO.java
	- 자격증 IDAO
===========================*/

package com.team1.mybatis;

<<<<<<< HEAD
=======
import java.util.ArrayList;

>>>>>>> origin/develop
import com.team1.dto.SitCertDTO;

public interface ISitCertDAO
{
<<<<<<< HEAD
=======
	// [시터] 자격증 열람
	public ArrayList<SitCertDTO> list(String sit_reg_id);
	
>>>>>>> origin/develop
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
}
