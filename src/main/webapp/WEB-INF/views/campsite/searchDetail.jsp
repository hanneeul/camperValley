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

<!-- Kakao 지도 Javascript API -->
<spring:eval var="kakaoMapKey" expression="@customProperties['api.kakaoMap']" />
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoMapKey}"></script>
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${kakaoMapKey}&libraries=services,clusterer,drawing"></script>

<!-- 캠핑장목록조회(상세검색) 페이지 (작성자:SJ) -->
<div class="d-flex justify-content-center campsite-search-wrap">
	<div class="container-md w-75 p-4 m-auto rounded campsite-search">
		<div class="row m-0">
			<div class="col search-header">상세검색</div>
			<div class="col">
				<button type="button" id="searchThemeBtn" class="btn btn-success bg-camper-color float-right">
					테마검색&nbsp;<i class="fa-solid fa-angle-right"></i>
				</button>
			</div>
		</div>
		<hr />
		<div class="row m-0">
			<div class="col-md-4">
				<label for="location">지역</label>
				<select class="custom-select btn-outline-success btn-outline-camper-color" name="sido1" id="sido1"></select>
				<select class="custom-select btn-outline-success btn-outline-camper-color" name="gugun1" id="gugun1"></select>
			</div>
			<div class="col-md-6 input-group">
				<label for="keywordSearch">키워드 검색</label>&nbsp;
				<input type="text" class="form-control border-camper-color keyword-search-btn-wrap" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="keywordSearchBtn">
			  	<div class="input-group-append">
			    	<button class="btn btn-outline-success btn-outline-camper-color" type="button" id="keywordSearchBtn"><i class="fa-solid fa-magnifying-glass"></i></button>
			  	</div>
			</div>
			<div class="col-md">
				<button type="button" id="conditionsBtn" class="btn btn-success bg-camper-color float-right" data-toggle="modal" data-target="#conditionsModal">
					<i class="fa-regular fa-square-plus"></i>&nbsp;상세조건
				</button>
			</div>
		</div>
	</div>
