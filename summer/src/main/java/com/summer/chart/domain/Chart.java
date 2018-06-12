package com.summer.chart.domain;

public class Chart {
	private String chartUserId;		//사용자 ID
	private int year;					//년
	private int month;				//월
	private int day;					//일
	
	private int weekStart;			//주_시작일
	private int weekEnd;				//주_끝일
	
	private String cdDtlNm;			//카테고리 별 이름
	private int ctgTotal;			//카테고리 별 총액
	private double percent;			//카테고리 별 퍼센트
	
	private int monthTotal;			//월 별 총액
	
	private int selFilter;			//xml에서 일/주/월 별 셀렉트박스를 보여주기 위한 변수
	
	public Chart() { }
	
	public Chart(String chartUserId) {
		this.chartUserId = chartUserId;
	}

	public Chart(String chartUserId, int year, int month, int day, int weekStart, int weekEnd, String cdDtlNm,
			int ctgTotal, double percent, int monthTotal, int selFilter) {
		super();
		this.chartUserId = chartUserId;
		this.year = year;
		this.month = month;
		this.day = day;
		this.weekStart = weekStart;
		this.weekEnd = weekEnd;
		this.cdDtlNm = cdDtlNm;
		this.ctgTotal = ctgTotal;
		this.percent = percent;
		this.monthTotal = monthTotal;
		this.selFilter = selFilter;
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

	public int getWeekStart() {
		return weekStart;
	}

	public void setWeekStart(int weekStart) {
		this.weekStart = weekStart;
	}

	public int getWeekEnd() {
		return weekEnd;
	}

	public void setWeekEnd(int weekEnd) {
		this.weekEnd = weekEnd;
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

	public int getSelFilter() {
		return selFilter;
	}

	public void setSelFilter(int selFilter) {
		this.selFilter = selFilter;
	}

	@Override
	public String toString() {
		return "Chart [chartUserId=" + chartUserId + ", year=" + year + ", month=" + month + ", day=" + day
				+ ", weekStart=" + weekStart + ", weekEnd=" + weekEnd + ", cdDtlNm=" + cdDtlNm + ", ctgTotal="
				+ ctgTotal + ", percent=" + percent + ", monthTotal=" + monthTotal + ", selFilter=" + selFilter + "]";
	}
}