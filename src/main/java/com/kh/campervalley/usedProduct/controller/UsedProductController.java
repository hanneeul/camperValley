package com.kh.campervalley.usedProduct.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.campervalley.common.CamperValleyUtils;
import com.kh.campervalley.member.model.dto.Member;
import com.kh.campervalley.mypage.advertiser.model.dto.AdZone;
import com.kh.campervalley.mypage.advertiser.model.dto.AdvertisementExt;
import com.kh.campervalley.mypage.advertiser.model.service.AdvertiserService;
import com.kh.campervalley.usedProduct.model.dto.ProductCategory;
import com.kh.campervalley.usedProduct.model.dto.UsedProduct;
import com.kh.campervalley.usedProduct.model.dto.WishProduct;
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
	
	@Autowired
	private AdvertiserService advertiserService;

	/* 메인페이지 */
	@GetMapping("/main/mainPage")
	public ModelAndView mainPage(ModelAndView mav) {
		try {
			List<AdvertisementExt> adList = advertiserService.getDisplayAdList(3, AdZone.usedProductHome);
			log.debug("adList = {}", adList);
			
			mav.addObject("adList", adList);
		} catch (Exception e) {
			log.error("광고목록 조회 오류", e);
			throw e;
		}
		return mav;
	};
	
	/* 상품 등록 */
	@GetMapping("/product/registForm")
	public void registForm() {};
	
	@PostMapping("/product/productEnroll")
	@ResponseBody
	public ModelAndView productEnroll(@ModelAttribute UsedProduct usedProduct, RedirectAttributes redirectAttr,
										@RequestParam MultipartFile[] upFiles, @AuthenticationPrincipal Member loginMember) {
		// 이미지 파일 복사
		String saveDirectory = application.getRealPath("/resources/upload/usedProduct");

		File file;
		
			for(int i = 0; i <= upFiles.length - 1; i++) {
				String fileName = upFiles[i].getOriginalFilename();
				file = new File(saveDirectory, fileName);
				
				try {
					FileCopyUtils.copy( upFiles[i].getInputStream(), new FileOutputStream(file));
				} catch (Exception e) {
					e.printStackTrace();
				}
			       
			        if(i == 0) usedProduct.setProductImg1(fileName);
			        else if(i == 1) usedProduct.setProductImg2(fileName);
			        else if(i == 2)  usedProduct.setProductImg3(fileName);
			        else if(i == 3)  usedProduct.setProductImg4(fileName);
			        else if(i == 4)  usedProduct.setProductImg5(fileName);
			        
			}
			// 로그인한 회원의 아이디
			usedProduct.setSellerId(loginMember.getMemberId()); 
			
			log.debug("usedProduct = {}", usedProduct);
			
			// DB 
			int result = usedProductService.productInsert(usedProduct);
			
			ModelAndView mav = new ModelAndView();
			mav.setViewName("jsonView");
			return mav;
	
	};

	/* 카테고리 검색 */
	@PostMapping("/main/getProductList") 
	@ResponseBody
	public ModelAndView getProductList(@RequestParam(name = "page") int page, @RequestParam(name = "adCount") int beforeAd) {
		ModelAndView mav = new ModelAndView();
		List<AdvertisementExt> feedAdList = advertiserService.getDisplayFeedAdList(beforeAd, 10, AdZone.usedProductFeed);
		mav.addObject("feedAdList", feedAdList);
		int adListSize = beforeAd + feedAdList.size();
		
		List<UsedProduct> list = usedProductService.getProductList(page, adListSize);
		
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
		
		List<AdvertisementExt> adList = advertiserService.getDisplayAdList(3, AdZone.usedProductHome);
		log.debug("adList = {}", adList);
		
		mav.addObject("adList", adList);
		
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
	
	/* 검색어 검색 */
	@GetMapping("/main/searchDisplay")
	public String searchDisplay(Model model, @RequestParam(value = "keyword") String keyword,
								@RequestParam(value = "page", required = false, defaultValue = "0") String page,
								@RequestParam(value = "order", required = false) String order) {
		
		usedProductService.searchProductList(keyword, Integer.parseInt(page), order, model);
		
		// 검색어
		String searchResult="";
		
		if (keyword.substring(0, 1).equals("@")) {
			searchResult = " 회원이 올린 상품";			
		} else {
			searchResult = " 의 검색 결과";
		}
		
		List<AdvertisementExt> adList = advertiserService.getDisplayAdList(3, AdZone.usedProductHome);
		log.debug("adList = {}", adList);
		
		model.addAttribute("adList", adList);
		
		model.addAttribute("searchResult", searchResult);
		model.addAttribute("display", "/usedProduct/main/searchDisplay.jsp");
		
		return "/usedProduct/main/mainPage";
		
	};
	
	/* 상품 상세보기 - 상품 정보 */
	// 상품 리스트 - > 상세페이지
	@GetMapping("/product/productDetail")
	public String productDetail(@RequestParam String no, Model model) {

		usedProductService.viewUpdate(no); //조회수 증가
		
		// 상품 정보 받아옴
		UsedProduct usedProduct = usedProductService.productDetail(no);
		
		model.addAttribute("usedProduct", usedProduct);
		model.addAttribute("/usedProduct/product/productDetail.jsp");
		return "/usedProduct/product/productDetail";
	}
	
	@GetMapping("/product/productUpdate")
	public void productUpdate() {};
	
	@PostMapping("/chat/chat")
	public void chat() {};
	
	@PostMapping("/chat/chatList")
	public void chatList() {};

	/* 관심상품 */
	@GetMapping("/product/findHeart")
	@ResponseBody
	public ModelAndView findHeart( @RequestParam String productNo, @AuthenticationPrincipal Member loginMember) {
		String memberId = loginMember.getMemberId();
		
		Map<String, Object> map = new HashMap<>();
		map.put("productNo", Integer.parseInt(productNo));
		map.put("memberId", memberId);
		
		WishProduct wishProduct = usedProductService.findHeart(map);
		System.out.println("wishProduct" + wishProduct);
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("wishProduct", wishProduct);		
		mav.setViewName("jsonView");
		return mav;
	}
			
	@GetMapping("/product/saveHeart")
	@ResponseBody
	public UsedProduct saveHeart(@RequestParam String productNo, @AuthenticationPrincipal Member loginMember) {
		WishProduct wishProduct = new WishProduct();
		
		// 글 번호 세팅
		wishProduct.setProductNo(Integer.parseInt(productNo));
		
		// memberId 세팅
		wishProduct.setMemberId(loginMember.getMemberId());
		
		// +1된 하트 갯수 가져오기
		UsedProduct usedProduct = usedProductService.saveHeart(wishProduct, productNo);
		
		return usedProduct;
	}
	
	@GetMapping("/product/removeHeart")
	@ResponseBody
	public UsedProduct removeHeart(@RequestParam String productNo, @AuthenticationPrincipal Member loginMember) {
		WishProduct wishProduct = new WishProduct();
		
		// 글 번호 세팅
		wishProduct.setProductNo(Integer.parseInt(productNo));
		
		// memberId 세팅
		wishProduct.setMemberId(loginMember.getMemberId());
		
		// +1된 하트 갯수 가져오기
		UsedProduct usedProduct = usedProductService.removeHeart(wishProduct, productNo);
		
		return usedProduct;
	}
	
	/* 상품 삭제 */
	@PostMapping("/product/productDelete")
	public String productDelete(@RequestParam String productNo) throws Exception {	
		
		int result = usedProductService.productDelete(Integer.parseInt(productNo));		
		
		return "redirect:/usedProduct/main/mainPage";
	}
	
	/* 판매자 정보 */
	@GetMapping("/product/getSellerInfo")
	@ResponseBody
	public ModelAndView getSellerInfo(@RequestParam String productNo) {
		System.out.println(productNo);
		
		// 판매자
		Member member = usedProductService.getSellerInfo(Integer.parseInt(productNo));
		log.debug("member = {}", member);
		// 물건 총 개수
		int sellerProdNum = usedProductService.getSellerProdNum(Integer.parseInt(productNo));
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("profileImg", member.getProfileImg());
		mav.addObject("member", member);
		mav.addObject("sellerProdNum", sellerProdNum);
		mav.setViewName("jsonView");
		
		return mav;
	}
	
	/*----- JH START ----- */
	/* 판매자 정보 - 판매자 상품정보 목록 비동기 요청 */
	@GetMapping("/productList")
	public ModelAndView reviewList(
			@RequestParam(defaultValue = "1") int cPage,
			@RequestParam String memberId, 
			ModelAndView mav,
			HttpServletRequest request) {
		try {
			int numPerPage = UsedProductService.NUM_PER_PAGE_MODAL;
			List<UsedProduct> productList = usedProductService.selectProductListByMemberId(cPage, numPerPage, memberId);
			
			// 페이지바
			int totalContent = usedProductService.selectTotalProductByMemberId(memberId);
			String pagebar = CamperValleyUtils.getPagebarAsync(cPage, numPerPage, totalContent, request.getRequestURI());
			log.debug("totalContent = {}", totalContent);
			mav.addObject("productList", productList);
			mav.addObject("pagebar", pagebar);
			mav.setViewName("jsonView");
		} catch(Exception e) {
			log.error("판매자 판매상품 목록 조회 오류", e);
			throw e;
		}
		return mav;
	}
	/*----- JH END -----*/
}