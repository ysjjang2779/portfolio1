package com.kh.semi01.manager.model.vo;

public class Select {
	private int categoryType;
	private String categoryName;
	
	public Select() {}

	public Select(int categoryType, String categoryName) {
		super();
		this.categoryType = categoryType;
		this.categoryName = categoryName;
	}

	public int getCategoryType() {
		return categoryType;
	}

	public void setCategoryType(int categoryType) {
		this.categoryType = categoryType;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	@Override
	public String toString() {
		return "Select [categoryType=" + categoryType + ", categoryName=" + categoryName + "]";
	}
}
