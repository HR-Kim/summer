package com.summer.chart.domain;

public class Chart {
	private String chartUserId;		//사용자 ID
	private int year;					//년
	private int month;				//월
	private int day;					//일
	private String week;				//주간
	private String cdDtlNm;			//카테고리 별 이름
	private int ctgTotal;			//카테고리 별 총액
	private double percent;			//카테고리 별 퍼센트
	private int monthTotal;			//월 별 총액
	
	public Chart() { }

	public Chart(String chartUserId, int year, int month, int day, String week, String cdDtlNm, int ctgTotal,
			double percent, int monthTotal) {
		super();
		this.chartUserId = chartUserId;
		this.year = year;
		this.month = month;
		this.day = day;
		this.week = week;
		this.cdDtlNm = cdDtlNm;
		this.ctgTotal = ctgTotal;
		this.percent = percent;
		this.monthTotal = monthTotal;
	}

	public String getChartUserId() {
		return chartUserId;
	}

	public void setChartUserId(String chartUserId) {
		this.chartUserId = chartUserId;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}

	public int getMonth() {
		return month;
	}

	public void setMonth(int month) {
		this.month = month;
	}

	public int getDay() {
		return day;
	}

	public void setDay(int day) {
		this.day = day;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getCdDtlNm() {
		return cdDtlNm;
	}

	public void setCdDtlNm(String cdDtlNm) {
		this.cdDtlNm = cdDtlNm;
	}

	public int getCtgTotal() {
		return ctgTotal;
	}

	public void setCtgTotal(int ctgTotal) {
		this.ctgTotal = ctgTotal;
	}

	public double getPercent() {
		return percent;
	}

	public void setPercent(double percent) {
		this.percent = percent;
	}

	public int getMonthTotal() {
		return monthTotal;
	}

	public void setMonthTotal(int monthTotal) {
		this.monthTotal = monthTotal;
	}

	@Override
	public String toString() {
		return "Chart [chartUserId=" + chartUserId + ", year=" + year + ", month=" + month + ", day=" + day + ", week="
				+ week + ", cdDtlNm=" + cdDtlNm + ", ctgTotal=" + ctgTotal + ", percent=" + percent + ", monthTotal="
				+ monthTotal + "]";
	}
}