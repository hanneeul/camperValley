package com.kh.campervalley.usedProduct.controller;

import java.io.File;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.campervalley.common.CamperValleyUtils;
import com.kh.campervalley.member.model.dto.Member;
import com.kh.campervalley.usedProduct.model.dto.ProductCategory;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;
import com.kh.campervalley.usedProduct.model.service.UsedProductService;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping(value = "/usedProduct")
public class UsedProductController  {
	@Autowired
    ServletContext application;
	
	@Autowired
	private UsedProductService usedProductService;

	/* 상품 등록 */
	@GetMapping("/product/registForm")
	public void registForm() {;
	};
	
	@PostMapping("/product/productEnroll")
	@ResponseBody // json
	public String productEnroll(@ModelAttribute UsedProduct usedProduct, 
										@RequestParam("productImg") MultipartFile[] upFiles, @AuthenticationPrincipal Member loginMember) {
		// 이미지 파일 복사
		String saveDirectory = application.getRealPath("/resources/upload/usedProduct");

		File file;
		
        ModelAndView mav;
		try {
			for(int i = 0; i < upFiles.length; i++) {
			    if(upFiles[i].getSize() > 0) {
			        String originalFilename = upFiles[i].getOriginalFilename();
			        String renamedFilename = CamperValleyUtils.getRenamedFilename(originalFilename);
			        log.debug("renamedFilename = {}", renamedFilename);
			        
			        File destFile = new File(saveDirectory, renamedFilename);
			        upFiles[i].transferTo(destFile);
			        
			        switch(i) {
			        case 0 : usedProduct.setProductImg1(renamedFilename); break;
			        case 1 : usedProduct.setProductImg2(renamedFilename); break;
			        case 2 : usedProduct.setProductImg3(renamedFilename); break;
			        case 3 : usedProduct.setProductImg4(renamedFilename); break;
			        case 4 : usedProduct.setProductImg5(renamedFilename); break;
			        }   
			    }
			}
			
			// 로그인한 회원의 아이디
			usedProduct.setSellerId(loginMember.getMemberId()); 
			
			log.debug("usedProduct = {}", usedProduct);
			
			// DB 
			int result = usedProductService.productInsert(usedProduct);
			log.debug("after usedProduct = {}", usedProduct);
			
			// 최근 거래지역
//		String sellerId = principal.getName();
//		String recentLocation = usedProduct.getProductLocation();
//		Map<String, String> map = new HashMap<String, String>();
//		map.put("sellerId", sellerId);
//		map.put("recentLocation", recentLocation);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/WEB-INF/views/usedProduct/product/productDetail?no=" + usedProduct.getProductNo();
	};
	
	/* 메인페이지 */
	@GetMapping("/main/mainPage")
	public String mainPage() {
		return "/usedProduct/main/mainPage";
		
	};
	
	@PostMapping("/main/getProductList") 
	@ResponseBody
	public ModelAndView getProductList(@RequestParam(name = "page") int page) {
		List<UsedProduct> list = usedProductService.getProductList(page);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@GetMapping("/main/cateDisplay")
	public ModelAndView cateDisplay(ModelAndView mav,
					@RequestParam(value = "page", required=false, defaultValue = "0") String page,
					@RequestParam(value = "cateNo") String cateNo,
					@RequestParam(value = "order", required=false) String order) {
		usedProductService.cateProductList(cateNo, Integer.parseInt(page), order, mav);
		
		mav.addObject("display", "/usedProduct/main/cateDisplay.jsp");
		mav.setViewName("usedProduct/main/mainPage");
		
		return mav;
	}
	
	//카테고리 세부 값 가져오기
	@PostMapping("/main/cateList")
	@ResponseBody
	public ModelAndView cateList() {
		List<ProductCategory> list = usedProductService.cateList();

		ModelAndView mav = new ModelAndView();
		mav.addObject("list", list);
		mav.setViewName("jsonView");
		return mav;
	}
	
	@GetMapping("/main/searchDisplay")
	public void searchDisplay() {};

	
	@GetMapping("/product/getProductDetail")
	public void productDetail() {};
	
	@GetMapping("/product/productUpdate")
	public void productUpdate() {};
	
	@PostMapping("/chat/chat")
	public void chat() {};
	
	@PostMapping("/chat/chatList")
	public void chatList() {};
}
