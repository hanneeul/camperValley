<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/main.css"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/usedProduct/sidebar.css"/>

<input type="hidden" id="cateNo" name="cateNo" value="${cateNo}"/>
<input type="hidden" id="cateName" name="cateName" value="${cateName}"/>
<input type="hidden" id="cnt" name="cnt" value="${cnt}"/>
<input type="hidden" id="order" name="order" value="${order}"/>
<input type="hidden" id="page" name="page" value="${page}"/>

<div id="section" style="margin-top: 180px; margin-bottom: 100px;}">
	<!-- page -->
	<div id="productTop">
		<!-- 상품+개수 -->
		<div>
			<span id="productName">${cateNo}</span>
			<span id="productName">${cateName}</span>
			<span class="productNum">${cnt}개</span>
		</div>
	</div>
	
	<div class="productListTop" style="height: 30px;">
		<div class="listTopInner">
			<div class="group" style="float: right; margin-right: 10px;">
				<!-- 카테고리 정렬 -->
			<a class="groupChecked ${order eq null ? 'active' : ''} ${order eq 'A' ? 'active' : ''}"
				onclick="order('A')">최신순</a> <a
				class="groupOther ${order eq 'B' ? 'active' : ''}"
				onclick="order('B')">인기순</a> <a
				class="groupOther ${order eq 'C' ? 'active' : ''}"
				onclick="order('C')">저가순</a> <a
				class="groupOther ${order eq 'D' ? 'active' : ''}"
				onclick="order('D')">고가순</a>
			</div>
		</div>
	</div>
	
<div id="display-list" class="row">
	<c:forEach varStatus="status" items="${list}" var="item">
		<c:set var="b_time" value="${item.productEnrollTime}" />
		<c:set var="time"
			value="${ b_time > (60 * 24) ? Math.round( b_time / (60 * 24) ) : ( b_time > 60 ? Math.round( b_time / 60 ) : b_time ) }" />

		<c:if test="${60 > b_time }">
			<c:set var="unit" value="분 전" />
		</c:if>
		<c:if test="${ b_time > 60 }">
			<c:set var="unit" value="시간 전" />
		</c:if>
		<c:if test="${ b_time > (60 * 24) }">
			<c:set var="unit" value="일 전" />
		</c:if>
		
		<div class="item col-3" onclick="test(${item.productNo})" style="cursor: pointer">
			<div class="item">
				<div id="itemSolid">
					<div class="img-box">
						<img src="${pageContext.request.contextPath}/resources/images/usedProduct/${item.productImg1}" class="rounded float-start" alt="${item.productTitle}">
					</div>
					<div class="text-box">
						<div class="displayName">${item.productTitle}</div>
						<div class="price-time">
							<div class="displayPrice">${item.productPrice}</div>
							<div class="displayTime">
								<span>${time}${time_before}<span>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:forEach>
</div>
	<!-- sidebar -->
	<div id="nav">
		 <jsp:include page="/WEB-INF/views/usedProduct/main/sidebar.jsp"/>
	</div>
</div>

<script>
function order(order) {
	location.href="/campervalley/usedProduct/main/cateDisplay"
				 + '?cateNo=' + $("#cateNo").val()
				 + "&page=" + $("#page").val()
				 + "&order=" + order
}

function test(no) {
	location.href = "/campervalley/usedProduct/product/productDetail?no=" + no
}
</script>

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>