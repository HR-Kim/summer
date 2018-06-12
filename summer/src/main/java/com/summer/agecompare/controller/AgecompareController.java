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
		vo.setSearchWord(StringUtil.nvl(vo.getSearchWord(),"30"));
		//vo.setPageNum(StringUtil.nvl(vo.getPageNum(), "20180610"));
				
		List<Agecompare> list = agecompareService.getSelectAgeList(vo);
		
		int totalCnt = 0;
			
		List<String> dataList = new ArrayList<String>();
		List<String> dateList = new ArrayList<String>();
		List<String> ageList = new ArrayList<String>();
		List<String> totalList = new ArrayList<String>();
		
		
		for(int i=0; i<list.size(); i++) {
			if(i==0) {
				dateList.add("'aDate'");
				ageList.add("'age'");
				totalList.add("'total'");
			}else if(i==list.size()-1) {
				dateList.add("'"+(list.get(i).getaDate()).substring(0,7)+"'");
				ageList.add("'"+(list.get(i).getAge())+"'");
				totalList.add("'"+(list.get(i).getTradeTotal())+"'");
			}
			else {
				dateList.add("'"+(list.get(i).getaDate()).substring(0,7)+"'");
				ageList.add("'"+(list.get(i).getAge())+"'");
				totalList.add("'"+(list.get(i).getTradeTotal())+"'");
			}
		}
		dataList.add(dateList.toString());
		dataList.add(ageList.toString());
		dataList.add(totalList.toString());
				
		model.addAttribute("searchVO", vo);
		model.addAttribute("list",list);
		model.addAttribute("dataList",dataList);
		
		return "agecompare/agecompare";
	}
}