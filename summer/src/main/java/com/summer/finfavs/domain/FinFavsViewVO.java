package com.summer.finfavs.domain;

public class FinFavsViewVO {

	private int favsNo       ;
    private String id            ;
    private String finPrdtCd   ;
    private String regDt				;
    private String finPrdtNm	;
    private String korCoNm;

    public FinFavsViewVO() {}

	public int getFavsNo() {
		return favsNo;
	}

	public void setFavsNo(int favsNo) {
		this.favsNo = favsNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFinPrdtCd() {
		return finPrdtCd;
	}

	public void setFinPrdtCd(String finPrdtCd) {
		this.finPrdtCd = finPrdtCd;
	}

	public String getRegDt() {
		return regDt;
	}

	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	public String getFinPrdtNm() {
		return finPrdtNm;
	}

	public void setFinPrdtNm(String finPrdtNm) {
		this.finPrdtNm = finPrdtNm;
	}

	public String getKorCoNm() {
		return korCoNm;
	}

	public void setKorCoNm(String korCoNm) {
		this.korCoNm = korCoNm;
	}

	public FinFavsViewVO(int favsNo, String id, String finPrdtCd, String regDt, String finPrdtNm, String korCoNm) {
		super();
		this.favsNo = favsNo;
		this.id = id;
		this.finPrdtCd = finPrdtCd;
		this.regDt = regDt;
		this.finPrdtNm = finPrdtNm;
		this.korCoNm = korCoNm;
	}

	@Override
	public String toString() {
		return "FinFavsViewVO [favsNo=" + favsNo + ", id=" + id + ", finPrdtCd=" + finPrdtCd + ", regDt=" + regDt
				+ ", finPrdtNm=" + finPrdtNm + ", korCoNm=" + korCoNm + "]";
	}
    
    
}
