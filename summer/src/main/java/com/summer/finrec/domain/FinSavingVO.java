package com.summer.finrec.domain;

public class FinSavingVO {
	
	//baseList
	private String finCoNo;
	private String finPrdtCd;

	private String korCoNm;
	private String finPrdtNm;

	private String joinWay;
	private String mtrtInt;
	private String spclCnd;
	private String etcNote;
	private int maxLimit;


	//optionList
	private float intrRateMin;
	private float intrRateMax;
	private String intrRateType;
	private String rsrvType;
	
	private String intrRateTypeNm;
	private String rsrvTypeNm;
	


	

	@Override
	public String toString() {
		return "FinSavingVO [finCoNo=" + finCoNo + ", finPrdtCd=" + finPrdtCd + ", korCoNm=" + korCoNm + ", finPrdtNm="
				+ finPrdtNm + ", joinWay=" + joinWay + ", mtrtInt=" + mtrtInt + ", spclCnd=" + spclCnd + ", etcNote="
				+ etcNote + ", maxLimit=" + maxLimit + ", intrRateMin=" + intrRateMin + ", intrRateMax=" + intrRateMax
				+ ", intrRateType=" + intrRateType + ", rsrvType=" + rsrvType + ", intrRateTypeNm=" + intrRateTypeNm
				+ ", rsrvTypeNm=" + rsrvTypeNm + "]";
	}




	public String getIntrRateTypeNm() {
		return intrRateTypeNm;
	}




	public void setIntrRateTypeNm(String intrRateTypeNm) {
		this.intrRateTypeNm = intrRateTypeNm;
	}




	public String getRsrvTypeNm() {
		return rsrvTypeNm;
	}




	public void setRsrvTypeNm(String rsrvTypeNm) {
		this.rsrvTypeNm = rsrvTypeNm;
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




	public float getIntrRateMin() {
		return intrRateMin;
	}




	public void setIntrRateMin(float intrRateMin) {
		this.intrRateMin = intrRateMin;
	}




	public float getIntrRateMax() {
		return intrRateMax;
	}




	public void setIntrRateMax(float intrRateMax) {
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
