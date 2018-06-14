package com.summer.finrec.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class SavingController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	//finrec/saving/doSelectList.do
	@RequestMapping(value="/finrec/saving/doSelectList.do",
			method=RequestMethod.GET)
	public String getSelectList( ) {return "finrec/savingSearchList";}
	
	//finrec/saving/doSelectOne.do
	public String getSelectOne() {return "";}
}
