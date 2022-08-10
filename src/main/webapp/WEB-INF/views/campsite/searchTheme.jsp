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

<!-- 캠핑장목록조회(테마검색) 페이지 (작성자:SJ) -->
<div class="d-flex justify-content-center campsite-search-wrap">
	<div class="container-md w-75 p-4 m-auto rounded campsite-search">
		<div class="row m-0">
			<div class="col search-header">테마검색</div>
			<div class="col">
				<button type="button" id="searchDetailBtn" class="btn btn-success btn-camper-color float-right">
					상세검색&nbsp;<i class="fa-solid fa-angle-right"></i>
				</button>
			</div>	
		</div>
		<hr />
		<div class="row m-0 text-center">
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl1" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl1" value="80" title="80">#일출명소
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl2" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl2" value="81" title="81">#일몰명소
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl3" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl3" value="82" title="82">#수상레저
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl4" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl4" value="83" title="83">#항공레저
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl5" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl5" value="84" title="84">#스키
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl6" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl6" value="85" title="85">#낚시
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl7" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl7" value="154" title="154">#액티비티
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl8" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl8" value="86" title="86">#봄꽃여행
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl9" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl9" value="87" title="87">#여름물놀이
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl10" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl10" value="88" title="88">#가을단풍명소
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl11" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl11" value="89" title="89">#겨울눈꽃명소
			  	</label>
			</div>
			<div class="btn-group-toggle col-md-2 px-0 py-1" data-toggle="buttons">
			  	<label for="themaEnvrnCl12" class="btn btn-outline-success btn-outline-camper-color">
			    	<input type="checkbox" name="themaEnvrnCl" id="themaEnvrnCl12" value="90" title="90">#걷기길
			  	</label>
			</div>
		</div>
	</div>
</div>
<script>
/**
 * 상세검색 페이지로 이동
 */
document.querySelector("#searchDetailBtn").addEventListener('click', (e) => {
	location.href = '${pageContext.request.contextPath}/campsite/searchDetail';
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