/* =============================
	membershipController.java
   ============================= */

package com.team1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class MembershipController 
{
	// 회원 유형 선택 페이지로 이동
	@RequestMapping(value = "/membership.action", method = RequestMethod.GET)
	public String showMembershipPage() {
		return "WEB-INF/view/Member.jsp";  // 회원 유형 선택 페이지를 보여줌
	}
	
	// 회원 유형에 따라 부모 회원가입 폼으로 이동
	@RequestMapping(value = "/parentInsertForm.action", method = RequestMethod.GET)
	public String showParentInsertForm() {
		return "WEB-INF/view/parentInsertForm.jsp";  // 부모 회원가입 폼 페이지
	}
	
	// 회원 유형에 따라 시터 회원가입 폼으로 이동
	@RequestMapping(value = "/sitterInsertForm.action", method = RequestMethod.GET)
	public String showSitterInsertForm() {
		return "WEB-INF/view/sitterInsertForm.jsp";  // 시터 회원가입 폼 페이지
	}
}

/*
public class membershipController {
	
	// 회원 유형 선택 페이지로 이동
	@RequestMapping(value = "/membership.action", method = RequestMethod.GET)
	public String showMembershipPage() {
		return "Member.jsp";  // 회원 유형 선택 페이지를 보여줌
	}
	
	// 회원 유형에 따라 부모 회원가입 폼으로 이동
	@RequestMapping(value = "/parentInsertForm.action", method = RequestMethod.GET)
	public String showParentInsertForm() {
		return "parentInsertForm.jsp";  // 부모 회원가입 폼 페이지
	}
	
	// 회원 유형에 따라 시터 회원가입 폼으로 이동
	@RequestMapping(value = "/sitterInsertForm.action", method = RequestMethod.GET)
	public String showSitterInsertForm() {
		return "sitterInsertForm.jsp";  // 시터 회원가입 폼 페이지
	}
 * package com.team1.controller;
 * 
 * import org.springframework.stereotype.Controller; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RequestMethod;
 * 
 * @Controller public class membershipController {
 * 
 * @RequestMapping(value = "/membership.action", method = RequestMethod.GET)
 * public String membership() { return "login.jsp"; } }
 */
