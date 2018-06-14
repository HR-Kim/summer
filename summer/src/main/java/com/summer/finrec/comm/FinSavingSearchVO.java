package com.summer.finrec.comm;

import com.summer.comm.DTO;

public class FinSavingSearchVO extends DTO {

	private String pageSize;		//페이지 사이즈
	private String pageNum;		//현재 페이지
	
	//saving
	private String intr_rate_type;
	private String rsrv_type;
	private int intr_rate_min;
	private int intr_rate_max;
	
	public FinSavingSearchVO() {}

	public FinSavingSearchVO(String pageSize, String pageNum, String intr_rate_type, String rsrv_type,
			int intr_rate_min, int intr_rate_max) {
		super();
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.intr_rate_type = intr_rate_type;
		this.rsrv_type = rsrv_type;
		this.intr_rate_min = intr_rate_min;
		this.intr_rate_max = intr_rate_max;
	}

	@Override
	public String toString() {
		return "FinSavingSearchVO [pageSize=" + pageSize + ", pageNum=" + pageNum + ", intr_rate_type=" + intr_rate_type
				+ ", rsrv_type=" + rsrv_type + ", intr_rate_min=" + intr_rate_min + ", intr_rate_max=" + intr_rate_max
				+ "]";
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

	public String getIntr_rate_type() {
		return intr_rate_type;
	}

	public void setIntr_rate_type(String intr_rate_type) {
		this.intr_rate_type = intr_rate_type;
	}

	public String getRsrv_type() {
		return rsrv_type;
	}

	public void setRsrv_type(String rsrv_type) {
		this.rsrv_type = rsrv_type;
	}

	public int getIntr_rate_min() {
		return intr_rate_min;
	}

	public void setIntr_rate_min(int intr_rate_min) {
		this.intr_rate_min = intr_rate_min;
	}

	public int getIntr_rate_max() {
		return intr_rate_max;
	}

	public void setIntr_rate_max(int intr_rate_max) {
		this.intr_rate_max = intr_rate_max;
	}
	
	
	
	
}
