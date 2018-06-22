package com.summer.good.domain;

import com.summer.comm.DTO;

public class Favo extends DTO{
	private String id;
	private String goodId;
	private String entpId;
	private String goodName;
	private String entpName;
	private int goodPrice;
	private int goodNum;
	
	public Favo() {
		
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGoodId() {
		return goodId;
	}
	public void setGoodId(String goodId) {
		this.goodId = goodId;
	}
	public String getEntpId() {
		return entpId;
	}
	public void setEntpId(String entpId) {
		this.entpId = entpId;
	}
	public String getGoodName() {
		return goodName;
	}
	public void setGoodName(String goodName) {
		this.goodName = goodName;
	}
	public String getEntpName() {
		return entpName;
	}
	public void setEntpName(String entpName) {
		this.entpName = entpName;
	}
	public int getGoodPrice() {
		return goodPrice;
	}
	public void setGoodPrice(int goodPrice) {
		this.goodPrice = goodPrice;
	}
	public int getGoodNum() {
		return goodNum;
	}
	public void setGoodNum(int goodNum) {
		this.goodNum = goodNum;
	}
	public Favo(String id, String goodId, String entpId, String goodName, String entpName, int goodPrice, int goodNum) {
		super();
		this.id = id;
		this.goodId = goodId;
		this.entpId = entpId;
		this.goodName = goodName;
		this.entpName = entpName;
		this.goodPrice = goodPrice;
		this.goodNum = goodNum;
	}
	@Override
	public String toString() {
		return "[id=" + id + ", goodId=" + goodId + ", entpId=" + entpId + ", goodName=" + goodName + ", entpName="
				+ entpName + ", goodPrice=" + goodPrice + ", goodNum=" + goodNum + "]";
	}
	
	
	
	
}
