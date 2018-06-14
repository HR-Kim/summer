package com.summer.finrec.comm;

import com.summer.comm.DTO;

public class FinHouseLoanSearchVO extends DTO {

	private String pageSize;		//페이지 사이즈
	private String pageNum;		//현재 페이지
	
	//houseLoan
	private String rpay_type;
	private String lend_rate_type;
	private int lend_rate_min;
	private int lend_rate_max;

	public FinHouseLoanSearchVO() {}

	public FinHouseLoanSearchVO(String pageSize, String pageNum, String rpay_type, String lend_rate_type,
			int lend_rate_min, int lend_rate_max) {
		super();
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.rpay_type = rpay_type;
		this.lend_rate_type = lend_rate_type;
		this.lend_rate_min = lend_rate_min;
		this.lend_rate_max = lend_rate_max;
	}

	@Override
	public String toString() {
		return "FinHouseLoanSearchVO [pageSize=" + pageSize + ", pageNum=" + pageNum + ", rpay_type=" + rpay_type
				+ ", lend_rate_type=" + lend_rate_type + ", lend_rate_min=" + lend_rate_min + ", lend_rate_max="
				+ lend_rate_max + "]";
	}

	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public String getRpay_type() {
		return rpay_type;
	}

	public void setRpay_type(String rpay_type) {
		this.rpay_type = rpay_type;
	}

	public String getLend_rate_type() {
		return lend_rate_type;
	}

	public void setLend_rate_type(String lend_rate_type) {
		this.lend_rate_type = lend_rate_type;
	}

	public int getLend_rate_min() {
		return lend_rate_min;
	}

	public void setLend_rate_min(int lend_rate_min) {
		this.lend_rate_min = lend_rate_min;
	}

	public int getLend_rate_max() {
		return lend_rate_max;
	}

	public void setLend_rate_max(int lend_rate_max) {
		this.lend_rate_max = lend_rate_max;
	}
	
	
	
	
	
	
}
