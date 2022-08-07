<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/productDetail.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/sidebar.css"/>

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<div id="section" style="width: 90%; margin:50px auto">
	<div class="detail_area">
	<div class="detail_div">
        <div class="delete_update">
        	 <button id="delete_btn">삭제하기</button>
        	 <button id="update_btn" style="margin-right: 8px; background-color: #D8EBB5">수정하기</button>
        </div>
        <hr style="margin-top: 3rem; margin-bottom: 1rem;"/>
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
									<div class="detail-info__price" id="product_price">59,000원</div>
								</div>
							</div>
							<div class="detail-info__text-body">
								<div class="detail-info__text-body-top">
									<!-- 찜, 조회수, 시간 -->
									<div class="detail-info__text-body-topL">
										<div class="detail-info--topL-item">
											<i class="fa-regular fa-heart"></i>
											<!-- 찜 수 -->
											<div id="zzim"></div>
										</div>
										<div class="detail-info--topL-item">
											<i class="fa-regular fa-eye"></i>
											<!-- 상품 조회수 -->
											<div id="view"></div>
										</div>
										<div class="detail-info--topL-item">
											<i class="fa-regular fa-clock"></i>
											<!-- 시간 -->
											<div id="product_logtime"></div> 
										</div>
									</div>
								</div>
								<div class="detail-info__text-body-bottom">
									<div class="detail-info__text-body-bItem">
										<div class="detail-info__text-body-bItem-title">▪카테고리</div>
											<!-- 카테고리 -->
											<div class="detail-info__category" id="product_category"></div>
										</div>
									</div>
									<div class="detail-info__text-body-bItem">
										<div class="detail-info__text-body-bItem-title">▪배송비</div>
										<!-- 배송비 -->
										<div class="detail-info__delivery" id="product_delivery_fee"></div>
									</div>
									<div class="detail-info__text-body-bItem">
										<div class="detail-info__text-body-bItem-title">▪거래지역</div>
										<!-- 거래지역 -->
										<div class="detail-info__location" id="product_location"></div>
									</div>
									<div class="detail-info__text-body-bottom">
										<div class="detail-info__zzim-chat" style="display: flex;">
										   <!-- 관심상품(찜) -->
											   <div class="detail-info__zzim">
													<button type="submit" value="2" id="zzim_btn" style="margin-right: 10px; background-color: #3c3c3c;">
														<i class="fa-solid fa-heart" style="color: white"></i>							 
													관심상품</button>
											   </div>
										   <!-- 채팅하기 -->
										   <!-- post 날린 요청의 결과 chatRoom(윈도우 팝업창)에서 볼 수 있음 -->
										   <form 
										   		id="productDetailForm" method="post" action="/campervalley/usedProduct/chat/chat" target="chat">
										   		<div class="detail-info__chat" >
													<button type="submit" id="chat_btn" style="background-color: #2B380C">
														<i class="fa-solid fa-comment"></i>			 	
													채팅하기</button>
										   		</div>
										   </form>
										 </div>
									 </div>
								</div>
							</div>
						</div>
						<div class="detail-info__btn-list">
							<!-- productDetail.js -->
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
					<div class="btmProdInfo_Title" style="font-weight: bold; font-size: 1.2rem; letter-spacing: 3px;">
						상품정보<span class="btmProdInfo_TitleSpan"></span>
					</div>
				</div>
				
				<!-- 상품정보  -->
				<div class="prodInfo_wrap1">
					<div class="prodInfo_wrap2">
						<div class="prodInfo_contentWrap">
							<div class="content_marginTop"></div>
							<!-- 상품내용 -->
							<div class="prodInfo_contentText">
								▶️ 야외용 캠핑용 선풍기 무선선풍기 써큘레이터
								모델명: 스위스밀리터리 코브라이트
							
								▶️  판매상품은 미개봉 새상품입니다.
								번개페이로 구매하시면 11시이전 거래 다음날 수령가능!!
								
								❤필독❤  제품 궁굼사항 번개톡 메세지주세요
								
								😁누적 판매건수  4000건  / 거래후기 800건
								번장 최다판매 샵입니다
								
								미개봉새상품입니다
						 </div>
						 <!-- 지역, 카테고리, 상품태그 -->
						 <div class="prodInfo_detailWrap1">
							<!-- 지역 -->
							<div class="prodInfo_detailWrap2">
								<div class="detailTitleWrap">
									<i class="fa-solid fa-location-dot"></i>
									거래지역
								</div>
								<div class="detailContentWrap">
									<div class="detailContent_location">
										<!-- productDetail.js -->
										<p>서울시 강남구 학동로 지하 102</p>
									</div>
								</div>
							</div>
							<!-- 카테고리 -->
							<div class="prodInfo_detailWrap2">
								<div class="detailTitleWrap">
									<i class="fa-solid fa-align-justify"></i>
									카테고리
								</div>
								<div class="detailContentWrap">
									<div class="detailContent_cate">
										<!-- productDetail.js -->
										<p>주방용품</p>
									</div>
								</div>
							</div>
							<!-- 상품태그 -->
							<div class="prodInfo_detailWrap2">
								<div class="detailTitleWrap">
									<i class="fa-solid fa-tag"></i>
									상품태그
								</div>
								<div class="detailContentWrap_hash">
									<!-- productDetail.js -->
									<p>#주방용품 #파우치 #수저 #세트</p>
								</div>
							</div>
						</div>
					</div>
				</div>
				</div>
			</div>
				
			<div class="prodInfo_RightWrap">
				<!-- 상점정보 -->
				<div class="prodInfo_storeWrap1">
					<div class="prodInfo_storeWrap2">
						<div class="storeInfo_Title">판매자정보</div>
					</div><!-- //storeWrap2 -->
					<div class="prodInfo_storeDetailWrap">
						<!-- 프로필 & 판매자닉네임 & 상품 개수 -->
						<div class="store">
							<a class="storeProfileImg_Link" href="#">
								<!-- productDetail.js -->
								<img src="${pageContext.request.contextPath}/resources/images/usedProduct/dog.jpg" class="float-start" alt="상품이미지">
							</a>
							<div class="storeInfoWrap">
								<a class="storeInfo_name" href="#" 
										style="font-size: 14px;">홍길동길동<!-- productDetail.js --></a>
								<div class="storeInfo_productNum">
									<a class="productNumLink" href="#"><!-- productDetail.js --></a>
								</div>
							</div>
						</div><!-- //store -->
						<!-- 판매자가 올린 최신 상품 2개  -->
						<div class="storeInfo_productWrap">
							<!-- productDetail.js -->
						</div>
						<div class="storeInfo_moreProd">
							<a class="moreProdLink" href="#">
								<span style="color: rgb(247, 47, 51);">9개</span><span class="moreProdLink_Num">&nbsp판매상품 더보기</span>		 
							</a>
						</div>
						<!-- 별점 & 평점 -->
						<div class="storeInfo_IndiWrap">
							<!-- 상점평점 -->
							<div class="storeScore_title">
								<div style="margin-bottom:1px;">판매자평점</div>
								<div class="storeStar"> 
									<i class="star fa-solid fa-star"></i>
									<i class="star fa-solid fa-star"></i>
									<i class="star fa-solid fa-star"></i>
									<i class="star fa-solid fa-star"></i>
									<i class="star fa-solid fa-star"></i>
								</div>
							</div>
						
						</div>
					</div>
				</div>
			</div>
		</div>
	 	<!-- nav -->
		<div id="nav">
			 <jsp:include page="/WEB-INF/views/usedProduct/main/sidebar.jsp"/>
		 </div>
	 </div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<script>
// 채팅하기 관련
document.querySelector("#update_btn").addEventListener('click', (e) => {
	location.href = '${pageContext.request.contextPath}/usedProduct/product/productUpdate';
});
$('#chat_btn').click(function() {
	var popupWidth = 750;
	var popupHeight = 500;

	var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
	var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 

	window.open('', 'chat', 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);	
});

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