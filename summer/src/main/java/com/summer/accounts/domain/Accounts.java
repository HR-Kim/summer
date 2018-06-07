package com.summer.accounts.domain;

import com.summer.comm.DTO;

public class Accounts extends DTO{
	private int ano;
	private String id;
	private String categoryId;
	private String aDate;
	private String item;
	private String accountId;
	private String tradeId;
	private int amount;
	private String memo;
	
	
	public Accounts() {
		
	}



	public int getAno() {
		return ano;
	}

	public void setAno(int ano) {
		this.ano = ano;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getaDate() {
		return aDate;
	}

	public void setaDate(String aDate) {
		this.aDate = aDate;
	}

	public String getItem() {
		return item;
	}

	public void setItem(String item) {
		this.item = item;
	}

	public String getAccountId() {
		return accountId;
	}

	public void setAccountId(String accountId) {
		this.accountId = accountId;
	}

	public String getTradeId() {
		return tradeId;
	}

	public void setTradeId(String tradeId) {
		this.tradeId = tradeId;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getMemo() {
		return memo;
	}

	public void setMemo(String memo) {
		this.memo = memo;
	}

	@Override
	public String toString() {
		return "AccountsVO [ano=" + ano + ", id=" + id + ", categoryId=" + categoryId + ", aDate=" + aDate + ", item="
				+ item + ", accountId=" + accountId + ", tradeId=" + tradeId + ", amount=" + amount + ", memo=" + memo
				+ "]";
	}
	
	
}
