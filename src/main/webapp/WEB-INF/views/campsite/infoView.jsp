<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/campsite/campsite.css" />
<style>
#campsiteImg {
	border-radius: 5px;
	cursor: pointer;
	transition: 0.3s;
}
#campsiteImg:hover {
	opacity: 0.7;
}
.campsite-img-modal {
	display: none;
	position: fixed;
	z-index: 2000;
	padding-top: 100px;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgb(0,0,0);
	background-color: rgba(0,0,0,0.9);
}
.modal-content {
	margin: auto;
	display: block;
	width: 80%;
	max-width: fit-content;
	animation-name: zoom;
	animation-duration: 0.6s;
}
@keyframes zoom {
	from {
		transform: scale(0)
	}
	to {
		transform: scale(1)
	}
}
.modal-close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}
.modal-close:hover, .modal-close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}
@media only screen and (max-width: 700px) {
	.modal-content {
		width: 100%;
	}
}
</style>

<!-- Swiper -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/css/swiper.min.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.5.1/js/swiper.min.js"></script>

<!-- Kakao 지도 Javascript API -->
<spring:eval var="kakaoMapKey" expression="@customProperties['api.kakaoMap']" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoMapKey}&libraries=services,clusterer,drawing"></script>

<!-- 캠핑장상세조회 페이지 (작성자:SJ) -->
<div class="container-md campsite-basic-info-wrap p-3">
	<div class="w-100 p-4 m-auto rounded campsite-info-view-wrap">
		<div class="row m-0">
			<div class="col-md info-view-title">
				<h4 class="font-weight-bold m-0">${campsite.facltNm}</h4>
			</div>
			<div class="col-md info-view-back-btn">
				<button class="btn btn-success float-right bg-camper-color" onclick="history.go(-1);">
					<i class="fa-solid fa-arrow-rotate-left"></i>&nbsp;목록으로 돌아가기
				</button>
			</div>
		</div>
		<hr />
		<div class="row m-0 basic-info-wrap p-3 justify-content-center">
			<div class="col-md basic-info-img bg-light mr-3">
				<c:if test="${not empty campsite.firstImageUrl}">
					<img src="${campsite.firstImageUrl}" class="img-thumbnail" alt="${campsite.facltNm} 대표이미지">
				</c:if>
				<c:if test="${empty campsite.firstImageUrl}">
					<img src="${pageContext.request.contextPath}/resources/images/noImg.png" class="img-thumbnail" alt="${campsite.facltNm} 대표이미지">
				</c:if>
			</div>
			<div class="col-md ml-3">
				<table class="table basic-info-table mb-0">
			    	<tr>
			      		<th scope="row">주소</th>
	      				<td>
		      				${not empty campsite.addr1 ? campsite.addr1 : '-'}
		      				${not empty campsite.addr2 ? campsite.addr2 : ''}
	      				</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">문의처</th>
			      		<td>${not empty campsite.tel ? campsite.tel : '-'}</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">캠핑장 유형</th>
			      		<td>${not empty campsite.induty ? campsite.induty : '-'}</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">운영기간</th>
			      		<td>${not empty campsite.operPdCl ? campsite.operPdCl : '-'}</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">운영일</th>
			      		<td>${campsite.operDeCl ? campsite.operDeCl : '-'}</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">홈페이지</th>
			      		<td>
			      			<c:if test="${not empty campsite.homepage}">
			      				<a target="_blanck" href="${campsite.homepage}">홈페이지 바로가기</a>
			      			</c:if>
			      			<c:if test="${empty campsite.homepage}">
			      				-
			      			</c:if>
			      		</td>
			    	</tr>
			    	<tr>
			      		<th scope="row">예약방법</th>
			      		<td>${not empty campsite.resveCl ? campsite.resveCl : '-'}</td>
			    	</tr>
			    	<tr>
			    		<!-- 캠핑장 즐겨찾기 -->
			    		<td scope="col" colspan="2" class="pb-0">
			    			<button type="button" id="bookmarkBtn" class="btn btn-outline-success btn-outline-camper-color font-weight-bold">
			    				<i class="fa-solid fa-star"></i>&nbsp;즐겨찾기
			    			</button>
			    			<%-- EJ start --%>
			    			<%-- EJ end --%>
			    		</td>
			    	</tr>
			    </table>
			</div>
		</div>
	</div>
