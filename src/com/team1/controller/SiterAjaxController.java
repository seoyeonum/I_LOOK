package com.team1.controller;

import com.team1.mybatis.ISitDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Controller
public class SiterAjaxController
{
    @Autowired
    private ISitDAO sitDao;

    @RequestMapping(value = "/SitcheckId.action", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, String> checkId(@RequestParam("userId") String id) 
    {
    	Map<String, String> response = new HashMap<>();
        try {
            int count = sitDao.checkId(id);
            if (count > 0) {
                response.put("status", "duplicate");
                response.put("message", "이미 사용 중인 아이디입니다.");
            } else {
                response.put("status", "available");
                response.put("message", "사용 가능한 아이디입니다.");
            }
        } catch (Exception e) {
            response.put("status", "error");
            response.put("message", "서버 오류가 발생했습니다.");
        }
        return response;
    }
}
