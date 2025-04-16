/* =============================
	LoginController.java
   ============================= */

package com.team1.controller;

import org.springframework.stereotype.Controller;
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
    	System.out.println("후와");
        String userType = request.getParameter("userType");
        String id = request.getParameter("id");
        String pw = request.getParameter("pw");

        String redirectUrl = "";
        
        System.out.println("와이");

        switch (userType)
        {
            case "admin":
                redirectUrl = "/adminlogin.action";
                break;
            case "parent":
                redirectUrl = "/parentlogin.action";
                break;
            case "sitter":
                redirectUrl = "/sitterlogin.action";
                break;
            default:
                response.sendRedirect("loginform.action?error=1");
                return;
        }

        // 요청 전달
        request.getRequestDispatcher(redirectUrl).forward(request, response);
    }
}
