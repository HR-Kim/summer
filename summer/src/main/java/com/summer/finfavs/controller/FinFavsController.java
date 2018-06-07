package com.summer.finfavs.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.summer.comm.MessageVO;
import com.summer.finfavs.domain.FinFavs;
import com.summer.finfavs.service.FinFavsService;

//@Controller
public class FinFavsController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
//	@Autowired
	private FinFavsService finFavsService;
	
	/**
	 * 단건 등록
	 * @param finFavs
	 * @throws Exception
	 */

//	@RequestMapping(value="/fin/doAdd.do"
//											   ,method=RequestMethod.POST
//											   ,produces="application/json;charset=UTF-8")
//	@ResponseBody
	public String add(FinFavs finFavs) throws Exception {
		log.debug("1. add==============");
		Gson gson = new Gson();
		
		MessageVO messageVO = new MessageVO();
		
		//화면 validation : TODO
		
		return "";
		
	}
	

}
