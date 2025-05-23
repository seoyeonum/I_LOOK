/*=============================
	IWorkRegionPreferedDAO
	시터 선호 근무 지역 IDAO
==============================*/

package com.team1.mybatis;

import java.util.ArrayList;
import com.team1.dto.WorkRegionPreferedDTO;

public interface IWorkRegionPreferedDAO
{
	// 시터가 선택한 근무 지역의 근무 지역 열람
	public WorkRegionPreferedDTO listRegions(String gen_reg_id);
	
	// [시터] 근무 등록 아이디로, 그 근무 1건의 선호 지역을 보는 쿼리
	public WorkRegionPreferedDTO sitRegion(String gen_reg_id);
	
	// 근무 지역 전체 열람
	public ArrayList<WorkRegionPreferedDTO> listAllRegions();
	
	// 근무 지역 추가
	public int addRegions(WorkRegionPreferedDTO regions);

	// 시터가 근무 등록 때 근무 지역 수정
	public int modifyRegions(WorkRegionPreferedDTO regions);

	// 시터가 근무 등록 때 근무 지역 삭제
	public int removeRegions(String gen_reg_id);
	 

}
