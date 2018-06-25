package com.summer.board.controller;

import java.io.File;
import javax.validation.Valid;

import java.io.IOException;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;

import com.google.gson.Gson;
import com.summer.board.domain.Board;
import com.summer.board.service.BoardService;
import com.summer.comm.MessageVO;
import com.summer.comm.SearchVO;
import com.summer.comm.StringUtil;
import com.summer.user.domain.User;
import com.summer.user.service.UserService;

@Controller
public class BoardController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private BoardService boardService;
	
	
	/**
	 * 회원가입(등록)
	 * @param user
	 * @return json
	 * @throws SQLException
	 */
	@RequestMapping(value="/board/do_add.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String add(Board board, BindingResult bindingResult) throws Exception{
		log.debug("1=add.do======================");
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		if(bindingResult.hasErrors()) {
			return "board/boardWrite";
		}
		
		int flag = 0;
		log.debug("2=user="+board.toString());		
		
		flag = boardService.add(board);
		log.debug("3=flag="+flag);
		
		if(flag > 0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("등록 되었습니다.");
		}else {
			messageVO.setMsgId("0");
			messageVO.setMessage("등록 실패!");
		}
		
		String json = gson.toJson(messageVO);
		log.debug("4=json="+json);		
       return json;	
	}
	
	@RequestMapping(value="/board/do_selectList.do", method=RequestMethod.GET)
	public String getSelectList(SearchVO vo,Model model) throws SQLException{
		log.debug("1=do_selectList.do======================");
		
		vo.setSearchDiv(StringUtil.nvl(vo.getSearchDiv(),""));
		vo.setSearchWord(StringUtil.nvl(vo.getSearchWord(),""));
		vo.setPageNum(StringUtil.nvl(vo.getPageNum(),"1"));
		vo.setPageSize(StringUtil.nvl(vo.getPageSize(),"10"));
		
		log.debug("2=SearchVO==============="+vo.toString());
		List<Board> list = boardService.getSelectList(vo);
		log.debug("3=list==================="+vo.toString());
		int totalCnt = 0;
		if(null != list && list.size() > 0) {
			totalCnt = Integer.parseInt(list.get(0).getTotalCnt().toString());
			log.debug("4=totalCnt================="+totalCnt);
		}
		
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("list",list);
		model.addAttribute("searchVO",vo);
		
		return "board/boardMain";//수정필
	}
	
	/**
	 * 단건 조회
	 * @param board
	 * @return json
	 * @throws SQLException
	 */
	@RequestMapping(value="/board/do_selectOne.do", method=RequestMethod.GET)
	public String getSelectOne(Board board, Model model) throws SQLException {
		log.debug("1=do_selectOne.do======================");
		
		if(0 == board.getNum()) {
			board.setNum(0);
		}
		
		Board outVO = boardService.getSelectOne(board);
		log.debug("3=do_selectOne.do=outVO="+outVO.toString());
		log.debug("========================");
		
		model.addAttribute("Board",outVO);
		log.debug("model"+model);
		
		
		return "board/boardView";
		
		
//		Gson gson = new Gson();
//		String json = gson.toJson(outVO);
//		log.debug("json:"+json);
//		return json;
	}
	
	/**
	 * 단건 조회
	 * @param board
	 * @return json
	 * @throws SQLException
	 */
	@RequestMapping(value="/board/do_selectUpdate.do", method=RequestMethod.GET)
	public String getSelectUpdate(Board board, Model model) throws SQLException {
		log.debug("1=do_selectOne.do======================");
		
		if(0 == board.getNum()) {
			board.setNum(0);
		}
		
		Board outVO = boardService.getSelectOne(board);
		log.debug("3=do_selectOne.do=outVO="+outVO.toString());
		log.debug("========================");
		
		model.addAttribute("Board",outVO);
		log.debug("model"+model);
		
		
		return "board/boardUpdate";
		
		
//		Gson gson = new Gson();
//		String json = gson.toJson(outVO);
//		log.debug("json:"+json);
//		return json;
	}
	
	@RequestMapping(value = "/board/boardWrite.do", method = RequestMethod.GET)
	public String infoUser() {
		return "board/boardWrite";
		
	}
	
	
	/**
	 * 단건 삭제
	 * @param board
	 * @return int
	 * @throws SQLException
	 */
	@RequestMapping(value="/board/do_delete.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String deleteAll(Board board) throws Exception{
		log.debug("1=delete.do======================");
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		int flag = 0;
		log.debug("2=board="+board.toString());
		
		flag = boardService.delete(board);
		log.debug("3=flag=="+flag);
		
		if(flag > 0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("삭제 되었습니다.");
		}else {
			messageVO.setMsgId("0");
			messageVO.setMessage("삭제 실패");
		}
		
		String json = gson.toJson(messageVO);
		log.debug("4=json="+json);
		return json;
		//화면 Input validation

	}
	/**
	 * 수정
	 * @param board
	 * @return int
	 * @throws SQLException
	 */
	@RequestMapping(value="/board/do_update.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String update(Board board) throws Exception{
		log.debug("1=update.do======================");
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		int flag = 0;
		log.debug("2=user="+board.toString());
		
		
		flag = boardService.update(board);
		log.debug("3=flag="+flag);
		
		if(flag > 0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("수정 되었습니다.");
		}else {
			messageVO.setMsgId("0");
			messageVO.setMessage("수정 실패!");
		}
		
		String json = gson.toJson(messageVO);
		log.debug("4=json="+json);
		
		return json;
	}
	
	
	
	
}
