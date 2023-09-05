package com.kh.semi01.manager.model.vo;

import java.util.Arrays;

public class DataClass {
    private int[] numbers;

    public int[] getNumbers() {
        return numbers;
    }

    public void setNumbers(int[] numbers) {
        this.numbers = numbers;
    }

	@Override
	public String toString() {
		return "DataClass [numbers=" + Arrays.toString(numbers) + "]";
	}
}