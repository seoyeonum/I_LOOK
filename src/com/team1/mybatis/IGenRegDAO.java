/* ====================
 	IGenRegDAO.java
===================== */

package com.team1.mybatis;

import java.util.ArrayList;
import java.util.Map;
import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.team1.dto.GenRegDTO;

public interface IGenRegDAO
{
	// 일반 돌봄 근무 등록
	public int add(GenRegDTO gen_reg);
	
	// 일반 돌봄 근무 삭제
	public int remove(GenRegDTO gen_reg);
	
	// 시터 근무 가능 목록
	public ArrayList<GenRegDTO> list();
	
	// 전체 근무 등록 수 확인
	public int countGen();
	
	// 근무 등록 아이디에 따른 근무 파일 1개
	public GenRegDTO regList(String gen_reg_id);
	
	// 특정 아이디에 따른 근무 리스트
	public ArrayList<GenRegDTO> regListId(String gen_reg_id);
	
	// 근무 등록 아이디에 따른 근무 1건의 정보
	public GenRegDTO regOnesearch(String gen_reg_id);
	
	// (부모가 보는) 1차 필터 결과 리스트
	public ArrayList<GenRegDTO> listPrimaryGenReg(GenRegDTO gen_reg);
	
	// (부모가 보는) 1차 필터 결과 리스트 건수
	public int countPrimaryGenReg(GenRegDTO gen_reg);
	
	// (부모가 보는) 2차 필터 결과 리스트
	public ArrayList<GenRegDTO> listSecondaryGenReg(Map<String, Object> params);
	
	// (근무 등록 건별) 시터 선호 근무 지역
	public ArrayList<String> listSitPreferedRegion(String gen_reg_id);
	
	// (근무 등록 건별) 시터 선호 돌봄 연령대
	public ArrayList<String> listSitPreferedAge(String gen_reg_id);
	
	// (근무 등록 건별) 상세 근무 정보 조회
	public GenRegDTO searchGenRegDetail(String gen_reg_id);
	
	// [관리자] 시터 근무 등록 내역 조회
	public List<GenRegDTO> adminListSitGenReg(@Param("start") int start
									   , @Param("end") int end
			                           , @Param("searchKey") String searchKey
			                           , @Param("searchValue") String searchValue
			                           , @Param("currentOnly") Boolean currentOnly);
	
	// [관리자] 시터 근무 등록 내역 목록 개수 확인
	public int adminCountSitGenReg(@Param("searchKey") String searchKey
			                , @Param("searchValue") String searchValue
			                , @Param("currentOnly") Boolean currentOnly);
	
	//[관리자] 시터 근무 등록 상세내역 조회
	public GenRegDTO adminSitGenRegDetail(String gen_reg_id);

}
