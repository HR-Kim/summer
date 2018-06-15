package com.summer.finrec.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HouseLoanController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	//finrec/houseloan/doSelectList.do
	@RequestMapping(value="/finrec/houseLoan/doSelectList.do",
			method=RequestMethod.GET)
	public String getSelectList( ) {return "finrec/houseLoanSearchList";}
	
	//finrec/houseloan/doSelectOne.do	
	@RequestMapping(value="/finrec/houseloan/doSelectOne.do",
			method=RequestMethod.GET)
	public String getSelectOne(String finProduct, Model model) {
		log.debug("1.doSearchOne.do===");
		
		String outData = "";
		//outData = service.get(finProduct);
		
		log.debug("3.doSearchOne.outData=" + outData);
		
		model.addAttribute("outData",outData);
		return "finrec/houseLoanDetailView";
		}
}
