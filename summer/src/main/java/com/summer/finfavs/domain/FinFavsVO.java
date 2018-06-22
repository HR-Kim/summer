package com.summer.finfavs.domain;

import com.summer.comm.DTO;

public class FinFavsVO extends DTO {

    private int favsNo       ;
    private String id            ;
    private String finPrdtCd   ;
    private String regDt				;
    
    public FinFavsVO() {}
    
    

	public FinFavsVO(int favsNo, String id, String finPrdtCd, String regDt) {
		super();
		this.favsNo = favsNo;
		this.id = id;
		this.finPrdtCd = finPrdtCd;
		this.regDt = regDt;
	}



	@Override
	public String toString() {
		return "FinFavsVO [favsNo=" + favsNo + ", id=" + id + ", finPrdtCd=" + finPrdtCd + ", regDt=" + regDt + "]";
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