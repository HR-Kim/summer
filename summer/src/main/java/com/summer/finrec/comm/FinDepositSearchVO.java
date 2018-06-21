package com.summer.finrec.comm;

import com.summer.comm.DTO;

public class FinDepositSearchVO extends DTO {

	private int pageSize = 5;		//페이지 사이즈
	private int pageNum = 1;		//현재 페이지
	
	//saving
	private String intrRateType;
	private String rsrvType;
	private int intrRateMin;
	private int intrRateMax;
	
	public FinDepositSearchVO() {}

	public FinDepositSearchVO(int pageSize, int pageNum, String intrRateType, String rsrvType, int intrRateMin,
			int intrRateMax) {
		super();
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.intrRateType = intrRateType;
		this.rsrvType = rsrvType;
		this.intrRateMin = intrRateMin;
		this.intrRateMax = intrRateMax;
	}

	@Override
	public String toString() {
		return "FinSavingSearchVO [pageSize=" + pageSize + ", pageNum=" + pageNum + ", intrRateType=" + intrRateType
				+ ", rsrvType=" + rsrvType + ", intrRateMin=" + intrRateMin + ", intrRateMax=" + intrRateMax + "]";
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

	public String getRsrvType() {
		return rsrvType;
	}

	public void setRsrvType(String rsrvType) {
		this.rsrvType = rsrvType;
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
