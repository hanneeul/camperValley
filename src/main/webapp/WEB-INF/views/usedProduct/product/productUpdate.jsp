<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/productForm.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/sidebar.css"/>

<div id="section" style="width: 81%; margin:50px auto">
	<form id="enrollForm" >
	<div class="enrollWrap">
		<!--------- enrollBody  --------->
		<div class="enrollBody">
			<main id="enrollMain">
			
				<!-- section -->
				<section class="section">
					<h2>기본정보<span>*필수항목</span></h2>
					
					<ul class="listBody">
						<li class="list">
							<div class="image_sub">상품이미지<span>*</span><small>(0/5)</small></div>
							<div class="image_con">
								<ul class="registImages" id="imageList">
									<li class="imageList">이미지 등록
										    	<input type="file" class="custom-file-input" name="upFile" id="upFiles" accept="image/*" multiple>
														    										    		<label for="upFiles">첨부파일을 선택해주세요.</label>
									</li>
								</ul>
								<div class="imageDiv" id="imageDiv" style="margin-left: 2.5rem;">
											상품 사진을 등록해주세요.</div>
								<div class="add_description" style="">
									<b>* 상품 이미지는 640x640에 최적화 되어 있습니다.</b><br>
									- 이미지는 상품등록 시 정사각형으로 짤려서 등록됩니다.<br>
									- 이미지를 클릭 할 경우 원본이미지를 확인할 수 있습니다.<br>
									- 이미지를 클릭 후 이동하여 등록순서를 변경할 수 있습니다.<br>
									- 큰 이미지일경우 이미지가 깨지는 경우가 발생할 수 있습니다.<br>
								</div>
							</div>
						</li><!-- 상품이미지 -->
							
							
						<li class="list">
							<div class="subject_sub">제목<span>*</span></div>
							<div class="subject_con">
								<div class="contentArea">
									<div class="subjectBox">
										<input type="text" placeholder="상품 제목을 입력해주세요." class="subjectInput" id="product_subject" name="product_subject">
									</div>
									<div class="subjectSize"><span>(0/30)</div>
								</div>
								<div class="subjectDiv" id="subjectDiv">상품명을 2자 이상 입력해주세요.</div>
							</div>
						</li><!-- 제목 -->
							
							
						<li class="list">
							<div class="category_sub">카테고리<span>*</span></div>
							<div class="category_con">
								<div class="contentArea">
									<div class="categoryStep">
										<ul class="categories" id="large_categories">
											<li class="category"><button type="button" class="btn" id="100">텐트/타프</button></li>
											<li class="category"><button type="button" class="btn" id="200">침낭/매트</button></li>
											<li class="category"><button type="button" class="btn" id="300">테이블/의자</button></li>
											<li class="category"><button type="button" class="btn" id="400">조명기구</button></li>
											<li class="category"><button type="button" class="btn" id="500">주방용품</button></li>
											<li class="category"><button type="button" class="btn" id="600">화로/버너/BBQ</button></li>
											<li class="category"><button type="button" class="btn" id="700">안전/위생용품</button></li>
											<li class="category"><button type="button" class="btn" id="800">전기/전자제품</button></li>
											<li class="category"><button type="button" class="btn" id="900">캠핑카/카라반/용품</button></li>
											<li class="category"><button type="button" class="btn" id="1000">루프탑/트레일러</button></li>
											<li class="category"><button type="button" class="btn" id="1100">차박용품</button></li>
											<li class="category"><button type="button" class="btn" id="1200">의류/수납용품</button></li>
											<li class="category"><button type="button" class="btn" id="1300">겨울용품</button></li>
											<li class="category"><button type="button" class="btn" id="1400">기타캠핑용품</button></li>
											<li class="category"><button type="button" class="btn" id="1500">기타생활용품</button></li>
										</ul>
									</div>
								</div>
								<div class="categoryDiv" id="categoryDiv">카테고리를 선택해주세요.</div>
								
								<h3 class="selectedCategory">선택한 카테고리 : <b id="selectedCategory" name="cate_code"></b></h3>
							</div>
						</li><!-- 카테고리 -->
						
						
						<li class="list">
							<div class="location_sub">거래지역<span>*</span></div>
							<div class="location_con">
								<div class="contentArea">
									<button type="button" id="searchAddr">주소 검색</button>
								</div>
								<input placeholder="선호 거래 지역을 검색해주세요." class="locationInput" id="product_location" name="product_location">
								<div class="locationDiv" id="locationDiv">거래지역을 선택해주세요.</div>
								<div class="add_description" style="margin-left: 0px;">
									<b>* 주소 검색 후 구매자에게 알려주고 싶은 주소 범위까지만 나타나도록 주소를 수정해주세요.</b><br>
									ex) 서울특별시 서초구 서초동 1303-34 → 서울특별시 서초구 서초동
								</div>
								<div id="map" style="width:300px;height:300px;margin-top:10px;display:none"></div>
							</div>
						</li><!-- 거래지역 -->
					
						<li class="list">
							<div class="price_sub">가격<span>*</span></div>
							<div class="price_con">
								<div class="priceBox">
									<input type="text" placeholder="숫자만 입력해주세요." class="priceInput" id="product_price" name="product_price">원
								</div>
	
								<!-- 배송비 포함 여부 -->
								<div class="deliveryArea">
									<div class="deliveryBox">
										<label for="freeDelivery" class="freeDelivery">
											<input id="freeDelivery" type="checkbox">배송비 포함
										</label>
									</div>
								</div>
								<div class="priceDiv" id="priceDiv">0원 이상 입력해주세요. (무료 나눔 시 0원으로 설정해주세요)</div>
							</div>
						</li><!-- 가격 -->
						
						
						<li class="list">
							<div class="instruction_sub">설명</div>
							<div class="instruction_con">
								<textarea placeholder="상품 설명을 입력해주세요." rows="6" class="instruction" id="product_content" name="product_content"></textarea>
								<div class="limit">최대 1000자</div>
							</div>
						</li><!-- 설명 -->
	
	
						<!-- 연관 태그 -->
						<li class="list">
							<div class="tag_usb">연관태그</div>
							<div class="tag_con">
								<div class="contentArea">
									<div class="tagInputWrap">
										<div class="tagInputArea">
											<input type="text" placeholder="연관태그를 입력해주세요. (최대 5개)"
												value="" id="tagInput" autocomplete="off" style="border: none;">
										</div>
									</div>
								</div>
								<ul class="tag_comment">
									<li><p>태그는 띄어쓰기로 구분되며 최대 8자 까지 입력할 수 있습니다.</p></li>
									<li><p>태그는 검색의 부가정보로 사용 되지만, 검색 결과 노출을 보장하지는 않습니다.</p></li>
									<li><p>검색 광고는 태그정보를 기준으로 노출됩니다.</p></li>
									<li><p>상품과 직접 관련이 없는 다른 상품명, 브랜드, 스팸성 키워드 등을 입력하면 노출이 중단되거나 상품이 삭제될 수 있습니다.</p></li>
								</ul>
							</div>
						</li>
					</ul>
				</section>
			</main>
		</div>
					
					
		<footer class="enrollBtm">
			<div class="btmArea">
				<button type="submit" class="enrollBtn" id="enrollBtn">등록하기</button>
			</div>
		</footer>
	
	</div>
	</form>
	<div id="nav">
		<jsp:include page="/WEB-INF/views/usedProduct/main/sidebar.jsp"/>
	</div>
</div>
<script>
window.onload = function() {
	const target = document.getElementById('upFiles');
	const label = target.nextElementSibling;
	target.addEventListener('change', () => {
		let upFileList = '';
		if(upFileList != null) {
	        for(i = 0; i < target.files.length; i++) {
	        	upFileList += target.files[i].name + ' ';
	        }
	        label.innerText = upFileList;
		}
		else {
			label.innerText = '첨부파일을 선택해주세요.';
		}
    });
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>