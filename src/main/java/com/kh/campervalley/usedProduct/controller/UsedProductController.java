package com.kh.campervalley.usedProduct.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.campervalley.usedProduct.model.service.UsedProductService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping(value = "/usedProduct")
public class UsedProductController  {
	
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
	
	@GetMapping("/product/productEnroll")
	public void productEnroll() {};
	
	@GetMapping("/product/productUpdate")
	public void productUpdate() {};
	
	@PostMapping("/chat/chat")
	public void chat() {};
	
	@PostMapping("/chat/chatList")
	public void chatList() {};
}
