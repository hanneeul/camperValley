package com.kh.campervalley.admin.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/admin")
@Slf4j
public class AdminController {
	
	@GetMapping("/dashboard")
	public void dashboard() {}

	@GetMapping("/memberList")
	public void memberList() {}

	@GetMapping("/camperManagement")
	public void camperManagement() {}

	@GetMapping("/usedProductManagement")
	public void usedProductManagement() {}

	@GetMapping("/reportManagement")
	public void reportManagement() {}

	

}
