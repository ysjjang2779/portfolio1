package com.kh.semi01.product.model.vo;

public class Product {
	
	private int productNo; 			// 상품번호
	private String category; 		// 카테고리 => 조회시 카테고리명 | 입력시 카테고리 타입
	private String productTitle;	// 상품명
	private String local; 			// 지역 => 조회시 지역명 | 입력시 지역번호
	private String address; 		// 상세주소
	private String startPeriod; 	// 시작날짜 => 입출력을 자유롭게 하기 위해서 String으로
	private String endPeriod; 		// 종료날짜 => 입출력을 자유롭게 하기 위해서 String으로
	private String productLevel; 	// 관람등급 => 조회시 관람등급명 | 입력시 관람등급번호
	private int runTime; 			// 상영시간
	private int price; 				// 가격
	private String imagePath;
	private String posterName;
	
	// 기본 생성자
	public Product() {}

	// 전체 매개변수 생성자
	public Product(int productNo, String category, String productTitle, String local, String address,
			String startPeriod, String endPeriod, String productLevel, int runTime, int price, String posterPath) {
		super();
		this.productNo = productNo;
		this.category = category;
		this.productTitle = productTitle;
		this.local = local;
		this.address = address;
		this.startPeriod = startPeriod;
		this.endPeriod = endPeriod;
		this.productLevel = productLevel;
		this.runTime = runTime;
		this.price = price;
		
	}
	
	// searchProduct 생성자
	public Product(int productNo, String productTitle, String address, String startPeriod, String endPeriod,
			int price, String imagePath, String posterName) {
		super();
		this.productNo = productNo;
		this.productTitle = productTitle;
		this.address = address;
		this.startPeriod = startPeriod;
		this.endPeriod = endPeriod;
		this.price = price;
		this.imagePath = imagePath;
		this.posterName = posterName;
	}
	

	// getter-setter 메소드
	
	
	public int getProductNo() {
		return productNo;
	}


	public String getPosterName() {
		return posterName;
	}

	public void setPosterName(String posterName) {
		this.posterName = posterName;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public void setProductTitle(String productTitle) {
		this.productTitle = productTitle;
	}

	public String getLocal() {
		return local;
	}

	public void setLocal(String local) {
		this.local = local;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getStartPeriod() {
		return startPeriod;
	}

	public void setStartPeriod(String startPeriod) {
		this.startPeriod = startPeriod;
	}

	public String getEndPeriod() {
		return endPeriod;
	}

	public void setEndPeriod(String endPeriod) {
		this.endPeriod = endPeriod;
	}

	public String getProductLevel() {
		return productLevel;
	}

	public void setProductLevel(String productLevel) {
		this.productLevel = productLevel;
	}

	public int getRunTime() {
		return runTime;
	}

	public void setRunTime(int runTime) {
		this.runTime = runTime;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImage(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "Product [productNo=" + productNo + ", category=" + category + ", productTitle=" + productTitle
				+ ", local=" + local + ", address=" + address + ", startPeriod=" + startPeriod + ", endPeriod="
				+ endPeriod + ", productLevel=" + productLevel + ", runTime=" + runTime + ", price=" + price
				+ ", imagePath=" + imagePath + ", posterName=" + posterName + "]";
	}

	// toString() 메소드
	
	
	
}
