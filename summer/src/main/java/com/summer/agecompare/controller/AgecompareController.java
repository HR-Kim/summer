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
			
		List<String> dataList = new ArrayList<String>();
		List<String> tmdList = new ArrayList<String>();
		
		for(int i=0; i<list.size(); i++) {
			tmdList.clear();
			List<String> dateList = new ArrayList<String>();
			List<String> ageList = new ArrayList<String>();
			List<String> tradetotalList = new ArrayList<String>();
			List<String> tradeIdList = new ArrayList<String>();
			List<String> totalList = new ArrayList<String>();
			
			dateList.add("'aDate'"+"'"+(list.get(i).getaDate())+"'");
			ageList.add("'age'"+"'"+(list.get(i).getAge())+"'");
			tradetotalList.add("'tradetotal'"+"'"+(list.get(i).getTradeTotal())+"'");
			totalList.add("'total'"+"'"+(list.get(i).getTotal())+"'");
			tradeIdList.add("'tradeId'"+"'"+(list.get(i).getTradeId())+"'");
			
			tmdList.add(dateList.toString());
			tmdList.add(ageList.toString());
			tmdList.add(tradetotalList.toString());
			tmdList.add(totalList.toString());
			tmdList.add(tradeIdList.toString());
			dataList.add(tmdList.toString());
		}
				
		model.addAttribute("searchVO", vo);
		model.addAttribute("list",list);
		model.addAttribute("dataList",dataList);
		
		return "agecompare/agecompare";
	}
}