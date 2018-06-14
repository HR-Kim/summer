package com.summer.comm;

public class SearchVO extends DTO {
	private String pageSize;		//페이지 사이즈
	private String pageNum;		//현재 페이지
	private String searchWord;	//검색어
	private String searchDiv;	//검색구분
	
	private String searchTrade; //지출,수입 구분
	private String searchCategory; //카테고리 구분
	private String searchAccount; //구분 
	
	public SearchVO() { }



	public String getSearchTrade() {
		return searchTrade;
	}



	public void setSearchTrade(String searchTrade) {
		this.searchTrade = searchTrade;
	}



	public String getSearchCategory() {
		return searchCategory;
	}



	public void setSearchCategory(String searchCategory) {
		this.searchCategory = searchCategory;
	}



	public String getSearchAccount() {
		return searchAccount;
	}



	public void setSearchAccount(String searchAccount) {
		this.searchAccount = searchAccount;
	}



	public String getPageSize() {
		return pageSize;
	}

	public void setPageSize(String pageSize) {
		this.pageSize = pageSize;
	}

	public String getPageNum() {
		return pageNum;
	}

	public void setPageNum(String pageNum) {
		this.pageNum = pageNum;
	}

	public String getSearchWord() {
		return searchWord;
	}

	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}

	public String getSearchDiv() {
		return searchDiv;
	}

	public void setSearchDiv(String searchDiv) {
		this.searchDiv = searchDiv;
	}

	public SearchVO(String pageSize, String pageNum, String searchWord, String searchDiv) {
		super();
		this.pageSize = pageSize;
		this.pageNum = pageNum;
		this.searchWord = searchWord;
		this.searchDiv = searchDiv;
	}



	@Override
	public String toString() {
		return "SearchVO [pageSize=" + pageSize + ", pageNum=" + pageNum + ", searchWord=" + searchWord + ", searchDiv="
				+ searchDiv + ", searchTrade=" + searchTrade + "]";
	}


	
	
}