</div>
<div class="container campsite-info-tab-wrap p-3">
	<ul class="row nav nav-pills nav-justified" id="infoViewTab" role="tablist">
	  	<li class="nav-item" role="presentation">
	  	  <button class="col nav-link active" id="campsite-info-tab" data-toggle="tab" data-target="#campsiteInfo" type="button" role="tab" aria-controls="campsiteInfo" aria-selected="true">캠핑장소개</button>
	  	</li>
	  	<li class="nav-item" role="presentation">
	    	<button class="col nav-link" id="facility-info-tab" data-toggle="tab" data-target="#facilicyInfo" type="button" role="tab" aria-controls="facilicyInfo" aria-selected="false">시설정보</button>
	  	</li>
	  	<li class="nav-item" role="presentation">
	   	 	<button class="col nav-link" id="location-info-tab" data-toggle="tab" data-target="#locationInfo" type="button" role="tab" aria-controls="locationInfo" aria-selected="false">위치정보</button>
	  	</li>
	</ul>
	<div class="tab-content" id="infoViewTabContent">
	  	<div class="tab-pane fade show active p-4" id="campsiteInfo" role="tabpanel" aria-labelledby="campsite-info-tab">
	  		<ul class="list-group list-group-flush">
			  	<li class="list-group-item">				  
		  			<h6>
			  			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;${campsite.facltNm} 소개
		  			</h6>
			  	</li>
			  	<li class="list-group-item pt-5 pb-3">
			  		<div class="text-center"><i class="fa-solid fa-quote-left"></i> ${campsite.lineIntro} <i class="fa-solid fa-quote-right"></i></div>
			  		<!-- Photo Swiper -->
					<div class="swiper-container campsite-img-list my-3">
						<div class="swiper-wrapper">
							<div class="swiper-slide"><img id="campsiteImg" onclick="campsiteImgZoomIn();" src="${pageContext.request.contextPath}/resources/images/noImg.png" alt=""></div>
							<div class="swiper-slide"><img id="campsiteImg" onclick="campsiteImgZoomIn();" src="${pageContext.request.contextPath}/resources/images/noImg.png" alt=""></div>
							<div class="swiper-slide"><img id="campsiteImg" onclick="campsiteImgZoomIn();" src="${pageContext.request.contextPath}/resources/images/noImg.png" alt=""></div>
						</div>
						<div class="swiper-button-next"></div>
						<div class="swiper-button-prev"></div>
					</div>
					<!-- Photo Modal -->
					<div id="campsiteImgModal" class="modal campsite-img-modal">
					  	<span class="modal-close" onclick="campsiteImgModalClose();">&times;</span>
					  	<img class="modal-content" id="campsiteImgModalContent">
					</div>
			  		<div>${campsite.intro}</div>
			  	</li>
			</ul>
	  	</div>
	  	<div class="tab-pane fade" id="facilicyInfo" role="tabpanel" aria-labelledby="facility-info-tab">
	  		<div class="tab-pane fade show active p-4" id="campsiteInfo" role="tabpanel" aria-labelledby="campsite-info-tab">
		  		<ul class="list-group list-group-flush">
				  	<li class="list-group-item">				  
			  			<h6>
				  			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;${campsite.facltNm} 시설
			  			</h6>
				  	</li>
				  	<li class="list-group-item">
				  		<span>기본시설</span>
				  		<ul class="list-group list-group-flush">
						  	<li class="list-group-item">어쩌구</li>
						</ul>
				  	</li>
				  	<li class="list-group-item">
				  		<span>부가시설</span>
				  	</li>
				</ul>
		  	</div>
	  	</div>
	  	<div class="tab-pane fade" id="locationInfo" role="tabpanel" aria-labelledby="location-info-tab">
	  		<div class="tab-pane fade show active p-4" id="campsiteInfo" role="tabpanel" aria-labelledby="campsite-info-tab">
		  		<ul class="list-group list-group-flush">
				  	<li class="list-group-item">				  
			  			<h6>
				  			<i class="fa-solid fa-circle-chevron-right"></i>&nbsp;${campsite.facltNm} 위치
			  			</h6>
				  	</li>
				</ul>
		  		<div class="p-2 m-auto location-info-map" id="map"></div>
		  	</div>
	  	</div>
	</div>
