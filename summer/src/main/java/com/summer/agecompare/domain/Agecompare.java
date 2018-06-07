package com.summer.agecompare.domain;

public class Agecompare {
	private String id;
	private String ano;
	private String categoryId;
	private String aDate;
	private String item;
	private String accountId;
	private String tradeId;
	
	private String userId;
	private String name;
	private String nickname;
	private String gender;
	private String birth;
	private String email;
	private String phone;
	
	
	public Agecompare() {}

	public Agecompare(String id, String ano, String categoryId, String aDate, String item, String accountId,
			String tradeId, String userId, String name, String nickname, String gender, String birth, String email,
			String phone) {
		super();
		this.id = id;
		this.ano = ano;
		this.categoryId = categoryId;
		this.aDate = aDate;
		this.item = item;
		this.accountId = accountId;
		this.tradeId = tradeId;
		this.userId = userId;
		this.name = name;
		this.nickname = nickname;
		this.gender = gender;
		this.birth = birth;
		this.email = email;
		this.phone = phone;
	}



	@Override
	public String toString() {
		return "Agecompare [id=" + id + ", ano=" + ano + ", categoryId=" + categoryId + ", aDate=" + aDate + ", item="
				+ item + ", accountId=" + accountId + ", tradeId=" + tradeId + ", userId=" + userId + ", name=" + name
				+ ", nickname=" + nickname + ", gender=" + gender + ", birth=" + birth + ", email=" + email + ", phone="
				+ phone + "]";
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


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public String getGender() {
		return gender;
	}


	public void setGender(String gender) {
		this.gender = gender;
	}


	public String getBirth() {
		return birth;
	}


	public void setBirth(String birth) {
		this.birth = birth;
	}


	public String getEmail() {
		return email;
	}


	public void setEmail(String email) {
		this.email = email;
	}


	public String getPhone() {
		return phone;
	}


	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	
	
}
