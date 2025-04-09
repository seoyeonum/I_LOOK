/*=========================
	ISitDAO
	- 시터 데이터 IDAO
========================*/

package com.team1.mybatis;

import java.util.ArrayList;

public interface ISitDAO
{
	// [관리자] 시터 회원 리스트
	public ArrayList<SitDTO> list();
	
	// [관리자] 전체 시터 회원 명수 확인
	public int countSit();
	
	// [관리자] 시터 회원 등록 요청 개수 확인
	public int countSitReg();
	
	// [관리자] 시터 회원 등록 요청
	public int sitReg(SitDTO dto);
	
	// [관리자] 시터 회원 승인
	public int sitChk(String sit_backup_id);
	
	// [시터] 시터 회원 정보 수정 
	public int modifySit(SitDTO sitter);
	
	// [관리자] 시터 회원 이름 검색
	public SitDTO sitNameSearch(String name);
	
	// [관리자] 시터 회원 백업 코드 검색
	public SitDTO sitSearch(String sit_backup_id);
	
	// [시터] 로그인
	public String sitLogin(String id, String pw);
	
}
