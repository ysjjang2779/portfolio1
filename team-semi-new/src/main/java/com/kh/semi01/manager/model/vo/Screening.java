package com.kh.semi01.manager.model.vo;

public class Screening {
	private int product_no;
	private String screeningDate;
	private String dayTime;
	private String nightTime;
	private int daySeat;
	private int nightSeat;
	
	public Screening() {}

	public Screening(int product_no, String screeningDate, String dayTime, String nightTime, int daySeat,
			int nightSeat) {
		super();
		this.product_no = product_no;
		this.screeningDate = screeningDate;
		this.dayTime = dayTime;
		this.nightTime = nightTime;
		this.daySeat = daySeat;
		this.nightSeat = nightSeat;
	}

	public int getProduct_no() {
		return product_no;
	}

	public void setProduct_no(int product_no) {
		this.product_no = product_no;
	}

	public String getScreeningDate() {
		return screeningDate;
	}

	public void setScreeningDate(String screeningDate) {
		this.screeningDate = screeningDate;
	}

	public String getDayTime() {
		return dayTime;
	}

	public void setDayTime(String dayTime) {
		this.dayTime = dayTime;
	}

	public String getNightTime() {
		return nightTime;
	}

	public void setNightTime(String nightTime) {
		this.nightTime = nightTime;
	}

	public int getDaySeat() {
		return daySeat;
	}

	public void setDaySeat(int daySeat) {
		this.daySeat = daySeat;
	}

	public int getNightSeat() {
		return nightSeat;
	}

	public void setNightSeat(int nightSeat) {
		this.nightSeat = nightSeat;
	}

	@Override
	public String toString() {
		return "Screening [product_no=" + product_no + ", screeningDate=" + screeningDate + ", dayTime=" + dayTime
				+ ", nightTime=" + nightTime + ", daySeat=" + daySeat + ", nightSeat=" + nightSeat + "]";
	}
}
