package com.kh.campervalley.usedProduct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.usedProduct.model.service.UsedProductService;


@Controller
@RequestMapping(value = "/usedProduct")
public class UsedProductController {

	@Autowired
	private UsedProductService usedProductService;
	
	@GetMapping("/main/mainPage")
	public void index() {};
	
	@GetMapping("/main/searchDisplay")
	public void searchDisplay() {};
	
	@GetMapping("/main/cateDisplay")
	public void cateDisplay() {};
	
	@GetMapping("/product/productDetail")
	public void productDetail() {};
}
