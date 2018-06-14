package com.summer.accounts.controller;

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
import com.summer.accounts.domain.Accounts;
import com.summer.accounts.service.AccountsService;
import com.summer.codes.domain.CodeVO;
import com.summer.codes.service.CodeService;
import com.summer.comm.MessageVO;
import com.summer.comm.SearchVO;
import com.summer.comm.StringUtil;

@Controller
public class AccountsController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private AccountsService accountsService;
	
	@Autowired
	private CodeService codeService;
	

	
	@RequestMapping(value="/accounts/doSearchTrade.do",method=RequestMethod.GET)
	public Model getSearchTrade(SearchVO vo,CodeVO codeVo, Model model) throws SQLException{
		log.debug("1===getSearchTrade.do=======================");
		
		vo.setSearchDiv(StringUtil.nvl(vo.getSearchDiv(),""));
		vo.setSearchWord(StringUtil.nvl(vo.getSearchWord(),	""));
		vo.setPageNum(StringUtil.nvl(vo.getPageNum(), "1"));
		vo.setPageSize(StringUtil.nvl(vo.getPageSize(), "10"));
		
		log.debug("2===SearchVO=="+vo.toString());
		
		List<CodeVO> codelist2 = new ArrayList<CodeVO>();
		
		if(vo.getSearchTrade().equals("10")) {
			codeVo.setCdMstId("ACC_CAT_EXPENSES");
			codelist2 = codeService.getSelectList(codeVo);
		}else if(vo.getSearchTrade().equals("20")) {
			codeVo.setCdMstId("ACC_CAT_INCOMES");
			codelist2 = codeService.getSelectList(codeVo);
		}
		
		codeVo.setCdMstId("ACC_ACCOUNT");
		List<CodeVO> codelist4 = codeService.getSelectList(codeVo);
		
		model.addAttribute("codelist2",codelist2);
		model.addAttribute("codelist4",codelist4);
		
		codeService.getSelectList(codeVo);
		
		List<Accounts> list = accountsService.getSelectList(vo);
		log.debug("3===list=="+list.toString());
		
		log.debug("3===codelist2=="+codelist2.toString());
		
		int totalCnt = 0;
		if(null!= list && list.size()>0) {
			totalCnt = Integer.parseInt(list.get(0).getTotalCnt().toString());
			log.debug("4===totalCnt=="+totalCnt);
		}
		
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("list",list);
		model.addAttribute("searchVO",vo);
		
		return model;
	}
	
	
	@RequestMapping(value="/accounts/doSelectList.do",method=RequestMethod.GET)
	public String getSelectList(SearchVO vo,CodeVO codeVo, Model model) throws SQLException{
		log.debug("1===doSelectList.do=======================");
		
		vo.setSearchDiv(StringUtil.nvl(vo.getSearchDiv(),""));
		vo.setSearchWord(StringUtil.nvl(vo.getSearchWord(),	""));
		vo.setPageNum(StringUtil.nvl(vo.getPageNum(), "1"));
		vo.setPageSize(StringUtil.nvl(vo.getPageSize(), "10"));
		
		log.debug("2===SearchVO=="+vo.toString());
		
		codeVo.setCdMstId("ACC_TRADE");
		List<CodeVO> list1 = codeService.getSelectList(codeVo);
		

		codeVo.setCdMstId("ACC_CAT_EXPENSES");
		List<CodeVO> list2 = codeService.getSelectList(codeVo);
		
		codeVo.setCdMstId("ACC_CAT_INCOMES");
		List<CodeVO> list3 = codeService.getSelectList(codeVo);
		
		codeVo.setCdMstId("ACC_ACCOUNT");
		List<CodeVO> list4 = codeService.getSelectList(codeVo);
		
		log.debug("3===list=="+list1.toString());
		
		
		model.addAttribute("list1",list1);
		model.addAttribute("list2",list2);
		model.addAttribute("list3",list3);
		model.addAttribute("list4",list4);
		
		codeService.getSelectList(codeVo);
		
		List<Accounts> list = accountsService.getSelectList(vo);
		log.debug("3===list=="+list.toString());
		
		
		
		int totalCnt = 0;
		if(null!= list && list.size()>0) {
			totalCnt = Integer.parseInt(list.get(0).getTotalCnt().toString());
			log.debug("4===totalCnt=="+totalCnt);
		}
		
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("list",list);
		model.addAttribute("searchVO",vo);
		
		return "accounts/dayAccounts";
	}
	
	@RequestMapping(value="/accounts/doSelectList.do",method=RequestMethod.POST)
	public String getSelectListPost(SearchVO vo, Model model) throws SQLException{
		
		log.debug("getSelectListPost==RequestMethod.POST==");
		
		//todo : 검색 시 값 가지고 가는지 확인 
		return "redirect:/accounts/doSelectList.do";  
		
	}
	
	/**
	 * 단건 조회
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value="/accounts/doSearchOne.do", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String get(Accounts vo) throws SQLException{
		log.debug("1===doSearchOne.do=======================");
		
		Accounts outVO = accountsService.get(vo);
		
		log.debug("3=doSearchOne.do======================="+outVO.toString());
		log.debug("========================");
		
		Gson gson = new Gson();
		
		String jsonStr = gson.toJson(outVO);
		log.debug("=jsonStr="+jsonStr);
		
		
		return jsonStr;
	}
	
	/**
	 * 등록/수정
	 * @param vo
	 * @return
	 * @throws SQLException
	 */
	@RequestMapping(value="/accounts/doUpsert.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String upsert(Accounts vo) throws SQLException{
		log.debug("1===doUpsert.do=======================");
		
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		int flag = 0;
		log.debug("2=AccountsVO="+vo.toString());
		
		flag = accountsService.upsert(vo);
		log.debug("3=flag="+flag);
		
		if(flag>0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("등록 되었습니다.");
		}else {
			messageVO.setMsgId("0");
			messageVO.setMessage("등록 실패.");
		}
		
		String json = gson.toJson(messageVO);
		log.debug("4=json="+json);
		
		return json;
	}
	
	@RequestMapping(value="/accounts/doDelete.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String delete(Accounts vo) throws SQLException{
		log.debug("1===doDelete.do=======================");
		
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		int flag = 0;
		log.debug("2=AccountsVO="+vo.toString());
		
		flag = accountsService.delete(vo);
		log.debug("3=flag="+flag);
		
		if(flag>0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("삭제 되었습니다.");
		}else {
			messageVO.setMsgId("0");
			messageVO.setMessage("삭제 실패.");
		}
		
		String json = gson.toJson(messageVO);
		log.debug("4=json="+json);
		
		return json;
	}
	
}

