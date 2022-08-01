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
	
	@GetMapping("/index")
	public void usedProductIndex() {};
}
