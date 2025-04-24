package com.team1.controller;

import com.team1.mybatis.ISitLoginDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import java.io.IOException;
import javax.servlet.http.HttpServletResponse;

@Controller
public class SiterAjaxController
{
    @Autowired
    private ISitLoginDAO sitLoginDao;

    @RequestMapping(value = "/sitcheckid.action", method = RequestMethod.GET)
    public void checkId(@RequestParam("userId") String id, HttpServletResponse response) throws IOException 
    {
        // 응답 형식 설정
        response.setContentType("text/plain;charset=UTF-8");
        
        try
        {
            int count = sitLoginDao.checkId(id);
            
            // 간단한 텍스트 응답으로 결과 전송
            //-- 200(요청성공), 400(잘못된 요청), 404(리소스를 찾을 수 없음), 500(서버 내부 오류)
            
            if (count > 0)										//-- 중복 아이디 존재 시
            {
            	response.setStatus(200);
                response.getWriter().write("duplicate");		//-- 응답 데이터에 "duplicate"
            }
            else												//-- 중복 아이디 없을 시
            {
            	response.setStatus(200);
                response.getWriter().write("available");		//-- 응답 데이터에 "available"
            }
        }
        catch (Exception e)
        {
            e.printStackTrace();
            response.setStatus(500);
            response.getWriter().write("error");
        }
    }
}
