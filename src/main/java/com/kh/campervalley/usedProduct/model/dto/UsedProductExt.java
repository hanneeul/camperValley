package com.kh.campervalley.usedProduct.model.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsedProductExt extends UsedProduct {

	private int reviewNo;
	private int starScore;
	private String content;
}
