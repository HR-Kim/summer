package com.summer.finfavs.controller;

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
import com.summer.comm.MessageVO;
import com.summer.comm.SearchVO;
import com.summer.finfavs.domain.FinFavsVO;
import com.summer.finfavs.service.FinFavsService;

@Controller
public class FinFavsController {
	
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FinFavsService service;
	
	/**
	 * 단건 등록
	 * @param finFavs
	 * @throws Exception
	 */

	@RequestMapping(value="/finfavs/doAdd.do"
											   ,method=RequestMethod.GET
											   ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String add(FinFavsVO vo) throws Exception {
		log.debug("1. add==============");
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		log.debug("2.FinFavsVO = " + vo.toString());
		
		int flag = 0;
		flag = service.add(vo);
		log.debug("3.flag = " + flag);
		
		if(flag > 0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("등록/수정되었습니다.");
		} else {
			messageVO.setMsgId("0");
			messageVO.setMessage("등록/수정에 실패했습니다.");
		}
		
		String json = gson.toJson(messageVO);
		log.debug("json = " + json);
		return json;
		
	}
	
	/**
	 * 단건 삭제  
	 * @param finFavs
	 * @throws Exception
	 */

	@RequestMapping(value="/finfavs/doDelete.do"
											   ,method=RequestMethod.POST
											   ,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String delete(FinFavsVO vo) throws Exception {
		log.debug("1. delete==============");
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		log.debug("2.FinFavsVO = " + vo.toString());
		
		int flag = 0;
		flag = service.delete(vo);
		log.debug("3.flag = " + flag);
		
		if(flag > 0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("삭제에 성공했습니다.");
		} else {
			messageVO.setMsgId("0");
			messageVO.setMessage("삭제에 실패했습니다.");
		}
		
		String json = gson.toJson(messageVO);
		log.debug("json = " + json);
		return json;
		
	}
	
	/**
	 * 목록 조회
	 * @param finFavs
	 * @throws Exception
	 */

	@RequestMapping(value="/finfavs/doSelectList.do"
											   ,method=RequestMethod.GET)
	public String selectList(SearchVO vo, Model model) throws Exception {
		log.debug("1. selectList==============");

		vo.setPageNum((StringUtil.nvl(vo.getPageNum(), "1")));
		vo.setPageSize(StringUtil.nvl(vo.getPageSize(), "5"));
		int totalCnt = 0;
	
		log.debug("2.FinFavsVO = " + vo.toString());
		
		List<FinFavsVO> list = service.getSelectList(vo);
		log.debug("3.list = " + list);
		
		if( null != list && list.size() > 0) {
			totalCnt = Integer.parseInt(list.get(0).getTotalCnt());
			log.debug("4. totalCnt ====" + totalCnt);
		}
		
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("list", list);
		model.addAttribute("searchVO",vo);
		
		return "finfavs/favsList";
	}

}