package com.team1.mybatis;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.team1.dto.AdminDTO;

public interface IAdminMainDAO
{
	  // 관리자 관련
    public ArrayList<AdminDTO> list();
    public int update(AdminDTO admin);
    public AdminDTO search(String admin_reg_id);

    // 통계 관련
    public int countReg();
    public int countDayGenReq();
    
    // 월간 시터/부모 회원가입 수
    public int countMonthParReg();
    public int countMonthSitReg();

    // 월별 일반 예약 건수
    public List<Map<String, Object>> countMonthGenReq();
	
    // 월간 매출액
    public int MonthPayment();
}
