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
import com.google.gson.JsonArray;
import com.summer.comm.SearchVO;
import com.summer.comm.StringUtil;
import com.summer.good.domain.Good;
import com.summer.good.service.GoodService;

@Controller
public class GoodController {
	Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private GoodService goodService;
	
	@RequestMapping(value="/good/doSelectList.do", method=RequestMethod.GET)
	public String getSelectList(SearchVO vo, Model model) throws SQLException {
		log.debug("1===doSelectList.do=======================");
		
		vo.setSearchDiv(StringUtil.nvl(vo.getSearchDiv(),""));
		vo.setSearchWord(StringUtil.nvl(vo.getSearchWord(),	""));
		vo.setPageNum(StringUtil.nvl(vo.getPageNum(), "1"));
		vo.setPageSize(StringUtil.nvl(vo.getPageSize(), "10"));
		
		log.debug("2===SearchVO=="+vo.toString());
		
		List<Good> list = goodService.getSelectList(vo);
		log.debug("3===list=="+list.toString());
		
		int totalCnt = 0;
		if(null!= list && list.size()>0) {
			totalCnt = Integer.parseInt(list.get(0).getTotalCnt().toString());
			log.debug("4===totalCnt=="+totalCnt);
		}
		
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("list",list);
		model.addAttribute("searchVO",vo);
		
		return "good/goodList";
	}
	
	@RequestMapping(value="/good/doSearchOne.do", method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	public String get(Good vo, Model model) throws SQLException{
		log.debug("1.=searchOne.do====================================");
		
		log.debug("1.===goodVo==="+vo.toString());
		
		Good outVO = goodService.get(vo);
		
		//System.out.println("vo="+vo);
		List<Good> list = goodService.getEntp(vo);
		
		System.out.println("list="+list);

		
		model.addAttribute("detailGood", outVO);
		model.addAttribute("entpList", list);
		
		return "good/goodDetail";
	}
	
	@RequestMapping(value="/good/dosearchEntp.do",method=RequestMethod.GET, produces="application/json;charset=UTF-8")
	@ResponseBody
	public String searchEntp(Good vo) throws SQLException{
		log.debug("1.=dosearchEntp.do====================================");
		
		log.debug("2.==good=="+vo.toString());
		
		List<Good> list = goodService.searchEntp(vo);
		log.debug("3===list=="+list.toString());
		
		Gson gson = new Gson();
		JsonArray carray = new JsonArray();
		
		for(int i=0;i<list.size();i++) {
			JsonArray sarray = new JsonArray();
			sarray.add(list.get(i).getEntpName());
			sarray.add(list.get(i).getGoodPrice());
			sarray.add(list.get(i).getPlusoneYn().trim());
			sarray.add(list.get(i).getGoodDcYn().trim());
			
			
			carray.add(sarray);
		}
		
		String jsonStr = gson.toJson(carray);
		log.debug("=carray="+carray.toString());
		
		return jsonStr;
	}
}
