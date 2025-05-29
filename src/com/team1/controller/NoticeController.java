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

		// (이전 페이지에서 건네 받은) 공지사항 코드로
		INoticeDAO noticeDao = sqlSession.getMapper(INoticeDAO.class);
		
		// 조회수를 1만큼 증가
		int num = noticeDao.increaseHit(noticeId);
		
		//if (num != 0)
		//	System.out.println("조회수 업데이트 완료");
		//else
		//	System.out.println("조회수 업데이트 실패");
		
		// 특정 게시물 정보 조회
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
	public String noticeInsertForm(HttpSession session, Model model)
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
	
	// ● 공지사항 게시물 등록
	@RequestMapping(value="/noticeinsert.action", method = RequestMethod.POST)
	public String noticeInsert(HttpSession session, Model model, NoticeDTO dto)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		AdminDTO admin = (AdminDTO) session.getAttribute("loginAdmin");
		
		if (admin == null)
			return "redirect:/iLook.action";
	
		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
		// 개행 내용 살리기
		String contentTemp = dto.getContent();
		String content = contentTemp.replace("\n", "<br>");
		dto.setContent(content);
		
		// 공지사항 등록
     	INoticeDAO noticeDao = sqlSession.getMapper(INoticeDAO.class);
     	int num = noticeDao.add(dto);
     	
     	if (num != 0)
     		System.out.println("게시물 등록 완료");
     	else
     		System.out.println("게시물 등록 실패");
        
		result = "redirect:/noticelist.action";
		
		return result;
	}
	
	// ● 공지사항 게시물 수정 페이지
	@RequestMapping(value="/noticeupdateform.action", method = RequestMethod.GET)
	public String noticeUpdateForm(HttpSession session, Model model
								 , @RequestParam("notice_id") String noticeId
								 , @RequestParam("noticeRnum") String noticeRnum)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		AdminDTO admin = (AdminDTO) session.getAttribute("loginAdmin");
		
		if (admin == null)
			return "redirect:/iLook.action";
	
		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
		// (이전 페이지에서 건네 받은) 공지사항 코드로
		// 특정 게시물 정보 조회
		INoticeDAO noticeDao = sqlSession.getMapper(INoticeDAO.class);		
		NoticeDTO noticeDetail = noticeDao.noticeDetail(noticeId);
        
		// 조회된 항목 중 게시물 본문 개행 문자 변경
		String contentTemp = noticeDetail.getContent();
		String content = contentTemp.replace("<br>", "\n");
		noticeDetail.setContent(content);
		
		// 공지사항 유형 리스트 조회
     	ArrayList<NoticeDTO> listType = noticeDao.listType();
		
		// 다음 페이지로 넘겨주는 값
		// → 특정 게시물 정보, 게시물 번호, 공지사항 유형 리스트
		model.addAttribute("noticeDetail", noticeDetail);
		model.addAttribute("noticeRnum", noticeRnum);
		model.addAttribute("listType", listType);
		
		result = "WEB-INF/view/noticeUpdateForm.jsp";
		
		return result;
	}
	
	// ● 공지사항 게시물 수정
	@RequestMapping(value="/noticeupdate.action", method = RequestMethod.POST)
	public String noticeUpdate(HttpSession session, Model model, NoticeDTO dto
			 				 , @RequestParam("notice_id") String noticeId)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		AdminDTO admin = (AdminDTO) session.getAttribute("loginAdmin");
		
		if (admin == null)
			return "redirect:/iLook.action";
	
		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
		// 개행 내용 살리기
		String contentTemp = dto.getContent();
		String content = contentTemp.replace("\n", "<br>");
		dto.setContent(content);
		
		// 게시물 식별번호 세팅
		dto.setNotice_id(noticeId);
		
		// 공지사항 수정
     	INoticeDAO noticeDao = sqlSession.getMapper(INoticeDAO.class);
     	int num = noticeDao.modify(dto);
     	
     	if (num != 0)
     		System.out.println("게시물 수정 완료");
     	else
     		System.out.println("게시물 수정 실패");
        
		result = "redirect:/noticelist.action";
		
		return result;
		
	}
	
	// ● 공지사항 게시물 삭제
	@RequestMapping(value="/noticedelete.action", method = RequestMethod.GET)
	public String noticeDelete(HttpSession session, Model model
			 				 , @RequestParam("notice_id") String noticeId)
	{
		String result = null;
		
		// 페이지 접근 권한 확인 ------------------------------------------
		AdminDTO admin = (AdminDTO) session.getAttribute("loginAdmin");
		
		if (admin == null)
			return "redirect:/iLook.action";
	
		// 접근 권한 있다면 아래 내용 순차 진행
		//----------------------------------------------------------------
		
		// 공지사항 삭제
     	INoticeDAO noticeDao = sqlSession.getMapper(INoticeDAO.class);
     	int num = noticeDao.remove(noticeId);
     	
     	if (num != 0)
     		System.out.println("게시물 삭제 완료");
     	else
     		System.out.println("게시물 삭제 실패");
        
		result = "redirect:/noticelist.action";
		
		return result;
		
	}
}