package com.kh.semi01.user.model.vo;

public class User {
	
	private int userNo; 			// 회원번호
	private String userId; 			// 회원아이디
	private String userPwd; 		// 회원비밀번호
	private String userName; 		// 회원명
	private String userBirth; 		// 생년월일 => 입출력을 자유롭게 하기 위해서 String으로
	private String interestMovie; 	// 관심_영화(1~4) => 조회시 카테고리명 | 입력시 카테고리번호
	private String interestDisplay; // 관심_전시(5~8) => 조회시 카테고리명 | 입력시 카테고리번호
	private String interestShow; 	// 관심_공연(9~12) => 조회시 카테고리명 | 입력시 카테고리번호
	private String email; 			// 이메일
	private String phone; 			// 전화번호
	private String grade; 			// 회원등급 => 조회시 등급명 | 입력시 등급번호
	private String status; 			// 탈퇴여부(Y,N)
	
	// 기본 생성자
	public User() {}

	// 전체 매개변수 생성자
	public User(int userNo, String userId, String userPwd, String userName, String userBirth, String interestMovie,
			String interestDisplay, String interestShow, String email, String phone, String grade, String status) {
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
		this.grade = grade;
		this.status = status;
	}

	
	public User(String userId, String userPwd, String userName, String userBirth, String interestMovie,
			String interestDisplay, String interestShow, String email, String phone) {
		super();
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
		this.userBirth = userBirth;
		this.interestMovie = interestMovie;
		this.interestDisplay = interestDisplay;
		this.interestShow = interestShow;
		this.email = email;
		this.phone = phone;
	}

	// 회원정보 변경용 매개변수 생성자
	public User(int userNo, String userName, String interestMovie, String interestDisplay, String interestShow,
			String email, String phone) {
		super();
		this.userNo = userNo;
		this.userName = userName;
		this.interestMovie = interestMovie;
		this.interestDisplay = interestDisplay;
		this.interestShow = interestShow;
		this.email = email;
		this.phone = phone;
	}

	// getter-setter 메소드
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

	public String getGrade() {
		return grade;
	}

	public void setGrade(String gradeNo) {
		this.grade = gradeNo;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	// toString() 메소드
	@Override
	public String toString() {
		return "User [userNo=" + userNo + ", userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName
				+ ", userBirth=" + userBirth + ", interestMovie=" + interestMovie + ", interestDisplay="
				+ interestDisplay + ", interestShow=" + interestShow + ", email=" + email + ", phone=" + phone
				+ ", grade=" + grade + ", status=" + status + "]";
	}

}
