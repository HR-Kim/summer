package com.summer.finrec.controller;

import java.sql.SQLException;
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
import com.summer.finrec.comm.FinDepositSearchVO;
import com.summer.finrec.comm.FinSavingSearchVO;
import com.summer.finrec.domain.FinDepositVO;
import com.summer.finrec.domain.FinSavingVO;
import com.summer.finrec.service.DepositService;
import com.summer.finrec.service.SavingService;

@Controller
public class DepositController {

	Logger log = LoggerFactory.getLogger(this.getClass());

	@Autowired
	public DepositService service;

	/**
	 * 단순 페이지 보기용
	 */
	
	@RequestMapping(value = "/finrec/deposit/showViewList.do", method = RequestMethod.GET)
	public String showViewList() {
		log.debug("1.showViewList======");

		return "finrec/depositSearchList";
	}

	/**
	 * 검색, 목록 조회
	 */

	@RequestMapping(value = "/finrec/deposit/doSelectList.do", method = RequestMethod.POST, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public String getSelectList(FinDepositSearchVO vo, Model model) throws SQLException {

		log.debug("1.selectList======");

		// 첫 페이지(FinSavingSearchVo가 null일때)
		if (null == vo) {
			vo = new FinDepositSearchVO();
		}

		log.debug("2.FinDepositSearchVO=" + vo.toString());

		List<FinDepositVO> list = service.getSelectList(vo);

		log.debug("3.list = " + list.toString());

		Gson gson = new Gson();
		model.addAttribute("json", gson.toJson(list));

		return gson.toJson(list);
	}

	/*
	 * 단건 조회
	 */
	
	@RequestMapping(value = "/finrec/deposit/doSelectOne.do", method = RequestMethod.GET)
	public String getSelectOne(FinDepositVO vo, Model model) throws SQLException {
		log.debug("1.doSelectOne.do===");
		log.debug("2. inVO = " + vo.toString());

		FinDepositVO outVO = service.getSelectOne(vo);
		model.addAttribute("outVO", outVO);
		return "finrec/depositDetailView";
	}
}