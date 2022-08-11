<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/main.css"/>

<hr />
<!-- 광고 -->
<div class="adPlace">
	<div id="carouselExampleIndicators" class="carousel slide"
		data-bs-ride="carousel">
		<ol class="carousel-indicators">
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0"
				class="active"></li>
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"></li>
			<li data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="" id="ad1" class="d-block w-100"
					alt="광고이미지" style="cursor: pointer;">
			</div>
			<div class="carousel-item">
				<img src="" id="ad2"
					class="d-block w-100" alt="ad2" style="cursor: pointer;">
			</div>
			<div class="carousel-item">
				<img src="" id="ad3"
					class="d-block w-100" alt="ad3" style="cursor: pointer;">
			</div>
		</div>
		<a class="carousel-control-prev mx-auto" href="#carouselExampleIndicators"
			role="button" data-bs-slide="prev" style="margin-top: 133px;"> <span
			class="carousel-control-prev-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Previous</span>
		</a> <a class="carousel-control-next mx-auto" href="#carouselExampleIndicators"
			role="button" data-bs-slide="next" style="margin-top: 133px;"> <span
			class="carousel-control-next-icon" aria-hidden="true"></span> <span
			class="visually-hidden">Next</span>
		</a>
	</div>
</div>

<div id="displayHeader">
	<p class="displayName" style="margin-left: 7px;">전체 상품 목록</p>
</div>

<div id="display-list" class="row" style="width: 1200px;">
	<c:forEach items="${list}" var="list">
		<div class="item col-3"
			onclick="location.href='/campervalley/usedProduct/product/productDetail'">
			<div class="item">
				<div id="itemSolid">
					<img src="${list.productImg1} class="rounded float-start" alt="상품이미지">
					<h5 id="displayTitle">${list.productTitle}</h5>
					<div class="price-time">
						<p class="displayPrice">${list.productPrice}</p>
						<h5 class="displayTime">${list.productEnrollTime}</h5>
					</div>
				</div>
			</div>
		</div>	
	</c:forEach>	
</div>

<div id="moreShow">
	<a id="more" class="more" onclick="viewMore()">더 보기<br><i class="fa-solid fa-caret-down"></i>

	</a>
</div>
<script>
// 광고

// 전체 상품 목록 출력 및 페이징
var page = 0;

$(document).ready(function() {
	getProductList(page);
});

function viewMore() {
	page = page + 1;
	getProductList(page);
}

//ajax 통신을 위한 csrf 설정
var token = $("meta[name='_csrf']").attr("content");
var header = $("meta[name='_csrf_header']").attr("content");
$(document).ajaxSend(function(e, xhr, options) {
    xhr.setRequestHeader(header, token);
});


function getProductList(page) {
	
	console.log('page = ' + page);
	
	$.ajax({
		type : 'post',
		url : '${pageContext.request.contextPath}/usedProduct/main/getProductList',
		dataType : 'json',
		data : {
			page : page
		},
		success : function(data) {
	//		alert(JSON.stringify(data.list)); // json -> spring
			
			if(data.list.length == 0) {
				$('#more').hide();
			} else {
				$.each(data.list, function() {
					var html = "";
					var time = Number(this.productEnrollTime);
					var time_before = "분 전";
					
					if(time > (60 * 24)) {
						time = Math.round(time / (60 * 24));
						time_before = '일 전';
					} else if (time > 60) {
						time = Math.round(time / 60);
						time_before = "시간 전";
					} 
				
					html = '<div class="item col-3"' + 'onclick="productDetailNo('
						+ this.productNo + ');"'
						   + 'style="cursor: pointer;">'
						   + '<div class ="item">' + '<div id="itemSolid">'
						   + '<div class="img-box">'
						   + '<img src="${pageContext.request.contextPath}/resources/images/usedProduct/' + this.productImg1
						   + '" class="rounded float-start" alt="'
						   + this.productTitle + '">' + '</div>'
						   + '<div class="text-box">'
						   + '<div class="displayName">'
						   + this.productTitle + '</div>'
						   + '<div class="price-time">'
						   + '<div class="displayPrice">' + this.productPrice
						   + '</div>' + '<div class="displayTime"><span>'
						   + time + time_before + '<span></div>' + '</div>'
						   + '</div>' + '</div>' + '</div>' + '</div>'
					$('#display-list').append(html)
				})
			}
		},
		error : function(err) {
			console.log(err);
		}
	});
}

function productDetailNo(no) {
	location.href = '${pageContext.request.contextPath}/usedProduct/product/productDetail?no=' + no;
}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>