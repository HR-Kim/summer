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
	 * 일간 화면 => 카테고리 별 지출 리스트 출력  + 파이 차트
	 */
	@RequestMapping(value="/chart/doDay.do", 
				method=RequestMethod.GET)
	public String getDay(Chart vo, Model model) throws SQLException{
		log.debug("1. controller =====doDay.do=====");
		
		vo.setChartUserId("a");
		vo.setYear(2018);
		vo.setMonth(05);
		vo.setDay(15);
		log.debug("2. controller =====Chart vo====="+vo.toString());
		
		List<Chart> dayList = chartService.getDay(vo);
		log.debug("3. controller =====list=====" + dayList);
		
		if(dayList.size() <= 0) {
			log.debug("사용자의 지출 내역이 없습니다.");
		}
		
		model.addAttribute("dayList", dayList);
		return "chart/chart";
	}
	
	/**
	 * 주간 화면 => 카테고리 별 지출 리스트 출력 + 파이 차트
	 */
	@RequestMapping(value="/chart/doWeek.do", 
			method=RequestMethod.GET)
	public String getWeek(Chart vo, Model model) throws SQLException{
		log.debug("1. controller =====doWeek.do=====");
		
		vo.setChartUserId("a");
		vo.setWeekStart(20180505);
		vo.setWeekEnd(20180515);
		log.debug("2. controller =====Chart vo====="+vo.toString());
		
		List<Chart> weekList = chartService.getWeek(vo);
		log.debug("3. controller =====list=====" + weekList);
		
		if(weekList.size() <= 0) {
			log.debug("사용자의 지출 내역이 없습니다.");
		}
		
		model.addAttribute("weekList", weekList);
		return "chart/chart2";
	}
	
	
	/**
	 * 월간 화면 => 카테고리 별 지출 리스트 출력 + 월 별 바 차트
	 */
	@RequestMapping(value="/chart/doMonth.do",
			method=RequestMethod.GET)
	public String getMonth(Chart vo, Model model) throws SQLException{
		log.debug("1. controller =====doCtgChart.do=====");

		vo.setChartUserId("a");
		vo.setYear(2018);
		vo.setMonth(5);
		log.debug("2. controller =====Chart vo====="+vo.toString());
		
		List<Chart> pieList = chartService.getMonthPie(vo);
		List<Chart> barList = chartService.getMonthBar(vo);
		log.debug("3-1. controller =====pieList=====" + pieList);
		log.debug("3-2. controller =====barList=====" + barList);
		
		if(pieList.size() <= 0) {
			log.debug("pieList.size() <= 0");
		}
		
		if(barList.size() <= 0) {
			log.debug("barList.size() <= 0");
		}
		
		model.addAttribute("pieList", pieList);
		model.addAttribute("barList", barList);
		
		return "chart/chart3";
	}
}