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

<input type="hidden" class="hiddenNo" value="${usedProduct.productNo}"/>
<input type="hidden" class="memberId" value="${loginMember.memberId}"/>
<input type="hidden" class="owner" value=""/>

<script>
/* 슬라이더 */
$(document).ready(function() {
	var imgs;
	var img_count;
	var img_position = 1;
	imgs = $(".slide ul");
	img_count = imgs.children().length;
	//버튼을 클릭했을 때 함수 실행
	$('#back').click(function () {
	  back();
	});
	$('#next').click(function () {
	  next();
	});
	function back() {
	  if(1<img_position){
	    imgs.animate({
	      left:'+=475px'
	    });
	    img_position--;
	  }
	}
	
	function next() {
	  if(img_count>img_position){
	    imgs.animate({
	      left:'-=475px'
	    });
	    img_position++;
	  }
}
});
//이미지 끝까지 가면 버튼 사라지기
//첫 이미지로 돌아오기=
</script>
<script>

$(document).ready(function() {
	
	$.ajax({
		type : 'GET',
		url : '/campervalley/usedProduct/product/getSellerInfo',
		data : {
			productNo : $('.hiddenNo').val()
		},
		dataType : 'json',
		success : function(data) {
			// 클릭 -> 해당 판매자 정보로 이동
			
			$('.owner').val(data.member.memberId);
			
			// 상점 사진
			if(data.member.profileImg == null) {
				$('.sellerProfileImg_Link').append($('<img/>', {
					src : "/campervalley/resources/images/noImg.png",
					width : '54',
					height : '54',
					alt : '프로필 없음'
				})) 
			} else {
				$('.sellerProfileImg_Link').append($('<img/>', {
					src : '/campervalley/resources/upload/member/' + data.member.profileImg,
					width : '54',
					height : '54',
					alt : '판매자 프로필'
				})) 
			}
			
			$('.sellerInfo_name').text(data.member.nickname);
			
			// 상품 총 개수
			$('.productNumLink').text('상품 '+data.sellerProdNum);
			
			// -개 상품 더보기
			$('.moreProdLink_Num').text((data.sellerProdNum-1) + '개');
		
		}, error : function() {
			alert('에러!');
		}
		
	});
	
});
</script>
<div id="section" style="width: 98%; margin:30px auto;">
	<div class="detail_area">
	<div class="detail_div">
		<c:if test="${not empty loginMember && loginMember.memberId eq usedProduct.sellerId}">
	        <div class="delete_update">
		         <form:form 
					name="productDeleteFrm" 
					method="POST" 
					action="${pageContext.request.contextPath}/usedProduct/product/productDelete">
					<input type="hidden" name="productNo" id="productNo" value="${usedProduct.productNo}" />
				 </form:form>
	        	 <button id="delete_btn" onclick="productDelete();">삭제하기</button>
	        	 <button id="update_btn" style="margin-right: 8px; background-color: #D8EBB5">수정하기</button>
	        </div>
	    </c:if>
        <hr style="margin-top: 3rem; margin-bottom: 1rem;"/>
		<!----------------------------- 상단 상품정보 ----------------------------->
		<div class="detail-info__area">
			<div class="detail-info__div">
				<div class="detail-info__image__div">
					<input id="prodno" type="hidden" data-no="78">
					    <div class="slide">
						      <i id="back" class="fa-solid fa-chevron-left" width="100"></i>
						      <ul>
						    	<c:if test="${usedProduct.productImg1 ne null}">
						        	<li><img src="${pageContext.request.contextPath}/resources/upload/usedProduct/${usedProduct.productImg1}" alt="1"></li>
						       	</c:if>
						    	<c:if test="${usedProduct.productImg2 ne null}">
						        	<li><img src="${pageContext.request.contextPath}/resources/upload/usedProduct/${usedProduct.productImg2}" alt="2"></li>
						         </c:if>
						    	<c:if test="${usedProduct.productImg3 ne null}">
						        	<li><img src="${pageContext.request.contextPath}/resources/upload/usedProduct/${usedProduct.productImg3}" alt="3"></li>
						        </c:if>
						    	<c:if test="${usedProduct.productImg4 ne null}">
						        	<li><img src="${pageContext.request.contextPath}/resources/upload/usedProduct/${usedProduct.productImg4}" alt="4"></li>
						        </c:if>
						    	<c:if test="${usedProduct.productImg5 ne null}">
						        	<li><img src="${pageContext.request.contextPath}/resources/upload/usedProduct/${usedProduct.productImg5}" alt="5"></li>
						      	</c:if>
						      </ul>
						      <i id="next" class="fa-solid fa-chevron-right" width="100"></i>
						    </div>
						
						<div class="slideshow-container">
						<div class="swiper-container detail-info__image__list">
							<div class="swiper-wrapper">
							</div>
							<!-- 확대 버튼-->
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
											<i class="fa-solid fa-heart"></i>
											<!-- 찜 수 -->
											<div id="zzim"><span>${usedProduct.heart}</span></div>
										</div>
										<div class="detail-info--topL-item">
											<i class="fa-solid fa-eye"></i>
											<!-- 상품 조회수 -->
											<div id="view">
												${usedProduct.productViews}
											</div>
										</div>
										</div>
									</div>
								</div>
								<div class="detail-info__text-body-bottom">
								<div class="detail-info__text-body-bItem">
									<div class="detail-info__text-body-bItem-title">▪등록시간 : </div>
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
								<div class="detail-info__text-body-bItem">
										<div class="detail-info__text-body-bItem-title">▪거래지역 : </div>
										<!-- 거래지역 -->
										<div class="detail-info__location" id="productLocation">${usedProduct.productLocation}</div>
								</div>
								<div class="detail-info__text-body-bItem">
									<div class="detail-info__text-body-bItem-title">▪배송비 : </div>
									<!-- 배송비 -->
									<div class="detail-info__delivery" id="productDeliveryFee">
										<c:set var="delivery" target="${usedproduct.productDeliveryFee}"/>
											<c:if test="${delivery == 1}">
												<p>배송비 별도</p>
											</c:if>
											<c:if test="${delivery == 0}">
												<pddd>배송비 포함</p>
											</c:if>
								 	</div>
								 </div>
									<div class="detail-info__text-body-bottom">
										<div class="detail-info__btn-list" style="display: flex;">
											<c:choose>
												 <c:when test="${empty wishProduct}">
												   	<!-- 관심상품(찜) -->	
												   		<div class="detail-info__zzim">
															<button  id="zzim_btn" class="heartBtn heart-click">
																<i class="fa-regular fa-heart"></i>
															<span id="zzim_span"></span>관심상품</button>
														</div>
												  </c:when>
												  <c:otherwise>
														<!-- 꽉찬하트 -->
												   		<div class="detail-info__zzim">
															<button id="zzim_btn" class="heartBtn heart-click">
																<i class="fa-solid fa-heart"></i> 관심상품
															</button>
														</div>

												  </c:otherwise>
												</c:choose>
										   <!-- 채팅하기 -->
										   <!-- post 날린 요청의 결과 chatRoom(윈도우 팝업창)에서 볼 수 있음 -->
	   									   <form 
										   		id="productDetailForm" method="post" action="/campervalley/usedProduct/chat/chat" target="chat">
										   		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />.
										   		<div class="detail-info__chat" >
													<button type="submit" id="chat_btn" style="background-color: #639A67">
														<i class="fa-solid fa-comment"></i>			 	
													채팅하기</button>
										   		</div>
										   </form>
										 </div>
									 </div>
								</div>
							</div>
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
					<div class="btmProdInfo_Title">
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
								${usedProduct.productContent}
							</div>
					</div>
				</div>
				</div>
			</div>
				
			<div class="prodInfo_RightWrap">
				<div class="prodInfo_sellerWrap1">
					<div class="prodInfo_sellerWrap2">
						<div class="sellerInfo_Title">판매자정보</div>
					</div>
						<div class="seller" onclick="location.href='${pageContext.request.contextPath}/tradereview/profileCheck?memberId=${usedProduct.sellerId}'; return false;">
							<a class="sellerProfileImg_Link" href="#">
							</a>
							<div class="sellerInfoWrap">
								<a class="sellerInfo_name" href="#"><!-- productDetail.js --></a>
								<div class="sellerInfo_productNum">
									<a class="productNumLink" href="#"><!-- productDetail.js --></a>
								</div>
							</div>
						</div><!-- //store -->
						<!-- 판매자가 올린 최신 상품 2개  -->
						<div class="sellerInfo_productWrap">
							<!-- productDetail.js -->
						</div>
						<div class="sellerInfo_moreProd">
							<a class="moreProdLink" href="#">
								<span class="moreProdLink_Num" style="color: rgb(247, 47, 51);"></span><span>상품 더보기</span>		 
							</a>
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

