<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 로그인 정보 가져오기 -->
<sec:authentication property="principal" var="member" />
<!-- 회원/비회원 -->
<sec:authorize access="isAnonymous()">
</sec:authorize>
<sec:authorize access="hasRole('ROLE_USER')">
	<input type="hidden" class="loginId" value="비회원"/>
	<input type="hidden" class="loginId" value="${member.username}"/>
</sec:authorize>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/productDetail.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/sidebar.css"/>

<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>

<input type="hidden" class="hiddenNo" value="${no}"/>
<input type="hidden" class="owner" value=""/>
<div id="section" style="width: 98%; margin:50px auto">
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
									<img src="${pageContext.request.contextPath}/resources/upload/usedProduct/${usedProduct.productImg1}" id="product_img1" alt="상품이미지">
									<img src="${usedProduct.productImg2}" id="product_img2" alt="상품이미지">
									<img src="${usedProduct.productImg3}" id="product_img3" alt="상품이미지">
									<img src="${usedProduct.productImg4}" id="product_img4" alt="상품이미지">
									<img src="${usedProduct.productImg5}" id="product_img5" alt="상품이미지">
							</div>
							<!-- 확대 버튼-->
							<button class="detail-info__image--enlg">
								<i class="fas fa-search"></i> 확대
							</button>
							<div class="detail-info__image--prev swiper-button-next swiper-button-white" 
											style="top: -206px;" onclick="moveSlides(-1)">&#10094;</div>
							<div class="detail-info__image--next swiper-button-prev swiper-button-white" 
											style="top: -227px; float: right;" onclick="moveSlides(1)">&#10095;</div>
							<!-- 슬라이더 버튼 수 -->
							<div class="swiper-pagination">
								<div class="paginationBtn" style="">
									<!-- js -->
								</div>
							</div>
							
							<!-- 확대  -->
							<div class="prodDetailImgWrap1">
								<div class="prodDetailImgWrap2"> 
									<button type="button" class="detailImg_closeBtn">
										<img src="" width="34" height="32" alt="닫기 버튼 아이콘">
									</button>
									<div class="detailImgListWrap">
										<div class="dtailImg_prodName"></div>
										<!-- 이미지 리스트 -->
										<div class="detailImgList" > 
											<!--js -->
										</div>
										<div class="detailImg_buttonWrap">
											<!-- js -->
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
								<div class="detail-info__text-title">
									<!-- 상품제목 -->
									${usedProduct.productTitle}
								</div>
								<div class="detail-info__text-price__div">
									<!-- 상품가격 -->
									<div class="detail-info__price" id="product_price">
										${usedProduct.productPrice}
									</div>
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
											<div id="view">
												${usedProduct.productViews}
											</div>
										</div>
										<div class="detail-info--topL-item">
											<i class="fa-regular fa-clock"></i>
											<!-- 시간 -->
											<c:set var="b_time" value="${usedProduct.productEnrollTime}" />
											<c:set var="time"
												value="${b_time > (60 * 24) ? Math.round( b_time / (60 * 24) ) : ( b_time > 60 ? Math.round( b_time / 60 ) : b_time ) }" />
								
											<c:if test="${60 > b_time}">
												<c:set var="unit" value="분 전" />
											</c:if>
											<c:if test="${b_time > 60}">
												<c:set var="unit" value="시간 전" />
											</c:if>
											<c:if test="${b_time > (60 * 24)}">
												<c:set var="unit" value="일 전" />
											</c:if>
											<div id="productLogtime">${time}${unit}</div> 
										</div>
										</div>
									</div>
								</div>
								<div class="detail-info__text-body-bottom">
									<div class="detail-info__text-body-bItem">
										<div class="detail-info__text-body-bItem-title">▪배송비</div>
										<!-- 배송비 -->
										<div class="detail-info__delivery" id="productDeliveryFee">
											<c:set var="delivery" target="${usedproduct.productDeliveryFee}"/>
												<c:if test="${delivery == 1}">
													<p>배송비 별도</p>
												</c:if>
												<c:if test="${delivery == 0}">
													<p>배송비 별도</p>
												</c:if>
										</div>
				
									</div>
									<div class="detail-info__text-body-bItem">
										<div class="detail-info__text-body-bItem-title">▪거래지역</div>
										<!-- 거래지역 -->
										<div class="detail-info__location" id="productLocation"></div>
									</div>
									<div class="detail-info__text-body-bottom">
										<div class="detail-info__zzim-chat" style="display: flex;">
										   <!-- 관심상품(찜) -->
											   <div class="detail-info__zzim">
													<button type="submit" value="2" id="zzim_btn" style="margin-right: 10px; margin-right: 10px; background-color: #a0a0a0;">
														<i class="fa-solid fa-heart" style="color: white"></i>							 
													관심상품</button>
											   </div>
										   <!-- 채팅하기 -->
										   <!-- post 날린 요청의 결과 chatRoom(윈도우 팝업창)에서 볼 수 있음 -->
										   <form 
										   		id="productDetailForm" method="post" action="/campervalley/usedProduct/chat/chat" target="chat">
										   		<div class="detail-info__chat" >
													<button type="submit" id="chat_btn" style="background-color: #639A67;">
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
							<div class="prodInfo_contentText"></div>
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


