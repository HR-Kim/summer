package com.summer.agecompare.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.google.gson.Gson;
import com.summer.agecompare.domain.Agecompare;
import com.summer.agecompare.service.AgecompareService;

@Controller
public class AgecompareController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AgecompareService agecompareService;
	
	/**
	 * 단건조회
	 * @param user
	 * @return json
	 * @throws SQLException
	 */
	@RequestMapping(value="/agecompare/doSelectOne.do", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String get(Agecompare agecompare, Model model) throws SQLException {
		
		
		log.debug("1=doSelectOne.do===============");
		
		if(null == agecompare.getUserId()) {
			agecompare.setUserId("Un knwon Id");
		}
		
		Agecompare outVO = agecompareService.get(agecompare);
		log.debug("=3=doSelectOne.do=outVO="+outVO.toString());
		log.debug("============================");
		//model.addAttribute("userVO", outVO);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(outVO);
		
		log.debug("=jsonStr="+jsonStr);
		
		return jsonStr;
	}
}