<script>
//ajax 통신을 위한 csrf 설정
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});

/* 관심상품 */
var productNo = $('.hiddenNo').val();
var memberId = $('.memberId').val();

$(document).ready(function() {
	$.ajax({
	   	url : '/campervalley/usedProduct/product/findHeart',
	   	type : 'GET',
	   	dataType : 'json',
	   	data : {
	   		productNo : productNo
	   	},
	   	success : function(data) {
	   		if(data.wishProduct == null) {
	   			$('.heart-click').html('<i class="fa-regular fa-heart"></i> 관심상품');
	   		} else {
	   		   	$('.heart-click').html('<i class="fa-solid fa-heart"></i> 관심상품');
	   		}
	   	}, 
	   	error : function() {
	   		alter('하트조회오류');
	   	}
	});
});

$(".heart-click").click(function() {
    
    var productNo = $('.hiddenNo').val();
    console.log("heart-click");
    
    // 빈하트 클릭
    if($(this).children('i').attr('class') == "fa-regular fa-heart") {
    	console.log("빈하트 클릭" + productNo);
    	
	   	$.ajax({
	   		url : '/campervalley/usedProduct/product/saveHeart',
	   		type : 'GET',
	   		data : {
	   			productNo : productNo,
	   		},
	   		success : function(usedProduct) {
	   			document.location.reload(true);
	   			
	   			let heart = usedProduct.heart;
	   			// 하트 수 갱신
	   			$('#zzim').text(heart);
	   			$('#zzim_btn').text(heart);
	   			
	   			console.log('하트 추가 성공!');
	   		}, 
	   		error : function() {
	   			alert('로그인 후 관심상품으로 등록 가능합니다.')
	   		}
	   	});
	   	console.log("꽉찬하트로 바꾸기");
	   	
	   	// 꽉찬하트로 바꾸기
	   	$(this).html('<i class="fa-solid fa-heart"></i> 관심상품');
	   	
   } else if($(this).children('i').attr('class') == "fa-solid fa-heart") {
	   console.log("꽉찬 하트 클릭!" + productNo);
	   
	   $.ajax({
		  url : '/campervalley/usedProduct/product/removeHeart',
		  type : 'GET',
		  data : {
			  productNo : productNo,
		  },
		  success : function(usedProduct) {
			  document.location.reload(true);
			  
			  let heart = usedProduct.heart;
			  
	  		  // 하트 수 갱신
	  		  $('#zzim').text(heart);
	  		  $('#zzim_btn').text(heart);
	  			
	  		  console.log('하트 삭제 성공!');
		  },
		  error : function() {
			 alert('로그인 후 관심상품으로 등록 가능합니다.');
		  }
	   });
	   console.log("빈하트로 바꾸기");
	   
	   // 빈하트로 바꾸기
	   $(this).html('<i class="fa-regular fa-heart"></i> 관심상품');
   }
});

/* 상품 삭제 */
const productDelete = () => {
	const bool = confirm('게시글을 정말 삭제하시겠습니까?');
	
	if(!bool) {
		alert('삭제를 취소했습니다.');
	}
	else {
		const frm = document.productDeleteFrm;
		frm.submit();
		alert('게시글이 삭제되었습니다.');
	}
};

document.querySelector("#update_btn").addEventListener('click', (e) => {
	location.href = '/campervalley/usedProduct/product/productUpdate';
});

/* 채팅하기 */ 
$('#chat_btn').click(function() {
	var popupWidth = 750;
	var popupHeight = 500;
	var popupX = Math.ceil(( window.screen.width - popupWidth )/2);
	var popupY = Math.ceil(( window.screen.height - popupHeight )/2); 
	window.open('', 'chat', 'width=' + popupWidth + ',height=' + popupHeight + ',left='+ popupX + ', top='+ popupY);	
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>