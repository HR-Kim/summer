package com.summer.finrec.domain;

public class FinSavingVO {
	
	private String finCoNo;
	private String finPrdtCd;
	
	private String korCoNm;
	private String finPrdtNm;
	private int intrRateMin;
	private int intrRateMax;
	private String intrRateType;
	private String rsrvType;
	
	private String joinWay;
	private String mtrtInt;
	private String spclCnd;
	private String etcNote;
	private int maxLimit;
	
	
	


	@Override
	public String toString() {
		return "FinSavingVO [finCoNo=" + finCoNo + ", finPrdtCd=" + finPrdtCd + ", korCoNm=" + korCoNm + ", finPrdtNm="
				+ finPrdtNm + ", intrRateMin=" + intrRateMin + ", intrRateMax=" + intrRateMax + ", intrRateType="
				+ intrRateType + ", rsrvType=" + rsrvType + ", joinWay=" + joinWay + ", mtrtInt=" + mtrtInt
				+ ", spclCnd=" + spclCnd + ", etcNote=" + etcNote + ", maxLimit=" + maxLimit + "]";
	}




	public String getFinCoNo() {
		return finCoNo;
	}




	public void setFinCoNo(String finCoNo) {
		this.finCoNo = finCoNo;
	}




	public String getFinPrdtCd() {
		return finPrdtCd;
	}




	public void setFinPrdtCd(String finPrdtCd) {
		this.finPrdtCd = finPrdtCd;
	}




	public String getKorCoNm() {
		return korCoNm;
	}




	public void setKorCoNm(String korCoNm) {
		this.korCoNm = korCoNm;
	}




	public String getFinPrdtNm() {
		return finPrdtNm;
	}




	public void setFinPrdtNm(String finPrdtNm) {
		this.finPrdtNm = finPrdtNm;
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




	public String getJoinWay() {
		return joinWay;
	}




	public void setJoinWay(String joinWay) {
		this.joinWay = joinWay;
	}




	public String getMtrtInt() {
		return mtrtInt;
	}




	public void setMtrtInt(String mtrtInt) {
		this.mtrtInt = mtrtInt;
	}




	public String getSpclCnd() {
		return spclCnd;
	}




	public void setSpclCnd(String spclCnd) {
		this.spclCnd = spclCnd;
	}




	public String getEtcNote() {
		return etcNote;
	}




	public void setEtcNote(String etcNote) {
		this.etcNote = etcNote;
	}




	public int getMaxLimit() {
		return maxLimit;
	}




	public void setMaxLimit(int maxLimit) {
		this.maxLimit = maxLimit;
	}




	public FinSavingVO() {}
	
	
	
}
