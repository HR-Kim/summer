package com.summer.codes.domain;

import com.summer.comm.DTO;

public class CodeVO extends DTO{
	private String cdMstId    ;
	private String cdDtlId    ;
	private String cdMstNm    ;
	private String cdDtlNm    ;
	private String cdSeq        ;
	private String cdPMstId  ;
	private String cdUseYn       ;
	public String getCdMstId() {
		return cdMstId;
	}
	public void setCdMstId(String cdMstId) {
		this.cdMstId = cdMstId;
	}
	public String getCdDtlId() {
		return cdDtlId;
	}
	public void setCdDtlId(String cdDtlId) {
		this.cdDtlId = cdDtlId;
	}
	public String getCdMstNm() {
		return cdMstNm;
	}
	public void setCdMstNm(String cdMstNm) {
		this.cdMstNm = cdMstNm;
	}
	public String getCdDtlNm() {
		return cdDtlNm;
	}
	public void setCdDtlNm(String cdDtlNm) {
		this.cdDtlNm = cdDtlNm;
	}
	public String getCdSeq() {
		return cdSeq;
	}
	public void setCdSeq(String cdSeq) {
		this.cdSeq = cdSeq;
	}
	public String getCdPMstId() {
		return cdPMstId;
	}
	public void setCdPMstId(String cdPMstId) {
		this.cdPMstId = cdPMstId;
	}
	public String getCdUseYn() {
		return cdUseYn;
	}
	public void setCdUseYn(String cdUseYn) {
		this.cdUseYn = cdUseYn;
	}
	@Override
	public String toString() {
		return "CodeVO [cdMstId=" + cdMstId + ", cdDtlId=" + cdDtlId + ", cdMstNm=" + cdMstNm + ", cdDtlNm=" + cdDtlNm
				+ ", cdSeq=" + cdSeq + ", cdPMstId=" + cdPMstId + ", cdUseYn=" + cdUseYn + "]";
	}
	
	
}