</div>
<script>
//--------------------- EJ start
/**
 * 캠핑장 즐겨찾기
 */

//--------------------- EJ end

/**
 * 이미지 클릭시 모달창 실행
 */
let campsiteImgModal = document.getElementById("campsiteImgModal");
let campsiteImg = document.getElementById("campsiteImg");
let campsiteImgModalContent = document.getElementById("campsiteImgModalContent");
const campsiteImgZoomIn = () => {
	campsiteImgModal.style.display = "block";
	campsiteImgModalContent.src = campsiteImg.src;
};

let modalClose = document.getElementsByClassName("modal-close")[0];
const campsiteImgModalClose = () => {
	campsiteImgModal.style.display = "none";
};

$('.campsite-img-modal').click(function() {
	$('#campsiteImgModal').hide();
});

/**
 * 후기 이미지 제어
 */
new Swiper('.swiper-container', {
	slidesPerView : 3,
	spaceBetween : 10,
	slidesPerGroup : 3,
	debugger: true,
	mousewheel: true,
	loopFillGroupWithBlank : true,
	loop : true,
	navigation : {
		nextEl : '.swiper-button-next',
		prevEl : '.swiper-button-prev'
	}
});

/**
 * 캠핑장 위치 정보 지도 렌더링
 */
const mapX = ${campsite.mapX};
const mapY = ${campsite.mapY};
const facltNm = '${campsite.facltNm}';

const mapContainer = document.getElementById('map'),
mapOption = {
    center: new kakao.maps.LatLng(mapY, mapX),
    level: 1
};

const map = new kakao.maps.Map(mapContainer, mapOption);

const mapTypeControl = new kakao.maps.MapTypeControl();
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

const zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

const imageSrc = "https://upload.wikimedia.org/wikipedia/commons/f/fb/Map_pin_icon_green.svg";
const imageSize = new kakao.maps.Size(24, 35);
const markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);

const ps = new kakao.maps.services.Places(); 
ps.keywordSearch(facltNm, placesSearchCB);

function placesSearchCB(data, status, pagination) {
    if(status === kakao.maps.services.Status.OK) {
		const bounds = new kakao.maps.LatLngBounds();
        for(let i = 0; i < data.length; i++) {
            displayMarker(data[i]);
            bounds.extend(new kakao.maps.LatLng(data[0].y, data[0].x));
        }       
        map.setBounds(bounds);
    }
}

function displayMarker(place) {
	const marker = new kakao.maps.Marker({
		map: map,
		position: new kakao.maps.LatLng(place.y, place.x),
		image : markerImage,
		text: facltNm
	});
	kakao.maps.event.addListener(marker, 'click', function () {
		const position = this.getPosition();
		const url = 'http://map.kakao.com/link/map/' + place.id;
		window.open(url, '_blank');
	});
}

// 사용자가 외부에서 영역을 변경하게 되면 API 내부에서 알 수 없기 때문에
// 지도 표시 영역이 완전히 스타일이 잡히고 난 이후에 map.relayout()을 호출하는 것
document.querySelector('#location-info-tab').addEventListener('click', (e) => {
	setTimeout(function() {
	    map.relayout();
	    map.setCenter(new kakao.maps.LatLng(mapY, mapX));
	    map.setLevel(1);
	}, 1000);
});
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>