package com.summer.finrec.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.summer.comm.StringUtil;
import com.summer.finrec.comm.FinSavingSearchVO;
import com.summer.finrec.domain.FinSavingVO;
import com.summer.finrec.service.SavingService;
import com.summer.finrec.service.SavingServiceImple;

@Controller
public class SavingController {

	Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	public SavingService service;

	/**
	 * 단순 페이지 보기용
	 */
	
	@RequestMapping(value = "/finrec/saving/showViewList.do", method = RequestMethod.GET)
	public String showViewList() {
		log.debug("1.showViewList======");

		return "finrec/savingSearchList";
	}

	/**
	 * 검색, 목록 조회
	 */

	@RequestMapping(value = "/finrec/saving/doSelectList.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getSelectList(FinSavingSearchVO vo, Model model) throws SQLException {

		log.debug("1.selectList======");

		// 첫 페이지(FinSavingSearchVo가 null일때)
		if (null == vo) {
			vo = new FinSavingSearchVO();
		}

		log.debug("2.FinSavingSearchVO=" + vo.toString());

		List<FinSavingVO> list = service.getSelectList(vo);

		log.debug("3.list = " + list.toString());

		Gson gson = new Gson();
		model.addAttribute("json", gson.toJson(list));

		return gson.toJson(list);
	}

	/*
	 * 단건 조회
	 */
	
	@RequestMapping(value = "/finrec/saving/doSelectOne.do", method = RequestMethod.GET)
	public String getSelectOne(FinSavingVO vo, Model model) throws SQLException {
		log.debug("1.doSelectOne.do===");
		log.debug("2. inVO = " + vo.toString());

		FinSavingVO outVO = service.getSelectOne(vo);
		model.addAttribute("outVO", outVO);
		return "finrec/savingDetailView";
	}
}