</div>
<!-- modal insert -->
<%-- 나중에 파일 분리? --%>
<div class="modal fade" id="conditionsModal" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="conditionsModalLabel" aria-hidden="true">
  	<div class="modal-dialog modal-xl modal-dialog-centered modal-dialog-scrollable">
    	<div class="modal-content">
	      	<div class="modal-header">
	        	<h5 class="modal-title font-weight-bold" id="conditionsModalLabel">상세조건</h5>
	        	<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	          	<span aria-hidden="true">&times;</span>
	        	</button>
	      	</div>
	      	<div class="modal-body">
	        	<h6 class="font-weight-bold">운영형태</h6>
	        	<div class="form-check-inline form-check d-flex">
					<input type="checkbox" class="form-check-input" name="facltDivNm" id="facltDivNm0" value="지자체">
					<label for="facltDivNm0" class="form-check-label">지자체</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="facltDivNm" id="facltDivNm1" value="국립공원">
					<label for="facltDivNm1" class="form-check-label">국립공원</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="facltDivNm" id="facltDivNm2" value="자연휴양림">
					<label for="facltDivNm2" class="form-check-label">자연휴양림</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="facltDivNm" id="facltDivNm3" value="국민여가">
					<label for="facltDivNm3" class="form-check-label">국민여가</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="facltDivNm" id="facltDivNm4" value="민간">
					<label for="facltDivNm4" class="form-check-label">민간</label>&nbsp;
				</div>
				<hr />
				<h6 class="font-weight-bold">입지구분</h6>
	        	<div class="form-check-inline form-check">
					<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl0" value="해변">
					<label for="lctCl0" class="form-check-label">해변</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl1" value="섬">
					<label for="lctCl1" class="form-check-label">섬</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl2" value="산">
					<label for="lctCl2" class="form-check-label">산</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl3" value="숲">
					<label for="lctCl3" class="form-check-label">숲</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl4" value="계곡">
					<label for="lctCl4" class="form-check-label">계곡</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl5" value="강">
					<label for="lctCl5" class="form-check-label">강</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl6" value="호수">
					<label for="lctCl6" class="form-check-label">호수</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="lctCl" id="lctCl7" value="도심">
					<label for="lctCl7" class="form-check-label">도심</label>&nbsp;
				</div>
				<hr />
				<h6 class="font-weight-bold">주요시설</h6>
	        	<div class="form-check-inline form-check">
					<input type="checkbox" class="form-check-input" name="induty" id="induty0" value="일반야영장">
					<label for="induty0" class="form-check-label">일반야영장</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="induty" id="induty1" value="자동차야영장">
					<label for="induty1" class="form-check-label">자동차야영장</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="induty" id="induty2" value="카라반">
					<label for="induty2" class="form-check-label">카라반</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="induty" id="induty3" value="글램핑">
					<label for="induty3" class="form-check-label">글램핑</label>&nbsp;
				</div>
				<hr />
				<h6 class="font-weight-bold">바닥형태</h6>
	        	<div class="form-check-inline form-check">
					<input type="checkbox" class="form-check-input" name="siteBottomCl1" id="siteBottomCl1" value="잔디">
					<label for="siteBottomCl1" class="form-check-label">잔디</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="siteBottomCl2" id="siteBottomCl2" value="데크">
					<label for="siteBottomCl2" class="form-check-label">데크</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="siteBottomCl3" id="siteBottomCl3" value="파쇄석">
					<label for="siteBottomCl3" class="form-check-label">파쇄석</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="siteBottomCl4" id="siteBottomCl4" value="자갈">
					<label for="siteBottomCl4" class="form-check-label">자갈</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="siteBottomCl5" id="siteBottomCl5" value="맨흙">
					<label for="siteBottomCl5" class="form-check-label">맨흙</label>&nbsp;
				</div>
				<hr />
				<h6 class="font-weight-bold">부대시설</h6>
	        	<div class="form-check-inline form-check">
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl0" value="전기">
					<label for="sbrsCl0" class="form-check-label">전기</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl1" value="무선인터넷">
					<label for="sbrsCl1" class="form-check-label">무선인터넷</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl2" value="장작판매">
					<label for="sbrsCl2" class="form-check-label">장작판매</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl3" value="온수">
					<label for="sbrsCl3" class="form-check-label">온수</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl4" value="트렘폴린">
					<label for="sbrsCl4" class="form-check-label">트렘폴린</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl5" value="물놀이장">
					<label for="sbrsCl5" class="form-check-label">물놀이장</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl6" value="놀이터">
					<label for="sbrsCl6" class="form-check-label">놀이터</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl7" value="산책로">
					<label for="sbrsCl7" class="form-check-label">산책로</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl8" value="운동장">
					<label for="sbrsCl8" class="form-check-label">운동장</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl9" value="운동시설">
					<label for="sbrsCl9" class="form-check-label">운동시설</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="sbrsCl" id="sbrsCl10" value="마트.편의점">
					<label for="sbrsCl10" class="form-check-label">마트.편의점</label>&nbsp;
				</div>
				<hr />
				<h6 class="font-weight-bold">기타정보</h6>
	        	<div class="form-check-inline form-check">
					<input type="checkbox" class="form-check-input" name="trlerAcmpnyAt" id="trlerAcmpnyAt" value="개인 트레일러 입장가능">
					<label for="trlerAcmpnyAt" class="form-check-label">개인 트레일러 입장가능</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="caravAcmpnyAt" id="caravAcmpnyAt" value="개인 캠핑카 입장가능">
					<label for="caravAcmpnyAt" class="form-check-label">개인 캠핑카 입장가능</label>&nbsp;
					<input type="checkbox" class="form-check-input" name="animalCmgCl" id="animalCmgCl" value="반려동물 동반가능">
					<label for="animalCmgCl" class="form-check-label">반려동물 동반가능</label>&nbsp;
				</div>
	      	</div>
	      	<div class="modal-footer">
	        	<button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
	        	<button type="button" class="btn btn-success" id="conditionsSubmitBtn">확인</button>
	      	</div>
	      	
    	</div>
  	</div>
