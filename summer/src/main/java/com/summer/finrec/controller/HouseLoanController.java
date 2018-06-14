package com.summer.finrec.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

public class HouseLoanController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	//finrec/houseLoan/doSelectList.do
	@RequestMapping(value="/finrec/houseLoan/doSelectList.do",
			method=RequestMethod.GET)
	public String getSelectList( ) {return "finrec/houseLoanSearchList";}
	
	//finrec/houseLoan/doSelectOne.do
	public String getSelectOne() {return "";}
}
