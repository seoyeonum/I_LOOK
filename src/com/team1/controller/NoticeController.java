/*=============================
	NoticeController
=============================*/

package com.team1.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.team1.dto.AdminDTO;
import com.team1.dto.NoticeDTO;
import com.team1.dto.ParDTO;
import com.team1.dto.SitDTO;
import com.team1.mybatis.INoticeDAO;
import com.team1.util.PageHandler;


@Controller
public class NoticeController
{
	
	@Autowired
	private SqlSession sqlSession;
	
	// ● 공지사항 리스트 페이지
	@RequestMapping(value="/noticelist.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String noitceList(@RequestParam(value = "page", defaultValue="1") int page
						   , HttpSession session, Model model)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
		AdminDTO admin = (AdminDTO) session.getAttribute("loginAdmin");
		
		if (parent == null && sitter == null && admin == null)
			return "redirect:/iLook.action";

		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------

		// 공지사항 게시물 수
		INoticeDAO noticeDao = sqlSession.getMapper(INoticeDAO.class);
		int countNotice = noticeDao.count();
		
		// 페이징 객체 생성
	    PageHandler paging = new PageHandler(page, countNotice);
	    
	    // dto 에 페이징 정보 추가
	    NoticeDTO dto = new NoticeDTO();
	    dto.setStart(paging.getStart());
	    dto.setEnd(paging.getEnd());
	    
	    // 공지사항 게시물 리스트
	    ArrayList<NoticeDTO> listNotice = new ArrayList<NoticeDTO>();
	    listNotice = noticeDao.listNotice(dto);
		
		// 다음 페이지로 넘겨주는 값
		// → 공지사항 게시물 리스트, 게시물 수, 페이징 객체
		model.addAttribute("listNotice", listNotice);
		model.addAttribute("countNotice", countNotice);
		model.addAttribute("paging", paging);
				
		// → 헤더 import 를 위한 값
		model.addAttribute("parent", parent);
		model.addAttribute("sitter", sitter);
		model.addAttribute("admin", admin);
		
		result = "WEB-INF/view/noticeList.jsp";
		
		return result;
	}
	
	// ● 공지사항 게시물 상세 페이지
	@RequestMapping(value="/noticedetail.action", method = RequestMethod.GET)
	public String noticeDetail(@RequestParam("noticeId") String noticeId
							 , @RequestParam("noticeRnum") String noticeRnum
						  	 , HttpSession session, Model model)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		SitDTO sitter = (SitDTO) session.getAttribute("loginSitter");
		AdminDTO admin = (AdminDTO) session.getAttribute("loginAdmin");
		
		if (parent == null && sitter == null && admin == null)
			return "redirect:/iLook.action";

		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------

		// (이전 페이지에서 건네 받은) 공지사항 코드로 특정 게시물 정보 조회
		INoticeDAO noticeDao = sqlSession.getMapper(INoticeDAO.class);
		NoticeDTO noticeDetail = noticeDao.noticeDetail(noticeId);
		
		// 다음 페이지로 넘겨주는 값
		// → 특정 게시물 정보, 게시물 번호
		model.addAttribute("noticeDetail", noticeDetail);
		model.addAttribute("noticeRnum", noticeRnum);
		
		// → 헤더 import 를 위한 값
		model.addAttribute("parent", parent);
		model.addAttribute("sitter", sitter);
		model.addAttribute("admin", admin);
		
		result = "WEB-INF/view/noticeDetail.jsp";
		
		return result;
	}
	
	// ● 공지사항 게시물 등록 페이지
	@RequestMapping(value="/noticeinsertform.action", method = RequestMethod.GET)
	public String noticeInsertForm( HttpSession session, Model model)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		AdminDTO admin = (AdminDTO) session.getAttribute("loginAdmin");
		
		if (admin == null)
			return "redirect:/iLook.action";
	
		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
		// 오늘 날짜 가져오기
        Calendar calendar = Calendar.getInstance();
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String today = dateFormat.format(calendar.getTime());
        
        // 확인
        //System.out.println("오늘 날짜: " + today);
        
        // 공지사항 유형 리스트 조회
     	INoticeDAO noticeDao = sqlSession.getMapper(INoticeDAO.class);
     	ArrayList<NoticeDTO> listType = noticeDao.listType();
        
		// 다음 페이지로 넘겨주는 값
		// → 오늘 날짜, 공지사항 유형 리스트
		model.addAttribute("today", today);		
		model.addAttribute("listType", listType);		
		
		result = "WEB-INF/view/noticeInsertForm.jsp";
		
		return result;
	}
}