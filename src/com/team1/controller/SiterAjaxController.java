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

    @RequestMapping(value = "/sitcheckid.action", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> checkId(@RequestParam("userId") String id) 
    {
    	Map<String, Object> response = new HashMap<>();
    	try
    	{
            int count = sitDao.checkId(id);		//-- checkId : 아이디로 조회
            response.put("exists", count > 0); 	//-- 조회 결과 1 이상 → exist 속성 추가(기본 false)
            									//   (true면 중복, false면 사용가능)
        }
    	catch (Exception e) {
            e.printStackTrace();
            response.put("exists", true); 		//-- 에러 발생 시에는 → 중복으로 처리
        }
        return response;
    }
}
