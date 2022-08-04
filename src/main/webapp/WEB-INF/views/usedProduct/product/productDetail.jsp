<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/productDetail.css"/>
<script src="https://kit.fontawesome.com/97c6ec6a69.js" crossorigin="anonymous"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<div id="section" style="width: 90%; margin:50px auto">
	<div class="detail_area">
	<div class="detail_div">
        <div class="cateHome">
        	 <i class="fa-solid fa-house-chimney"></i>
        	 <a href="${pageContext.request.contextPath}/usedProduct/main/index">중고거래 홈 &#10095;</a>
        </div>	
        <hr />
		<!----------------------------- 상단 상품정보 ----------------------------->
		<div class="detail-info__area">
			<div class="detail-info__div">
				<div class="detail-info__image__div">
					<input id="prodno" type="hidden" data-no="78">
					<!-- 이미지 리스트 -->
					<div class="slideshow-container">
						<div class="swiper-container detail-info__image__list">
							<div class="swiper-wrapper">
								<img src="${pageContext.request.contextPath}/resources/images/usedProduct/travlerPouch.jpg" class="rounded float-start" alt="상품이미지">
							</div>
							<!-- 확대 버튼-->
							<button class="detail-info__image--enlg">
								<i class="fas fa-search"></i> 확대
							</button>
							<div class="detail-info__image--prev swiper-button-next swiper-button-white" 
											style="top: -206px;" onclick="">&#10094;</div>
							<div class="detail-info__image--next swiper-button-prev swiper-button-white" 
											style="top: -227px; float: right;" onclick="">&#10095;</div>
							<!-- 슬라이더 버튼 수 -->
							<div class="swiper-pagination">
								<div class="paginationBtn" style="">
									<p>슬라이드쇼 페이지버튼</p>
									<!-- productDetail.js -->
								</div>
							</div>
							
							<!-- 확대버튼 하는 중 -->
							<div class="prodDetailImgWrap1">
								<div class="prodDetailImgWrap2"> 
									<button type="button" class="detailImg_closeBtn">
										<img src="" width="34" height="32" alt="닫기 버튼 아이콘">
									</button>
									<div class="detailImgListWrap">
										<div class="dtailImg_prodName"></div>
										<!-- 이미지 리스트 -->
										<div class="detailImgList" > 
											<!-- productDetail.js -->
										</div>
										<div class="detailImg_buttonWrap">
											<!-- productDetail.js -->
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="detail-info__text__div">
					<div class="detail-info__text__div2">
						<div class="detail-info__text__div3">
							<div class="detail-info__text-header">
								<!-- 상품명 -->
								<div class="detail-info__text-title">실리만 캠핑 트래블러 파우치 세트</div>
								<div class="detail-info__text-price__div">
									<!-- 상품가격 -->
									<div class="detail-info__price" id="product_price">
									59,000원</div>
								</div>
							</div>
							<div class="detail-info__text-body">
								<div class="detail-info__text-body-top">
									<!-- 찜, 조회수, 시간 -->
									<div class="detail-info__text-body-topL">
										<div class="detail-info--topL-item">
											<i class="fas fa-heart" style="width: 16px; height: 16px;"></i>
											<!-- 찜 수 -->
											<div id="zzim"></div>
										</div>
										<div class="detail-info--topL-item">
											<i class="fa-solid fa-eye"></i>
											<!-- 상품 조회수 -->
											<div id="view"></div>
										</div>
										<div class="detail-info--topL-item">
											<i class="fa-solid fa-clock-rotate-left"></i>
											<!-- 시간 -->
											<div id="product_logtime"></div> 
										</div>
									</div>
								</div>
								<div class="detail-info__text-body-bottom">
									<!-- 아이템 한개 -->
									<div class="detail-info__text-body-bItem">
										<div class="detail-info__text-body-bItem-title">배송비</div>
										<!-- 배송비 -->
										<div class="detail-info__delivery" id="product_delivery_fee"></div>
									</div>
									<div class="detail-info__text-body-bItem">
										<div class="detail-info__text-body-bItem-title">거래지역</div>
										<!-- 거래지역 -->
										<div class="detail-info__location" id="product_location"></div>
									</div>
								</div>
							</div>
						</div>
						<div class="detail-info__btn-list">
							<!-- productDetail.js -->
							<!-- 찜 메세지 -->
							
						</div>
					</div>
				</div>
			</div>
		</div>
		
		<!----------------------------- 하단 상품정보 ----------------------------->
		<div id="btmProdInfo_Wrap1">
			<div id="btmProdInfo_Wrap2">
				<!-- '상품정보'-->
				<div class="btmProdInfo_TitleWrap">
					<div class="btmProdInfo_Title" style="font-weight: bold; font-size:20px;">
						상품정보 <span class="btmProdInfo_TitleSpan"></span>
					</div>
				</div><!-- // TitleWrap -->
				
				<!-- 상품정보  -->
				<div class="prodInfo_wrap1">
					<div class="prodInfo_wrap2">
						<div class="prodInfo_Content_Title">상품정보</div>
						<div class="prodInfo_contentWrap">
							<div class="content_marginTop"></div>
							<!-- 상품내용 -->
							<div class="prodInfo_contentText">
								<!-- productDetail.js -->
							</div>
							<!-- 지역, 카테고리, 상품태그 -->
							<div class="prodInfo_detailWrap1">
								<!-- 지역 -->
								<div class="prodInfo_detailWrap2">
									<div class="detailTitleWrap">
										<img src="" width="16" height="18" alt="거래지역 아이콘">
										거래지역
									</div>
									<div class="detailContentWrap">
										<div class="detailContent_location">
											<!-- productDetail.js -->
										</div>
									</div>
								</div>
								<!-- 카테고리 -->
								<div class="prodInfo_detailWrap2">
									<div class="detailTitleWrap">
										<img src="" width="16" height="18" alt="카테고리 아이콘">
										카테고리
									</div>
									<div class="detailContentWrap">
										<a href="#">
											<span class="detailContent_cate">
												<!-- productDetail.js -->
											</span>
										</a>
									</div>
								</div>
								<!-- 상품태그 -->
								<div class="prodInfo_detailWrap2">
									<div class="detailTitleWrap">
										<img src="" width="15" height="18" alt="상품태그 아이콘">
										상품태그
									</div>
									<div class="detailContentWrap_hash">
										<!-- productDetail.js -->
									</div>
								</div>
							</div>
						</div>
					</div>
				</div><!-- //prodInfo_wrap1 -->
			</div><!-- //btmProdInfo_Wrap2 -->
				
			<div class="prodInfo_RightWrap">
				<!-- 판매자가 올린 최신 상품 3개  -->
				<div class="storeInfo_productWrap">
					<!-- productDetail.js -->
				</div>
				<div class="storeInfo_moreProd">
					<a class="moreProdLink" href="#">
						<span class="moreProdLink_Num"></span>
						상품 더보기
					</a>
				</div>
			</div>
		</div>
	 </div>
   </div>
</div>

<script>
// 슬라이더 관련
var slideIndex = 0; // slide index
function currentSlide(n) {
	  slideIndex = n;
	  showSlides(slideIndex);
	}
	
function moveSlides(n) { // Next/previous controls
  slideIndex = slideIndex + n
  showSlides(slideIndex);
}
function showSlides(n) {
    var slides = document.getElementsByClassName("swiper-slide");
    var dots = document.getElementsByClassName("dot");
    var size = slides.length;
    if ((n+1) > size) {
      slideIndex = 0; n = 0;
    }else if (n < 0) {
      slideIndex = (size-1);
      n = (size-1);
    }
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
	
    slides[n].style.display = "block";
    dots[n].className += " active";
  }
</script>