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
		    <div class="list-container">
		    <c:forEach items="${list}" var="product" varStatus="vs">
		        <div class="d-flex justify-content-between list mt-4 mb-4 list">
		            <div class="d-flex">
		            	<a href="${pageContext.request.contextPath}/usedProduct/product/productDetail?no=${product.productNo}"><img src="${pageContext.request.contextPath}/resources/upload/usedProduct/${product.productImg1}" alt="${product.productTitle}대표 이미지" width="120px" class="mr-3 ml-3"></a>
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
<div class="d-flex justify-content-center mt-3">
  <div class="spinner-border d-none" role="status">
    <span class="sr-only">Loading...</span>
    <input type="hidden" name="addNum" value="0" />
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
<%-- JH END --%>
<script>
const io = new IntersectionObserver((entries, observer) => {
	  entries.forEach((entry) => {
    	$('div.spinner-border').removeClass("d-none");
	    if (entry.isIntersecting) {
	    	let list = null;
	    	observer.disconnect();
	    	 
	        $.ajax({
	        	url:'${pageContext.request.contextPath}/mypage/trade/morePuschasedProduct',
	        	async: false,
	        	data:{
	        		offset: $('.list').length,
	        		},
	        	success(response){
	        			const {list} = response;
	        			$('input[name=addNum]').val(list.length) ;
	        			list.forEach((product) =>{
							const $prdDetailLink = '<a href="${pageContext.request.contextPath}/usedProduct/product/productDetail?no='+product.productNo+'"></a>';  	        			
							const $br = '<br>';
							const $a = '<a></a>';
		        				
		        			$('.list-container').append('<div class="d-flex justify-content-between mt-4 mb-4 list"></div>');
		        			$('.list').last().append('<div class="d-flex"></div>');
		        			$('.list .d-flex').last().append($prdDetailLink, '<div class="d-flex"></div>');
		        			$('.list .d-flex a').last().append('<img src="${pageContext.request.contextPath}/resources/upload/usedProduct/' + product.productImg1 +'" alt="'+ product.productTitle +'대표 이미지" width="120px" class="mr-3 ml-3">');
		        			$('.list .d-flex').last().append('<ul class="list-unstyled mt-2"></ul>');
		        			$('.list ul.list-unstyled').last().append('<li></li>');
		        			$('.list li').last().append($prdDetailLink);
		        			$('.list a').last().prop({
		        				innerHTML:product.productTitle,
		        				className: 'font-weight-bold text-dark'
		        			});
		        			$('.list ul.list-unstyled').last().append('<li>'+ product.productPrice +'원</li>', $br, '<li>'+ product.productLocation +'</li>');
		        			
		        			$('.list').last().innrtHTML('<div></div>');
		        			$('.list div').last().append($a);
		        			
		        			console.log('거래후기등록하는 경우',product.reviewNo, typeof(product.reviewNO));
		        			$('.list a').last().prop({
		        				innerHTML: '게시글 수정',
		        				className: 'btn btn-camper-color btn-sm align-self-center mr-3 d-block',
		        				
		        			});
	
		        				
		        			$('.list-container').append($('<hr>'));		
	        			
	        			} );
	        		},
        		error: console.log
	        	
	        });
	    	$('div.spinner-border').addClass("d-none");
	  	    if($('input[name=addNum]').val() === '0'){
				   io.observe($('.list').get($('.list').length-1));
		  	    	return;
		 	}
	    }
	  });
});

	io.observe($('.list').get($('.list').length-1));
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />