/*=============================
    parentInsertController.java
============================= */

package com.team1.controller;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.team1.dto.ParDTO;
import com.team1.mybatis.IParDAO;

@Controller
public class ParentInsertController
{
	@Autowired 
	private SqlSession sqlSession;
	
	@Transactional
	@RequestMapping(value = "/parentInsert.action", method = RequestMethod.POST)
	public String parentInsert(ParDTO parent, Model model)
	{
		IParDAO dao = sqlSession.getMapper(IParDAO.class);
		System.out.println("들어오고 있는지");
		// 1. 백업 테이블 insert (par_backup_id 자동 생성)
		dao.addBackup(parent);
		System.out.println("생성된 par_backup_id : " + parent.getPar_backup_id());
		// 2. 부모 등록 테이블 insert (par_reg_id 생성, par_backup_id 조회)
		dao.add(parent);
		
		// 3. 성공 후 로그인 페이지로 이동
		return "redirect:/iLook.action?parentinsert=success";
	}
	
	/*
	 * // 부모 회원가입 폼 페이지 (GET)
	 * 
	 * @RequestMapping(value = "/parentInsertForm.action", method =
	 * RequestMethod.GET) public String showParentInsertForm() { return
	 * "parentInsertForm.jsp"; // 회원가입 폼을 보여주는 jsp 페이지 반환 }
	 */
	
}

/*
 * @Autowired private SqlSession sqlSession;
 * 
 * @Transactional // 부모 회원가입 처리 후 로그인 페이지로
 * 
 * @RequestMapping(value = "/parentInsert.action", method = RequestMethod.POST)
 * public String parentInsert(ParDTO parent , Model model) { IParDAO dao =
 * sqlSession.getMapper(IParDAO.class);
 * 
 * System.out.println("우앙"); // 1. 백업 정보 등록 dao.addBackup(parent);
 * 
 * // 2. 백업 ID 조회
 * 
 * String backupId = dao.search(parent.getId());
 * parent.setPar_backup_id(backupId);
 * 
 * 
 * // 3. PAR_REG_ID 생성 예시 (시퀀스 또는 랜덤) //String regId = "PREG" +
 * String.format("%04d", (int)(Math.random() * 10000));
 * //parent.setPar_reg_id(regId); // 4. 부모 회원 등록 dao.add(parent);
 * 
 * System.out.println("ID = " + parent.getId()); // null 이면 바인딩 문제 // 5. 로그인
 * 페이지로 리다이렉트 return "redirect:/login.action"; }
 */
/*
 * @RequestMapping(value = "/parentInsert.action", method = RequestMethod.POST)
 * public String parentInsert(ParDTO parent, Model model, HttpServletRequest
 * request) { IParDAO dao = sqlSession.getMapper(IParDAO.class);
 * 
 * // 아이디 필수 체크 if (parent.getPar_reg_id() == null ||
 * parent.getPar_reg_id().trim().isEmpty()) { model.addAttribute("error",
 * "아이디는 필수입니다."); return "parentInsertForm"; }
 * 
 * // 우편번호 기본값 처리 (널 또는 0) if (parent.getZip_code() == 0) {
 * parent.setZip_code(0); }
 * 
 * // 아이디 중복 체크 if (dao.checkId(parent.getPar_reg_id()) > 0) {
 * model.addAttribute("error", "이미 존재하는 아이디입니다."); return "parentInsertForm"; },
 * <?xml version="1.0" encoding="UTF-8" ?> /*
 * 
 * @RequestMapping(value = "/parentInsert.action", method = RequestMethod.POST)
 * public String parentInsert(ParDTO parent, Model model, HttpServletRequest
 * request) { IParDAO dao = sqlSession.getMapper(IParDAO.class);
 * 
 * // 아이디 필수 체크 if (parent.getPar_reg_id() == null ||
 * parent.getPar_reg_id().trim().isEmpty()) { model.addAttribute("error",
 * "아이디는 필수입니다."); return "parentInsertForm"; }
 * 
 * // 우편번호 기본값 처리 (널 또는 0) if (parent.getZip_code() == 0) {
 * parent.setZip_code(0); }
 * 
 * // 아이디 중복 체크 if (dao.checkId(parent.getPar_reg_id()) > 0) {
 * model.addAttribute("error", "이미 존재하는 아이디입니다."); return "parentInsertForm"; }
 * 
 * // 회원가입 진행 int result = dao.add(parent);
 * 
 * if (result > 0) { return "redirect:/login.action"; } else {
 * model.addAttribute("error", "회원가입 실패. 다시 시도해주세요."); return "Membership"; }
 * 
 * }
 */
