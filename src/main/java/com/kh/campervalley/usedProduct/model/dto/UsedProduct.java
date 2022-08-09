package com.kh.campervalley.usedProduct.model.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class UsedProduct {

	private int product_no;
	private String seller_id;
	private int cate_no;
	private String product_title;
	private String product_content;
	private String product_img1;
	private String product_img2;
	private String product_img3;
	private String product_img4;
	private String product_img5;
	private String product_price;
	private String product_location;
	private int product_delivery_fee;
	private String product_enroll_date;
	private int product_views;
	private Date transaction_date;
	private String buyer_id;
	private String is_delete;
	
}
