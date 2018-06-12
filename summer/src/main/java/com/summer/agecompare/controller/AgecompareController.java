package com.summer.agecompare.controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
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
		log.debug("1===doSelectList.do=======================");
		vo.setSearchDiv(StringUtil.nvl(vo.getSearchDiv(),"10"));
		vo.setSearchWord(StringUtil.nvl(vo.getSearchWord(),"30"));
		vo.setPageNum(StringUtil.nvl(vo.getPageNum(), "20180610"));
		
		log.debug("2===SearchVO=="+vo.toString());
		
		List<Agecompare> list = agecompareService.getSelectAgeList(vo);
		log.debug("TTTT3=list================"+list.toString());
		
		int totalCnt = 0;
		
		if(null != list && list.size()>0) {
			log.debug("4=totalCnt======================"+totalCnt);
		}
		
		model.addAttribute("searchVO", vo);
		model.addAttribute("list",list);
		
		return "agecompare/agecompare";
	}
}