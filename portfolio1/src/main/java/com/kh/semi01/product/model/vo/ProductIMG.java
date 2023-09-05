package com.kh.semi01.product.model.vo;

public class ProductIMG {
	
	private int productNo;
	private String posterName;
	private String detail1Name;
	private String detail2Name;
	private String detail3Name;
	private String detail4Name;
	private String detail5Name;
	private String imagePath;
	
	public ProductIMG() {}

	public ProductIMG(int productNo, String posterName, String detail1Name, String detail2Name, String detail3Name,
			String detail4Name, String detail5Name, String imagePath) {
		super();
		this.productNo = productNo;
		this.posterName = posterName;
		this.detail1Name = detail1Name;
		this.detail2Name = detail2Name;
		this.detail3Name = detail3Name;
		this.detail4Name = detail4Name;
		this.detail5Name = detail5Name;
		this.imagePath = imagePath;
	}

	public int getProductNo() {
		return productNo;
	}

	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}

	public String getPosterName() {
		return posterName;
	}

	public void setPosterName(String posterName) {
		this.posterName = posterName;
	}

	public String getDetail1Name() {
		return detail1Name;
	}

	public void setDetail1Name(String detail1Name) {
		this.detail1Name = detail1Name;
	}

	public String getDetail2Name() {
		return detail2Name;
	}

	public void setDetail2Name(String detail2Name) {
		this.detail2Name = detail2Name;
	}

	public String getDetail3Name() {
		return detail3Name;
	}

	public void setDetail3Name(String detail3Name) {
		this.detail3Name = detail3Name;
	}

	public String getDetail4Name() {
		return detail4Name;
	}

	public void setDetail4Name(String detail4Name) {
		this.detail4Name = detail4Name;
	}

	public String getDetail5Name() {
		return detail5Name;
	}

	public void setDetail5Name(String detail5Name) {
		this.detail5Name = detail5Name;
	}

	public String getImagePath() {
		return imagePath;
	}

	public void setImagePath(String imagePath) {
		this.imagePath = imagePath;
	}

	@Override
	public String toString() {
		return "ProductIMG [productNo=" + productNo + ", posterName=" + posterName + ", detail1Name=" + detail1Name
				+ ", detail2Name=" + detail2Name + ", detail3Name=" + detail3Name + ", detail4Name=" + detail4Name
				+ ", detail5Name=" + detail5Name + ", imagePath=" + imagePath + "]";
	}
	
	
	
	
}
