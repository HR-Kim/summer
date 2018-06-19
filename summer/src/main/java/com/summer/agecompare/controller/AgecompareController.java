package com.summer.agecompare.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
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
import com.summer.comm.StringUtil;
import com.summer.comm.SearchVO;
import com.summer.agecompare.domain.Agecompare;
import com.summer.agecompare.service.AgecompareService;

@Controller
public class AgecompareController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AgecompareService agecompareService;
		
	@RequestMapping(value="/agecompare/do_selectAgeList.do", method=RequestMethod.GET)
	public String getSelectAgeList(SearchVO vo, Model model) throws SQLException {
		vo.setSearchDiv(StringUtil.nvl(vo.getSearchDiv(),"10"));
		vo.setSearchWord(StringUtil.nvl(vo.getSearchWord(),"20"));
		vo.setPageNum(StringUtil.nvl(vo.getPageNum(), "20180424"));
		vo.setPageSize(StringUtil.nvl(vo.getPageSize(), "20180610"));
				
		List<Agecompare> list = agecompareService.getSelectAgeList(vo);
		
		int totalCnt = 0;
		String listsize = list.size()+"";
			
		String dataList = "";
		dataList +="['asd','as','bsd'],";
		for(int i=0; i<list.size(); i++) {
			dataList += "['"+list.get(i).getaDate()+"',"+list.get(i).getTradeTotal()+","
							+list.get(i).getTotal()+"]";
			if(i != list.size()-1){
				dataList += ",";
			}			
		}

		model.addAttribute("searchVO", vo);
		model.addAttribute("listsize",listsize);
		model.addAttribute("list",list);
		model.addAttribute("dataList",dataList);
		
		return "agecompare/agecompare";
	}
	
	@RequestMapping(value="/agecompare/do_selectAgeList1.do", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String get(SearchVO vo) throws SQLException {
		
		
		log.debug("1=do_selectAgeList1.do===============");
		
		vo.setSearchDiv(StringUtil.nvl(vo.getSearchDiv(),"10"));
		vo.setSearchWord(StringUtil.nvl(vo.getSearchWord(),"20"));
		vo.setPageNum(vo.getPageNum()+"20");
		vo.setPageSize(vo.getPageSize()+"20");
		
		List<Agecompare> list = agecompareService.getSelectAgeList(vo);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list.get(0));
		
		log.debug("=jsonStr="+jsonStr);
		
		return jsonStr;
}
}