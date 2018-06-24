package com.summer.good.controller;

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
import com.summer.comm.MessageVO;
import com.summer.comm.SearchVO;
import com.summer.comm.StringUtil;
import com.summer.good.domain.Favo;
import com.summer.good.service.FavoService;

@Controller
public class FavoController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FavoService favoservice;
	
	@RequestMapping(value="/favo/doSelectList.do", method=RequestMethod.GET)
	public String getSelectList(SearchVO vo, Model model, Favo favo) throws SQLException {
		log.debug("1===doSelectList.do=======================");
		
		vo.setSearchDiv(StringUtil.nvl(vo.getSearchDiv(),""));
		vo.setSearchWord(StringUtil.nvl(vo.getSearchWord(),	""));
		vo.setPageNum(StringUtil.nvl(vo.getPageNum(), "1"));
		vo.setPageSize(StringUtil.nvl(vo.getPageSize(), "10"));
		
		log.debug("2===SearchVO=="+vo.toString());
		
		favo.setId(vo.getSearchWord());
		log.debug("2===favo=="+favo.toString());
		
		List<Favo> list = favoservice.getSelectList(vo);
		log.debug("3===list=="+list.toString());
		
		
		favo = favoservice.doSum(favo);
		log.debug("3===sum=="+favo);
		
		int totalCnt = 0;
		if(null!= list && list.size()>0) {
			totalCnt = Integer.parseInt(list.get(0).getTotalCnt().toString());
			log.debug("4===totalCnt=="+totalCnt);
		}
		
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("list",list);
		model.addAttribute("searchVO",vo);
		model.addAttribute("favo", favo);
		
		return "favo/favo";
		
		
	}
	
	@RequestMapping(value="/favo/doUpsert.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String upsert(Favo vo) throws SQLException{
		log.debug("1===doUpsert.do=======================");
		
		log.debug("2===Favo=="+vo.toString());
		int flag = 0;
		
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		flag = favoservice.upsert(vo);
		
		log.debug("3=flag="+flag);
		
		if(flag>0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("즐겨찾기 되었습니다.");
		}else {
			messageVO.setMsgId("0");
			messageVO.setMessage("즐겨찾기 실패.");
		}
		
		String json = gson.toJson(messageVO);
		
		return json;
	}
	
	@RequestMapping(value="/favo/doDelete.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String delete(Favo vo) throws SQLException{
		log.debug("1===delete.do=======================");
		
		log.debug("2===Favo=="+vo.toString());
		int flag = 0;
		
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		flag = favoservice.delete(vo);
		
		log.debug("3=flag="+flag);
		
		if(flag>0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("삭제 되었습니다.");
		}else {
			messageVO.setMsgId("0");
			messageVO.setMessage("삭제 실패.");
		}
		
		String json = gson.toJson(messageVO);
		
		return json;
		
	}
	
	@RequestMapping(value="/favo/doDeleteAll.do", method=RequestMethod.POST, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String deleteAll(Favo vo) throws SQLException{
		log.debug("1===deleteAll.do=======================");
		
		log.debug("2===Favo=="+vo.toString());
		int flag = 0;
		
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		flag = favoservice.deleteAll(vo);
		
		log.debug("3=flag="+flag);
		
		if(flag>0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("초기화 되었습니다.");
		}else {
			messageVO.setMsgId("0");
			messageVO.setMessage("초기화 실패.");
		}
		
		String json = gson.toJson(messageVO);
		
		return json;
		
	}
	

}
