package com.summer.chart.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.summer.chart.domain.Chart;
import com.summer.chart.service.ChartService;

@Controller
public class ChartController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private ChartService chartService;
	
	/**
	 * 카테고리 별 리스트 조회
	 */
	@RequestMapping(value="/chart/doCtgList.do", 
				method=RequestMethod.GET)
	public String getCtgList(Chart vo, Model model) throws SQLException{
		log.debug("1. controller =====doCtgList.do=====");
		
		vo.setChartUserId("a");
		log.debug("2. controller =====Chart vo====="+vo.toString());
		
		List<Chart> list = chartService.getCtgList(vo);
		log.debug("3. controller =====list=====" + list);

		if(list.size() <= 0) {
			log.debug("사용자의 지출 내역이 없습니다.");
		}
		
		model.addAttribute("list", list);
		return "chart/chart";
	}
}
