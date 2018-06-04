package com.summer.finfavs.domain;

public class FinFavs {

    private int favsNo       ;
    private String id            ;
    private int dclsMonth    ;
    private int finCoNo     ;
    private String finPrdtCd   ;
    private String regDt				;
    
    public FinFavs() {}
    
    

	public FinFavs(int favsNo, String id, int dclsMonth, int finCoNo, String finPrdtCd, String regDt) {
		super();
		this.favsNo = favsNo;
		this.id = id;
		this.dclsMonth = dclsMonth;
		this.finCoNo = finCoNo;
		this.finPrdtCd = finPrdtCd;
		this.regDt = regDt;
	}



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

	public int getDclsMonth() {
		return dclsMonth;
	}

	public void setDclsMonth(int dclsMonth) {
		this.dclsMonth = dclsMonth;
	}

	public int getFinCoNo() {
		return finCoNo;
	}

	public void setFinCoNo(int finCoNo) {
		this.finCoNo = finCoNo;
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

    
    
}                             
