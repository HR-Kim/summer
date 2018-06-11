package com.summer.good.domain;

import com.summer.comm.DTO;

public class Good extends DTO{
	private String goodId;
	private String goodName;
	private String detailMean;
	
	public Good() {
		
	}

	public String getGoodId() {
		return goodId;
	}

	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}

	public String getGoodName() {
		return goodName;
	}

	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}

	public String getDetailMean() {
		return detailMean;
	}

	public void setDetailMean(String detailMean) {
		this.detailMean = detailMean;
	}

	@Override
	public String toString() {
		return "Good [goodId=" + goodId + ", goodName=" + goodName + ", detailMean=" + detailMean + "]";
	}

	public Good(String goodId, String goodName, String detailMean) {
		super();
		this.goodId = goodId;
		this.goodName = goodName;
		this.detailMean = detailMean;
	}
	
	
}
