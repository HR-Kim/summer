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
	
	@RequestMapping(value="/accounts/doCodeselectList.do",method=RequestMethod.GET)
	public String getSelectList(CodeVO vo, Model model) throws SQLException{
		 
		log.debug("1===doSelectList.do=======================");
		
		vo.setCdMstId("ACC_TRADE");
		List<CodeVO> list1 = codeService.getSelectList(vo);
		
		vo.setCdMstId("ACC_CAT_EXPENSES");
		List<CodeVO> list2 = codeService.getSelectList(vo);
		
		vo.setCdMstId("ACC_CAT_INCOMES");
		List<CodeVO> list3 = codeService.getSelectList(vo);
		
		vo.setCdMstId("ACC_ACCOUNT");
		List<CodeVO> list4 = codeService.getSelectList(vo);
		
		log.debug("3===list=="+list1.toString());
		
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		model.addAttribute("codeVO",vo);
		
		return "accounts/codeTest";
	}
	
	

	
	
}
