package com.kh.semi01.manager.model.vo;

public class Member {
	private int userNo;
	private String userId;
	private String userPwd;
	private String userName;
	private String userBirth;
	private String interestMovie;
	private String interestDisplay;
	private String interestShow;
	private String email;
	private String phone;
	private String gradeNo;
	private String status;
	
	public Member() {}

	public Member(int userNo, String userId, String userPwd, String userName, String userBirth, String interestMovie,
			String interestDisplay, String interestShow, String email, String phone, String gradeNo, String status) {
		super();
		this.userNo = userNo;
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.interestMovie = interestMovie;
		this.interestDisplay = interestDisplay;
		this.interestShow = interestShow;
		this.email = email;
		this.phone = phone;
		this.gradeNo = gradeNo;
		this.status = status;
	}

	public int getUserNo() {
		return userNo;
	}

	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserBirth() {
		return userBirth;
	}

	public void setUserBirth(String userBirth) {
		this.userBirth = userBirth;
	}

	public String getInterestMovie() {
		return interestMovie;
	}

	public void setInterestMovie(String interestMovie) {
		this.interestMovie = interestMovie;
	}

	public String getInterestDisplay() {
		return interestDisplay;
	}

	public void setInterestDisplay(String interestDisplay) {
		this.interestDisplay = interestDisplay;
	}

	public String getInterestShow() {
		return interestShow;
	}

	public void setInterestShow(String interestShow) {
		this.interestShow = interestShow;
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

	public String getGradeNo() {
		return gradeNo;
	}

	public void setGradeNo(String gradeNo) {
		this.gradeNo = gradeNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "Member [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", interestMovie=" + interestMovie + ", interestDisplay="
				+ interestDisplay + ", interestShow=" + interestShow + ", email=" + email + ", phone=" + phone
				+ ", gradeNo=" + gradeNo + ", status=" + status + "]";
	}
}