<script>
$(document).ready(function() {
			
			// 상품 이미지 - 스와이퍼 
			var product_img = [{product_img : usedProduct.productImg1},
							  {product_img : usedProduct.productImg2}
							  {product_img : usedProduct.productImg3}
							  {product_img : usedProduct.productImg4}
							  {product_img : usedProduct.productImg5}];
			
			// 확대
			$('.detailImg_prodName').text(usedProduct.productTitle);
			
	 
			$.each(product_img, function(index, items) {
				if(itemms.product_img, != '') {
					if(items.product_img == null) {
						return false;
					} else {
						// ======================== 스와이퍼 ===========================
							$('.swiper-wrapper').append($('<div>', {
								class : 'swiper-slide' 
							}).append($('<img/>', {
								src : '${pageContext.request.contextPath}/resources/upload/usedProduct/' + items.product_img,
								alt : '상세 상품 이미지',
								id : 'product_img' + index
							})))
							
							// 첫 장 빼고 display: none
							if(index != 0) {
								$('#product_img'+index).parent().css('display', 'none');
								$('#product_img0').parent().css('display', 'block');
							}
							
							// 슬라이더 버튼
							$('.paginationBtn').append($('<span/>', {
								class : 'dot',
								onclick : 'currentSlide('+(index)+')'
							}))
							
							// 첫장만 도트 검정
							if(index == 0) {
								$('.dot').attr('class', 'dot active');
							}
							
							// 확대버튼
							$('.detailImgList').append($('<div>', {
								class : 'detailImg_wrap',
							}).append($('<img/>', {
								src : '${pageContext.request.contextPath}/resources/upload/usedProduct/' + items.product_img,
								alt : '리뷰 이미지'
							})))
							
							// 버튼
							$('.detailImg_buttonWrap').append($('<button/>', {
								class : 'detailImg_button'+index
							}));
							
							// 첫번째 버튼 흰색
							if(index==0) {
								$('.detailImg_button'+index).css('opacity', '0.6');
							}
							
							$('.detailImg_button'+index).click(function() {
								$(this).css('opacity', '0.6');	
							
								$('.detailImgList').attr('class', 'detailImgList_' + index);
								
								var i;
								if(index == 0) {
									for(i=1; i<=4; i++) 
										$('.deatilImgList_' + i).attr('class', 'detailImgList_0');	
								} else if(index==1) {
									$('.detailImgList_0, .detailImgList_2, .detailImgList_3, .detailImgList_4').attr('class', 'detailImgList_1');
								} else if(index==2) {
									$('.detailImgList_0, .detailImgList_1, .detailImgList_3, .detailImgList_4').attr('class', 'detailImgList_2');
								} else if(index==3) {
									$('.detailImgList_0, .detailImgList_1, .detailImgList_2, .detailImgList_4').attr('class', 'detailImgList_3');
								} else if(index==4) {
									for(var i=0; i<=3; i++) {
										$('.detailImgList_'+i).attr('class', 'detailImgList_4');
									}
						}
				}
				
				// 판매완료
				if(usedProduct.buyerId != null) {
					$('#product_img' + index).after($('<div/>', {
						class : 'soldOut',
					}).append($('<div/>', {
						
					}).append($('<span/>', {
						id : 'soldOutText1',
						text: '판매'
					})).append($('<span/>', {
						id : 'soldOutText2',
						text : '완료'
					})))
				}
			}); // each 끝
			
			// 판매자 정보
		}

	})
});

// 채팅하기 관련
document.querySelector("#update_btn").addEventListener('click', (e) => {
	location.href = '${pageContext.request.contextPath}/usedProduct/product/productUpdate';
});
$('#chat_btn').click(function() {
	window.open('', 'chat', resizable=no);	
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