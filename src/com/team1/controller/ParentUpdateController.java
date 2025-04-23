package com.team1.controller;

import javax.servlet.http.HttpSession;
import com.team1.dto.ParDTO;
import com.team1.dto.ParWithdrawedDTO;
import com.team1.mybatis.IParDAO;
import com.team1.mybatis.IParWithdrawedDAO;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import java.util.ArrayList;

@Controller
public class ParentUpdateController
{
	@Autowired
	private SqlSession sqlSession;

	// ▶ 부모 정보 조회 (수정 폼)
	@RequestMapping(value = "/parentupdateform.action", method = RequestMethod.GET)
	public String parentUpdateForm(HttpSession session, Model model)
	{
		// 로그인 부모 정보 확인
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		if (parent == null)
			return "redirect:/loginform.action";

		IParDAO dao = sqlSession.getMapper(IParDAO.class);
		ParDTO parentInfo = dao.search(parent.getPar_backup_id());
		model.addAttribute("parent", parentInfo);

		// ✅ 탈퇴 사유 목록 추가 (여기만 추가)
		IParWithdrawedDAO withdrawedDao = sqlSession.getMapper(IParWithdrawedDAO.class);
		ArrayList<ParWithdrawedDTO> withdrawReasons = withdrawedDao.list();
		model.addAttribute("withdrawReasons", withdrawReasons);

		return "/WEB-INF/view/ParentUpdateForm.jsp";
	}

	// ▶ 부모 정보 수정 처리
	@RequestMapping(value = "/parentupdate.action", method = RequestMethod.POST)
	public String parentUpdate(ParDTO parent, HttpSession session, Model model)
	{
		IParDAO dao = sqlSession.getMapper(IParDAO.class);
		dao.update(parent); // update 메서드 사용

		// 수정된 정보 재조회
		ParDTO updatedParent = dao.search(parent.getPar_backup_id());
		model.addAttribute("parent", updatedParent);
		model.addAttribute("updated", true); // 수정 완료 시 알림 표시

		// ✅ 수정 시에도 탈퇴 사유 목록 유지
		IParWithdrawedDAO withdrawedDao = sqlSession.getMapper(IParWithdrawedDAO.class);
		ArrayList<ParWithdrawedDTO> withdrawReasons = withdrawedDao.list();
		model.addAttribute("withdrawReasons", withdrawReasons);

		return "/WEB-INF/view/ParentUpdateForm.jsp";
	}

	// ▶ 부모 회원 탈퇴 처리
	@RequestMapping(value = "/parentwithdraw.action", method = RequestMethod.GET)
	public String parentWithdraw(HttpSession session, String reason_withdrawed_id)
	{
		// 1. 로그인 부모 세션 확인
		ParDTO parent = (ParDTO) session.getAttribute("loginParent");
		if (parent == null)
			return "redirect:/loginform.action";

		// 2. 탈퇴 테이블에 insert (탈퇴 이력 기록)
		IParWithdrawedDAO withdrawedDao = sqlSession.getMapper(IParWithdrawedDAO.class);
		ParWithdrawedDTO withdrawed = new ParWithdrawedDTO();
		withdrawed.setPar_backup_id(parent.getPar_backup_id());
		withdrawed.setReason_withdrawed_id(reason_withdrawed_id);
		withdrawedDao.add(withdrawed);

		// 3. 부모 회원 정보 delete (PAR_REG에서 삭제 → 로그인 불가 처리)
		IParDAO dao = sqlSession.getMapper(IParDAO.class);
		dao.delete(parent.getPar_backup_id());

		// 4. 세션 비우기 (로그아웃 처리)
		session.invalidate();

		// 5. 로그인 페이지로 이동 + 탈퇴 완료 메시지 전달
		return "redirect:/login.action?message=탈퇴가 완료되었습니다.";
	}

}
