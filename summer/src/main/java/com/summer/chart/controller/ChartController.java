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
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
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
				method=RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getDay(Chart vo) throws SQLException{		
		List<Chart> dayList = chartService.getDay(vo);

		Gson dayGson = new Gson();
		String dayJsonStr = dayGson.toJson(dayList);
		
		log.debug("=dayJsonStr=" + dayJsonStr);
		
		return dayJsonStr;
	}
	
	/**
	 * 주간 화면 => 카테고리 별 지출 리스트 출력 + 파이 차트
	 */
	@RequestMapping(value="/chart/doWeek.do", 
			method=RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getWeek(Chart vo) throws SQLException{		
		List<Chart> weekList = chartService.getWeek(vo);
		
		Gson weekGson = new Gson();
		String weekJsonStr = weekGson.toJson(weekList);
		
		log.debug("=weekJsonStr=" + weekJsonStr);
		
		return weekJsonStr;
	}
	
	
	/**
	 * 월간 화면 => 카테고리 별 지출 리스트 출력 + 월 별 바 차트
	 */
	@RequestMapping(value="/chart/doMonthPie.do", 
			method=RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getMonthPie(Chart vo) throws SQLException{
		/*vo.setChartUserId("a");
		vo.setYear(2018);
		vo.setMonth(6);*/

		List<Chart> pieList = chartService.getMonthPie(vo);
		
		Gson monthPieGson = new Gson();
		String monthPieJsonStr = monthPieGson.toJson(pieList);
		
		log.debug("=monthPieJsonStr=" + monthPieJsonStr);
		
		return monthPieJsonStr;
	}
	
	@RequestMapping(value="/chart/doMonthBar.do", 
			method=RequestMethod.GET, produces = "application/text; charset=utf8")
	@ResponseBody
	public String getMonthBar(Chart vo) throws SQLException{
		List<Chart> barList = chartService.getMonthBar(vo);
		
		Gson monthBarGson = new Gson();
		String monthBarJsonStr = monthBarGson.toJson(barList);
		
		log.debug("=monthBarJsonStr=" + monthBarJsonStr);
		
		return monthBarJsonStr;
	}
}