/* =============================
	LoginController.java
   ============================= */

package com.team1.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@Controller
public class LoginController
{
    // 통합 로그인 처리
    @RequestMapping(value = "/login.action", method = RequestMethod.POST)
    public void loginRedirect(HttpServletRequest request, HttpServletResponse response) throws Exception
    {
        String userType = request.getParameter("userType");
		/* String id = request.getParameter("id"); */
        String pw = request.getParameter("pw");
        String id = request.getParameter("id");

        String redirectUrl = "";

        switch (userType)
        {
            case "admin":
                redirectUrl = "adminlogin.action";
                break;
            case "parent":
                redirectUrl = "parentlogin.action";
                break;
            case "sitter":
                redirectUrl = "sitterlogin.action";
                break;
            default:
                response.sendRedirect("login.action?error=1");
                return;
        }

        // 요청 전달
        request.getRequestDispatcher(redirectUrl).forward(request, response);
    }
    
    @RequestMapping(value = "iLook.action", method = RequestMethod.GET) 
    public String iLookRedirect(Model model) throws Exception
    {
    	String result = "";
    	
    	result = "WEB-INF/view/logIn.jsp";
    	
    	return result;
    }
}
