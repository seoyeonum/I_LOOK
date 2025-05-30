package com.team1.controller;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team1.dto.AdminDTO;
import com.team1.dto.AdminMainDTO;
import com.team1.dto.NoticeDTO;
import com.team1.dto.SitDTO;
import com.team1.mybatis.IAdminDAO;
import com.team1.mybatis.IAdminMainDAO;
import com.team1.mybatis.INoticeDAO;
import com.team1.mybatis.ISitDAO;

@Controller
public class AdminMainController
{

	@Autowired
	private SqlSession sqlSession;
	
	
	// 관리자 메인페이지로 이동 및 데이터 전송
	@RequestMapping(value = "/adminmain.action", method = RequestMethod.GET)
	public String adminMain(Model model, HttpSession session)
	{
		// 관리자 검증
        if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);
        
        IAdminMainDAO dao = sqlSession.getMapper(IAdminMainDAO.class);
        ISitDAO sitDao = sqlSession.getMapper(ISitDAO.class);
        INoticeDAO noticeDao = sqlSession.getMapper(INoticeDAO.class);
        
        
        // DTO 생성
        AdminMainDTO adminMainDto = new AdminMainDTO();
        
        // 당일 회원가입, 당일 일반돌봄 수 
        adminMainDto.setCountReg(dao.countReg());
    	adminMainDto.setCountDayGenReq(dao.countDayGenReq());
        
        // 월별 일반돌봄 수
        List<Map<String, Object>> countMonthGenReq = dao.countMonthGenReq();
        
        Map<String, Integer> monthMap = new LinkedHashMap<>();
        
        // 최근 6개월 계산
        LocalDate now = LocalDate.now();
        DateTimeFormatter fmt = DateTimeFormatter.ofPattern("yyyy-MM");
        
        for (int i = 5; i >= 0; i--) 
        {
            String month = now.minusMonths(i).format(fmt); 
            monthMap.put(month, 0); 
        }
        
        // 6개월 데이터 채우기
        for (Map<String, Object> row : countMonthGenReq) 
        {
            String month = (String) row.get("REQ_MONTH");
            int count = ((BigDecimal) row.get("REQ_COUNT")).intValue();
            if (monthMap.containsKey(month))
                monthMap.put(month, count);
        }

        // 차트용 labels, data 만들기
        List<String> labels = new ArrayList<>();
        List<Integer> data = new ArrayList<>();

        for (String month : monthMap.keySet()) 
        {
            String displayMonth = month.substring(5) + "월";  
            if (displayMonth.startsWith("0"))
                displayMonth = displayMonth.substring(1);    

            labels.add("\"" + displayMonth + "\"");
            data.add(monthMap.get(month));
        }
        
        adminMainDto.setMonthLabels(labels);
        adminMainDto.setCountMonthGenReq(data);
        
        // 월간 회원가입 수
        int countMonthParReg = dao.countMonthParReg();
        int countMonthSitReg = dao.countMonthSitReg();

        model.addAttribute("countMonthParReg", countMonthParReg);
        model.addAttribute("countMonthSitReg", countMonthSitReg);
        
        // 시터 회원가입 요청 최신 5건
        List<SitDTO> listSitRecent = sitDao.listSitRegRecent();
        
        model.addAttribute("listSitRecent", listSitRecent);
        
        // 공지사항 5건
        List<NoticeDTO> noticeList = noticeDao.listNoticeLately();
        
        // 월간 매출액
        int monthPayment = dao.MonthPayment();
        
        model.addAttribute("monthPayment", monthPayment);
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("adminMainDTO", adminMainDto);
        
		return "WEB-INF/view/adminMain.jsp";
	}		
	
	// 관리자 마이페이지로 이동 및 데이터 전송
	@RequestMapping(value = "/admininfo.action", method = RequestMethod.GET)
	public String adminInfo(Model model, HttpSession session)
	{
		String result = null;
		
		if (!isAdmin(session))
        	return "redirect:/loginform.action";
        AdminDTO dto = getLoginAdmin(session);
        model.addAttribute("loginAdmin", dto);
		
		IAdminDAO admin = sqlSession.getMapper(IAdminDAO.class);
		
		model.addAttribute("admin", admin.list());
		result = "WEB-INF/view/adminInfo.jsp";
		
		return result;
	}
	
	// 관리자 검증 메소드
	private boolean isAdmin(HttpSession session)
    {
        return session.getAttribute("loginAdmin") != null;
    }
    private AdminDTO getLoginAdmin(HttpSession session)
    {
        return (AdminDTO) session.getAttribute("loginAdmin");
    }
	
}
