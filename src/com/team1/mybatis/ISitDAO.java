/*=========================
	ISitDAO
	- 시터 데이터 IDAO
========================*/

package com.team1.mybatis;

import java.util.ArrayList;
import java.util.List;
import org.apache.ibatis.annotations.Param;


import com.team1.dto.SitDTO;

public interface ISitDAO
{
	// [관리자] 시터 회원 리스트
	public ArrayList<SitDTO> list();
	
	// [관리자] 시터 회원가입 요청 목록
	public List<SitDTO> listSitReg(@Param("start") int start
								 , @Param("end") int end
	                             , @Param("searchKey") String searchKey
	                             , @Param("searchValue") String searchValue);
	
	// [관리자] 시터 회원 등록 요청 개수 확인
	public int countSitReg(@Param("searchKey") String searchKey
			             , @Param("searchValue") String searchValue);
	
	// [관리자] 전체 시터 회원 명수 확인
	public int countSit();
	
	// 시터 회원가입 요청 코드로 상세정보 조회
	public SitDTO searchSitDetail(String sit_reg_id);
	
	// [관리자] 시터 회원 등록 요청
	public int sitReg(SitDTO dto);
	
	// [관리자] 시터 회원 승인
	public int sitChk(String sit_backup_id);
	
	// [시터] 시터 회원 정보 수정 
	public int modifySit(SitDTO sitter);
	
	// [관리자] 시터 회원 백업 코드 검색
	public SitDTO sitSearch(String sit_backup_id);
	
	// [시터] 로그인
	public String sitLogin(String id, String pw);
	
	// [시터] 백업 아이디로 자기 정보 찾기
	public SitDTO sitIdSearch(String sit_backup_id);
	
	// [시터] 자기 등급 찾기
	public SitDTO searchGrades(String sit_backup_id);
	
	// [시터] 자기 등급 이름을 넣고 승급 시간 계산.
	public int searchNextTime(String grade);
	
	// [시터] 백업 아이디로 자신의 평균 점수 찾기
	public int searchRating(String sit_backup_id);
	
	// [시터 혹은 관리자] 백업 코드로 자신의 평균 점수 찾기
	public int searchBupRating(String sit_backup_id);
	
	// [시터] 백업 아이디로 자신의 최근 3개월 평균 점수 찾기
	public int searchM3Rating(String sit_backup_id);
	
	// [시터가 그동안 맡은 일반 돌봄 서비스 수
	public int genCareCount(String sit_backup_id);
	
	// [시터가 그동안 맡은 긴급 돌봄 서비스 수
	public int emgCareCount(String sit_backup_id);
	
	// [시터 회원가입 ▶ 백업코드 insert]
	public int addBackup(SitDTO sitter);
	
	// [시터 회원가입 ▶ 회원 등록]
	public int add(SitDTO sitter);
	
	// [시터 회원 가입 중복 체크 중복 체크
	public int checkId(String sit_reg_id);

}
