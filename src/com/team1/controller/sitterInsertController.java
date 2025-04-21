/*===============================
    sitterInsertController.java
=============================== */

package com.team1.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.team1.mybatis.IDocRegDAO;
import com.team1.mybatis.ISitCertDAO;
import com.team1.mybatis.ISitDAO;

@Controller
public class sitterInsertController
{
	@Autowired
	private ISitDAO sitDAO;			// 시터 등록
		
	@Autowired
	private IDocRegDAO docRegDAO;	// 서류 등록
	
	@Autowired
	private ISitCertDAO sitCertDAO;	// 자격증 등록
	
}
