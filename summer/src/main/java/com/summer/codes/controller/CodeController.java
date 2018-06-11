package com.summer.codes.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.summer.accounts.domain.Accounts;
import com.summer.codes.domain.CodeVO;
import com.summer.codes.service.CodeService;
import com.summer.comm.DTO;
import com.summer.comm.SearchVO;
import com.summer.comm.StringUtil;

@Controller
public class CodeController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	
	@Autowired
	private CodeService codeService;
	
//	@RequestMapping("/accounts/getDetailName.do")
//	public List<CodeVO> getDetailName(CodeVO vo,Model model) throws SQLException{
//		
//		List<CodeVO> list = codeService.getSelectList(vo);
//		
//		model.addAttribute("codeList", list);
//		
//		return list;
//		//스트링 말아서
//		//다뽑아서 화면에서 처리.. 
//		
//	}
	
	@RequestMapping(value="/accounts/do_selectList.do",method=RequestMethod.GET)
	public String getSelectList(CodeVO vo, Model model) throws SQLException{
		log.debug("1===doSelectList.do=======================");
		
		vo.setCdMstId("ACC_TRADE");
		log.debug("2===getSelectList=="+vo.toString());
		
		List<CodeVO> list = codeService.getSelectList(vo);
		log.debug("3===list=="+list.toString());
		
		
		model.addAttribute("list",list);
		model.addAttribute("codeVO",vo);
		
		return "accounts/codeTest";
	}
	
	

	
	
}
