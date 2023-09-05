package com.kh.semi01.manager.model.vo;

public class Review {
	private int rno;
	private int pno;
	private String content;
	private int userNo;
	private String reviewDate;
	
	public Review() {}

	public Review(int rno, int pno, String content, int userNo, String reviewDate) {
		super();
		this.rno = rno;
		this.pno = pno;
		this.content = content;
		this.userNo = userNo;
		this.reviewDate = reviewDate;
	}

	public int getRno() {
		return rno;
	}

	public void setRno(int rno) {
		this.rno = rno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	@Override
	public String toString() {
		return "Review [rno=" + rno + ", pno=" + pno + ", content=" + content + ", userNo=" + userNo + ", reviewDate="
				+ reviewDate + "]";
	}
}
