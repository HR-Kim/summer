package com.summer.finrec.domain;

public class FinDepositVO {
	
	//baseList
	private String finCoNo;
	private String finPrdtCd;

	private String korCoNm;
	private String finPrdtNm;

	private String joinWay;
	private String mtrtInt;
	private String spclCnd;
	private String etcNote;


	//optionList
	private float intrRateMin;
	private float intrRateMax;
	private String intrRateType;
	
	private String intrRateTypeNm;
	
	public FinDepositVO() {}

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

	public String getIntrRateTypeNm() {
		return intrRateTypeNm;
	}

	public void setIntrRateTypeNm(String intrRateTypeNm) {
		this.intrRateTypeNm = intrRateTypeNm;
	}

	@Override
	public String toString() {
		return "FinDepositVO [finCoNo=" + finCoNo + ", finPrdtCd=" + finPrdtCd + ", korCoNm=" + korCoNm + ", finPrdtNm="
				+ finPrdtNm + ", joinWay=" + joinWay + ", mtrtInt=" + mtrtInt + ", spclCnd=" + spclCnd + ", etcNote="
				+ etcNote + ", intrRateMin=" + intrRateMin + ", intrRateMax=" + intrRateMax + ", intrRateType="
				+ intrRateType + ", intrRateTypeNm=" + intrRateTypeNm + "]";
	}

	public FinDepositVO(String finCoNo, String finPrdtCd, String korCoNm, String finPrdtNm, String joinWay,
			String mtrtInt, String spclCnd, String etcNote, float intrRateMin, float intrRateMax, String intrRateType,
			String intrRateTypeNm) {
		super();
		this.finCoNo = finCoNo;
		this.finPrdtCd = finPrdtCd;
		this.korCoNm = korCoNm;
		this.finPrdtNm = finPrdtNm;
		this.joinWay = joinWay;
		this.mtrtInt = mtrtInt;
		this.spclCnd = spclCnd;
		this.etcNote = etcNote;
		this.intrRateMin = intrRateMin;
		this.intrRateMax = intrRateMax;
		this.intrRateType = intrRateType;
		this.intrRateTypeNm = intrRateTypeNm;
	}

	
	
	
	
}
