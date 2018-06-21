package com.summer.agecompare.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
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
		List<Agecompare> list =new ArrayList<Agecompare>();
		List<List<Agecompare>> a =new ArrayList<List<Agecompare>>();
		for(int i=0; i<Integer.parseInt(agelist[0]); i++) {
			vo.setSearchWord(agelist[i+1]);
			list = agecompareService.getSelectAgeList(vo);	
			a.add(i, list);
		}

		//monthc *= Integer.parseInt(agelist[0]);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(a);
		
		log.debug("=jsonStr="+jsonStr);
		
		return jsonStr;
	}
	//do_selectMeList
	@RequestMapping(value="/agecompare/do_selectMeList.do", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String getMe(SearchVO vo) throws SQLException {
		vo.setPageNum(vo.getPageNum()+"01");
		vo.setPageSize(vo.getPageSize()+"01");
		vo.setSearchDiv("b");
				
		List<Agecompare> list = new ArrayList<Agecompare>();
		list = agecompareService.getSelectMeList(vo);
		
		Gson gson = new Gson();
		String jsonStr = gson.toJson(list);
		
		return jsonStr;
	}
}