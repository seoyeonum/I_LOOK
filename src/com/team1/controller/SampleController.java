/*==============================
 	SampleController.java
 	- 사용자 정의 컨트롤러
 =============================*/
package com.team1.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.Controller;

// ※ Spring 의 『Controller』 인터페이스를 구현하는 방법을 통해
// 사용자 정의 컨트롤러 클래스를 구성한다.

public class SampleController implements Controller
{

	@Override
	public ModelAndView handleRequest(HttpServletRequest request, HttpServletResponse response) throws Exception
	{
		// Controller 가 수행해야 할 액션코드
		
		ModelAndView mav = new ModelAndView();
		
		return mav;
	}
}
