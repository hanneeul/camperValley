<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/trade/trade.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container">	
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 px-5 ">
		<%-- 본문시작 --%>
		   <h3 class="mb-5 mt-1">구매내역</h3>
		    <div >
		    <c:forEach items="${list}" var="product" varStatus="vs">
		        <div class="d-flex justify-content-between class="mt-3 mb-5">
		            <div class="d-flex">
		            	<a href="${pageContext.request.contextPath}/usedProduct/product/productDetail?no=${product.productNo}"><img src="${pageContext.request.contextPath}/resources/upload/usedProduct/${product.productImg1}" alt="${product.productTitle}썸네일" width="120px" class="mr-3 ml-3"></a>
		                <div class="d-flex">
		                    <ul class="list-unstyled mt-2">
		                        <li>
		                            <a href="${pageContext.request.contextPath}/usedProduct/product/productDetail?no=${product.productNo}" class="text-dark font-weight-bold">${product.productTitle}</a>
		                        </li>
		                        <li><fmt:formatNumber value="${product.productPrice}" pattern="#,###"/>원</li>
		                        <br>
		                        <li>${product.productLocation}</li>
		                    </ul>
		                </div>
		            </div>
		            <c:if test="${empty product.reviewNo || product.reviewNo eq ''}">
		                <a class="review-enroll btn btn-camper-color btn-sm align-self-center mr-3" data-productno="${product.productNo}">거래후기 등록</a>
		            </c:if>
		            <c:if test="${not empty product.reviewNo && product.reviewNo ne ''}" >
		                <a class="review-update btn btn-danger btn-sm align-self-center mr-3" data-reviewno="${product.reviewNo}" data-starscore="${product.starScore}" data-content="${product.content}">거래후기 수정</a>
		            </c:if>
		        </div>
		        <hr />
	        </c:forEach>
		    </div>

		<%-- 본문끝 --%>
		</div>
	</div>
</div>
<%-- JH START --%>
<jsp:include page="/WEB-INF/views/tradereview/reviewEnroll.jsp" />
<jsp:include page="/WEB-INF/views/tradereview/reviewUpdate.jsp" />
<script>
document.querySelectorAll(".review-enroll").forEach((btn) => {
	btn.addEventListener('click', (e) => {
		e.preventDefault();
		const productNo = e.target.dataset.productno;
		$("#reviewEnroll").modal().on('hide.bs.modal');
		$("#reviewEnroll .fa-star").css("color", "rgb(230, 185, 20)");
		$("#reviewEnroll #ctent").val("");
		$("#reviewEnroll #starScore").val("5");
		$("#reviewEnroll #productNo").val(productNo);
	});
});

document.querySelectorAll(".review-update").forEach((btn) => {
	btn.addEventListener('click', (e) => {
		e.preventDefault();
		const reviewNo = e.target.dataset.reviewno;
		const index = e.target.dataset.starscore - 1;
		const content = e.target.dataset.content;
		$("#reviewUpdate").modal().on('hide.bs.modal');
		$("#reviewUpdate .fa-star").css("color", "rgb(235, 235, 235)");
		for(let i = 0; i < 5; i++) {
			if(i <= index) $(`#reviewUpdate .fa-star:nth-child(\${i+1})`).css("color", "rgb(230, 185, 20)");
		}
		$("#reviewUpdate #starScore").val(`\${index + 1}`);
		$("#reviewUpdate #ctent").val(content);
		$("#reviewUpdate #wordCount").html($("#reviewUpdate #ctent").val().length);
		$("#reviewUpdate .reviewNo").val(reviewNo);
	});
});
</script>
<%-- JH START --%>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />