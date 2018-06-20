package com.summer.agecompare.domain;

import com.summer.comm.DTO;

public class Agecompare{
	private String id;
	private String ano;
	private String categoryId;
	private String aDate;
	private String item;
	private String amount;
	private String accountId;
	private String tradeId;
	
	private String userId;
	private String name;
	private String birth;
	private String age;
	
	private String idTotal;
	private String total;
	private String ageTotal;
	
	private String startDate;
	private String endDate;
	

	public Agecompare() {}



	public Agecompare(String id, String ano, String categoryId, String aDate, String item, String amount,
			String accountId, String tradeId, String userId, String name, String birth, String age, String idTotal,
			String total, String ageTotal, String startDate, String endDate) {
		super();
		this.id = id;
		this.ano = ano;
		this.categoryId = categoryId;
		this.aDate = aDate;
		this.item = item;
		this.amount = amount;
		this.accountId = accountId;
		this.tradeId = tradeId;
		this.userId = userId;
		this.name = name;
		this.birth = birth;
		this.age = age;
		this.idTotal = idTotal;
		this.total = total;
		this.ageTotal = ageTotal;
		this.startDate = startDate;
		this.endDate = endDate;
	}



	@Override
	public String toString() {
		return "Agecompare [id=" + id + ", ano=" + ano + ", categoryId=" + categoryId + ", aDate=" + aDate + ", item="
				+ item + ", amount=" + amount + ", accountId=" + accountId + ", tradeId=" + tradeId + ", userId="
				+ userId + ", name=" + name + ", birth=" + birth + ", age=" + age + ", idTotal=" + idTotal + ", total="
				+ total + ", ageTotal=" + ageTotal + ", startDate=" + startDate + ", endDate=" + endDate + "]";
	}



	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getEndDate() {
		return endDate;
	}


	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	public String getAmount() {
		return amount;
	}

	public void setAmount(String amount) {
		this.amount = amount;
	}
	
	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getAno() {
		return ano;
	}


	public void setAno(String ano) {
		this.ano = ano;
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


	public String getUserId() {
		return userId;
	}


	public void setUserId(String userId) {
		this.userId = userId;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}

	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getAge() {
		return age;
	}


	public void setAge(String age) {
		this.age = age;
	}

	public String getIdTotal() {
		return idTotal;
	}


	public void setIdTotal(String idTotal) {
		this.idTotal = idTotal;
	}


	public String getTotal() {
		return total;
	}


	public void setTotal(String total) {
		this.total = total;
	}



	public String getAgeTotal() {
		return ageTotal;
	}



	public void setAgeTotal(String ageTotal) {
		this.ageTotal = ageTotal;
	}
	
}