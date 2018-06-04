package com.summer.comm;

import java.util.HashMap;
import java.util.Map;

public class DTO {
	
	private String no;
	private String totalCnt;
	
	private Map<String, String> param = new HashMap<String,String>();

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getTotalCnt() {
		return totalCnt;
	}

	public void setTotalCnt(String totalCnt) {
		this.totalCnt = totalCnt;
	}

	public Map<String, String> getParam() {
		return param;
	}

	public void setParam(Map<String, String> param) {
		this.param = param;
	}
	
	

}
