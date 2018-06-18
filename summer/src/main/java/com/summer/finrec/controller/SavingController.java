package com.summer.finrec.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.summer.comm.StringUtil;
import com.summer.finrec.comm.FinSavingSearchVO;
import com.summer.finrec.domain.FinSavingVO;
import com.summer.finrec.service.SavingService;
import com.summer.finrec.service.SavingServiceImple;

@Controller
public class SavingController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	public SavingService service = new SavingServiceImple();
	
	//finrec/saving/doSelectList.do
	@RequestMapping(value="/finrec/saving/doSelectList.do",
			method=RequestMethod.GET)
	public String getSelectList(FinSavingSearchVO vo, Model model) {
		
		log.debug("1.selectList======");
		vo.setPageNum((StringUtil.nvl(vo.getPageNum(), "1")));
		vo.setPageSize(StringUtil.nvl(vo.getPageSize(), "10"));
		
		log.debug("2.FinSavingSearchVO="+vo.toString());
		List<FinSavingVO> list = service.getSelectList(vo);
//		List<String> list = new ArrayList<String>();
		
		log.debug("3.list = ");
		
		int totalCnt = 0;
		if(null != list && list.size() > 0) {
			//totalCnt = Integer.parseInt(list.get(0).getTotalCnt());
			log.debug("4.totalCnt = " + totalCnt);
		}
		
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("list",list);
		model.addAttribute("finSavingSearchVO",vo);	
		
		return "finrec/savingSearchList";
		
	}
	
	//finrec/saving/doSelectOne.do
	@RequestMapping(value="/finrec/saving/doSelectOne.do",
			method=RequestMethod.GET)
	public String getSelectOne(String finProduct, Model model) {
		log.debug("1.doSearchOne.do===");
		
		String outData = "";
		//outData = service.get(finProduct);
		
		log.debug("3.doSearchOne.outData=" + outData);
		
		model.addAttribute("outData",outData);
		return "finrec/savingDetailView";
		}
}
