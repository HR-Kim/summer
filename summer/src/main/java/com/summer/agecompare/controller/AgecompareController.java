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
	
	@RequestMapping(value="/agecompare/do_selectAgeList.do", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String get(SearchVO vo) throws SQLException {
		
		log.debug("1=do_selectAgeList.do===============");
		
		int monthc = Integer.parseInt(vo.getPageSize().substring(5))
		- Integer.parseInt(vo.getPageNum().substring(5));
		
		vo.setPageNum(vo.getPageNum()+"20");
		vo.setPageSize(vo.getPageSize()+"20");

		
		String[] agelist = vo.getSearchWord().split(",");
				
		List<Agecompare> list = new ArrayList<Agecompare>();
		list = agecompareService.getSelectAgeList(vo);
		
		//monthc *= Integer.parseInt(agelist[0]);

		String tmp = "";
		String tmpList = "[ZDateZ";
		for(int i=1; i <= Integer.parseInt(agelist[0]); i++) {
			tmpList += ",Z" + agelist[i]+"대Z";
		}
		tmpList += "]";
		
		
		for(int i=0; i<monthc*Integer.parseInt(agelist[0]); i+=Integer.parseInt(agelist[0])) {
			tmpList += ",[Z"+list.get(i).getaDate().toString()+"Z";
			
			for(int j=i; j<i+Integer.parseInt(agelist[0]); j++) {
				tmpList += ","+ Integer.parseInt(list.get(j).getTotal())/Integer.parseInt(list.get(j).getAgeTotal());
			}
			tmpList += "]";
			/*
			tmp += "adate:"+list.get(i).getaDate();
			tmp += "total:"+list.get(i).getTotal();
			tmp += "agetotla:"+list.get(i).getAgeTotal();
			tmp += "age:"+list.get(i).getAge();*/
		}		
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(tmpList);
		
		log.debug("=jsonStr="+jsonStr);
		
		return jsonStr;
}
}