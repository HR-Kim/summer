package com.summer.user.controller;

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
import com.summer.comm.MessageVO;
import com.summer.comm.SearchVO;
import com.summer.comm.StringUtil;
import com.summer.user.domain.User;
import com.summer.user.service.UserService;

@Controller
public class UserController {
	
	private Logger log = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value="user/do_phoneCheck.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public  int phoneCheck(User user) throws SQLException {
		int hi = userService.phoneCheck(user);
		log.debug("*************************************************");
		log.debug(Integer.toString(hi));
		return userService.phoneCheck(user);
	}
	@RequestMapping(value="user/do_idCheck.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public  int idCheck(User user) throws SQLException {
		int hi = userService.idCheck(user);
		log.debug("*************************************************");
		log.debug(Integer.toString(hi));
		return userService.idCheck(user);
	}
	@RequestMapping(value="user/do_nickCheck.do", method= {RequestMethod.POST, RequestMethod.GET})
	@ResponseBody
	public  int nickCheck(User user) throws SQLException {
		int hi = userService.nickCheck(user);
		log.debug("*************************************************");
		log.debug(Integer.toString(hi));
		return userService.nickCheck(user);
	}
	
	
	/**
	 * 목록 조회
	 * @param vo
	 * @return List
	 * @throws SQLException
	 */
	@RequestMapping(value="/user/do_selectList.do", method=RequestMethod.GET)
	public String getSelectList(SearchVO vo,Model model) throws SQLException{
		log.debug("1=do_selectList.do======================");
		
		vo.setSearchDiv(StringUtil.nvl(vo.getSearchDiv(),""));
		vo.setSearchWord(StringUtil.nvl(vo.getSearchWord(),""));
		vo.setPageNum(StringUtil.nvl(vo.getPageNum(),"1"));
		vo.setPageSize(StringUtil.nvl(vo.getPageSize(),"10"));
		
		log.debug("2=SearchVO==============="+vo.toString());
		List<User> list = userService.getSelectList(vo);
		log.debug("3=list==================="+vo.toString());
		int totalCnt = 0;
		if(null != list && list.size() > 0) {
			totalCnt = Integer.parseInt(list.get(0).getTotalCnt().toString());
			log.debug("4=totalCnt================="+totalCnt);
		}
		
		model.addAttribute("totalCnt",totalCnt);
		model.addAttribute("list",list);
		model.addAttribute("searchVO",vo);
		
		return "user/user";
	}
	
	/**
	 * 단건 삭제
	 * @param user
	 * @return int
	 * @throws SQLException
	 */
	@RequestMapping(value="/user/do_delete.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String deleteAll(User user) throws Exception{
		log.debug("1=delete.do======================");
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		int flag = 0;
		log.debug("2=user="+user.toString());
		
		//화면 Input validation
		if(false == StringUtil.isAlphabetDigit(user.getId())) {
			messageVO.setMsgId("0");
			messageVO.setMessage("ID는 알파벳,숫자만 입력하세요(Java)");
			messageVO.setuId("id");
			log.debug("2.1=user="+gson.toJson(messageVO));
			return gson.toJson(messageVO);
			
		}
		
		flag = userService.deleteAll(user);
		log.debug("3=flag="+flag);
		
		if(flag > 0) {
			messageVO.setMsgId("1");
			messageVO.setMessage("삭제 되었습니다.");
		}else {
			messageVO.setMsgId("0");
			messageVO.setMessage("삭제 실패!");
		}
		
		String json = gson.toJson(messageVO);
		log.debug("4=json="+json);
		
		return json;
	}
	
	/**
	 * 수정
	 * @param user
	 * @return int
	 * @throws SQLException
	 */
	@RequestMapping(value="/user/do_update.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String update(User user) throws Exception{
		log.debug("1=update.do======================");
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		int flag = 0;
		log.debug("2=user="+user.toString());
		
		//화면 Input validation
		if(false == StringUtil.isAlphabetDigit(user.getId())) {
			messageVO.setMsgId("0");
			messageVO.setMessage("ID는 알파벳,숫자만 입력하세요(Java)");
			messageVO.setuId("id");
			log.debug("2.1=user="+gson.toJson(messageVO));
			return gson.toJson(messageVO);			
		}
		
		flag = userService.update(user);
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
	

	
	/**
	 * 회원가입(등록)
	 * @param user
	 * @return json
	 * @throws SQLException
	 */
	@RequestMapping(value="/user/do_add.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String add(@Valid User user, BindingResult bindingResult) throws Exception{
		log.debug("1=add.do======================");
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		if(bindingResult.hasErrors()) {
			return "user/signUp";
		}
		
		int flag = 0;
		log.debug("2=user="+user.toString());		
		//화면 Input validation
//		if(false == StringUtil.isAlphabetDigit(user.getId())) {
//			messageVO.setMsgId("0");
//			messageVO.setMessage("ID는 알파벳,숫자만 입력하세요(Java)");
//			messageVO.setuId("id");
//			log.debug("2.1=user="+gson.toJson(messageVO));
//			return gson.toJson(messageVO);			
//		}
		
		flag = userService.add(user);
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
	
	/**
	 * 단건 조회
	 * @param user
	 * @return json
	 * @throws SQLException
	 */
	@RequestMapping(value="/user/do_searchOne.do", method=RequestMethod.GET,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String get(User user) throws SQLException {
		log.debug("1=do_searchOne.do======================");
		
		if(null == user.getId()) {
			user.setId("unknown ID");
		}
		
		User outVO = userService.get(user);
		log.debug("3=do_searchOne.do=outVO="+outVO.toString());
		log.debug("========================");
		
		Gson gson = new Gson();
		
		String jsonStr = gson.toJson(outVO);
		
		log.debug("jsonStr:"+jsonStr);
		
		return jsonStr;
	}
	
	
	/**
	 * 등록
	 * @param user
	 * @return json
	 * @throws SQLException
	 */
	@RequestMapping(value="/user/do_upsert.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
	@ResponseBody
	public String upsert(User user) throws Exception{
		log.debug("1=add.do======================");
		Gson gson = new Gson();
		MessageVO messageVO = new MessageVO();
		
		int flag = 0;
		log.debug("2=user="+user.toString());
		
		//화면 Input validation
		if(false == StringUtil.isAlphabetDigit(user.getId())) {
			messageVO.setMsgId("0");
			messageVO.setMessage("ID는 알파벳,숫자만 입력하세요(Java)");
			messageVO.setuId("hId");
			log.debug("2.1=user="+gson.toJson(messageVO));
			return gson.toJson(messageVO);
			
		}
		
		flag = userService.upsert(user);
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
	
	@RequestMapping(value= "/user/go_login.do")
	public String goLogin() {
		return "/user/login";
	}
	@RequestMapping(value= "/user/go_signUp.do")
	public String goSignUp() {
		return "/user/signUp";
	}
	
	// 02. 로그인 처리
    @RequestMapping(value="/user/do_loginCheck.do", method=RequestMethod.POST,produces="application/json;charset=UTF-8")
    public ModelAndView loginCheck(@ModelAttribute User user, HttpSession session) throws SQLException{
        boolean result = userService.loginCheck(user, session);
        ModelAndView mav = new ModelAndView();
        if (result == true) { // 로그인 성공
            // main.jsp로 이동
            mav.setViewName("home");
            mav.addObject("msg", "success");
        } else {    // 로그인 실패
            // login.jsp로 이동
            mav.setViewName("user/login");
            mav.addObject("msg", "failure");
        }
        return mav;
    }
	
	
	
	
}