</div>
<script>
/**
 * 지역 선택
 */
$('document').ready(function() {
	var area0 = ["시/도 선택","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	var area1 = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	var area2 = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	var area3 = ["대덕구","동구","서구","유성구","중구"];
	var area4 = ["광산구","남구","동구","북구","서구"];
	var area5 = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	var area6 = ["남구","동구","북구","중구","울주군"];
	var area7 = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	var area8 = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	var area9 = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	var area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	var area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	var area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	var area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	var area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	var area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	var area16 = ["서귀포시","제주시","남제주군","북제주군"];

	// 시/도 선택 박스 초기화
	$("select[name^=sido]").each(function() {
		$selsido = $(this);
		$.each(eval(area0), function() {
			$selsido.append("<option value='"+this+"'>"+this+"</option>");
		});
		$selsido.next().append("<option value=''>구/군 선택</option>");
	});
	
	// 시/도 선택시 구/군 설정
	$("select[name^=sido]").change(function() {
		var area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		var $gugun = $(this).next(); // 선택영역 군구 객체
	  	$("option",$gugun).remove(); // 구군 초기화
	
	  	if(area == "area0")
	   		$gugun.append("<option value=''>구/군 선택</option>");
	  	else {
	   		$.each(eval(area), function() {
	    		$gugun.append("<option value='"+this+"'>"+this+"</option>");
	   		});
	  	}
	});
});

/**
 * 테마검색 페이지로 이동
 */
document.querySelector("#searchThemeBtn").addEventListener('click', (e) => {
	location.href = '${pageContext.request.contextPath}/campsite/searchTheme';
});

document.querySelector("#conditionsSubmitBtn").addEventListener('submit', (e) => {
	
});
</script>
<div class="d-flex bd-highlight w-100 p-3 m-auto campsite-result-wrap">
	<div class="p-2 flex-fill bd-highlight campsite-result">
		<c:forEach items="${list}" var="camp">
			<div class="d-flex bd-highlight m-1 result-list-wrap border border-light">
				<div class="result-list-img bg-light">
					<c:if test="${not empty camp.firstImageUrl}">
						<img src="${camp.firstImageUrl}" class="img-thumbnail" alt="${camp.facltNm} 대표이미지">
					</c:if>
					<c:if test="${empty camp.firstImageUrl}">
						<img src="${pageContext.request.contextPath}/resources/images/noImg.png" class="img-thumbnail" alt="${camp.facltNm} 대표이미지">
					</c:if>
				</div>
				<div class="result-list-content">
					<ul class="list-group list-group-flush">
						<li class="list-group-item">
							<h6>${camp.facltNm}</h6>
						</li>
						<li class="list-group-item border-bottom-0">${camp.lineIntro}</li>
						<li class="list-group-item border-top-0">
							<span>
								<i class="fa-solid fa-location-dot campsite-yellow"></i>&nbsp;
								<c:if test="${fn:length(camp.addr1) ge 15}">
									${fn:substring(camp.addr1, 0, 15)}...
			                   	</c:if> 
			                   	<c:if test="${fn:length(camp.addr1) lt 15}">
			                   		${camp.addr1}
			                   	</c:if>
							</span>
							<c:if test="${not empty camp.tel}">
								<span class="float-right"><i class="fa-solid fa-phone campsite-yellow"></i>&nbsp;${camp.tel}</span>
							</c:if>
						</li>
					</ul>
				</div>
			</div>
		</c:forEach>
	</div>
	<div class="p-2 flex-fill m-auto bg-light result-map" id="map"></div>
	<script src="${pageContext.request.contextPath}/resources/js/campsite/kakaoMap.js"></script>
</div>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>