package com.summer.comm;

public class MessageVO {
	private String msgId; 	// 0 : 실패, 1 : 성공
	private String message; // 성공, 실패 메시지
	
	private String uId; // 화면 form Id, validation 용도

	public String getMsgId() {
		return msgId;
	}

	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getuId() {
		return uId;
	}

	public void setuId(String uId) {
		this.uId = uId;
	}

	
}
