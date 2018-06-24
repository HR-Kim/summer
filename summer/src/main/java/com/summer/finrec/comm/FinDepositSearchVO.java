package com.summer.finrec.comm;

import com.summer.comm.DTO;

public class FinDepositSearchVO extends DTO {

	private int pageSize = 5;		//페이지 사이즈
	private int pageNum = 1;		//현재 페이지
	
	//deposit
	private String intrRateType;
	private int intrRateMin;
	private int intrRateMax;
	
	public FinDepositSearchVO() {}

	public FinDepositSearchVO(int pageSize, int pageNum, String intrRateType, int intrRateMin,
			int intrRateMax) {
		super();
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.intrRateType = intrRateType;
		this.intrRateMin = intrRateMin;
		this.intrRateMax = intrRateMax;
	}

	@Override
	public String toString() {
		return "FinSavingSearchVO [pageSize=" + pageSize + ", pageNum=" + pageNum + ", intrRateType=" + intrRateType
				+ ", intrRateMin=" + intrRateMin + ", intrRateMax=" + intrRateMax + "]";
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public String getIntrRateType() {
		return intrRateType;
	}

	public void setIntrRateType(String intrRateType) {
		this.intrRateType = intrRateType;
	}


	public int getIntrRateMin() {
		return intrRateMin;
	}

	public void setIntrRateMin(int intrRateMin) {
		this.intrRateMin = intrRateMin;
	}

	public int getIntrRateMax() {
		return intrRateMax;
	}

	public void setIntrRateMax(int intrRateMax) {
		this.intrRateMax = intrRateMax;
	}


	
	
}
