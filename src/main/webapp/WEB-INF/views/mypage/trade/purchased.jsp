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
		        <div class="d-flex justify-content-between class="mt-3 mb-5">
		            <div class="d-flex">
		            	<a href=""><img src="/upload/member/ㅇㅇ.jpg" alt="" width="120px" class="mr-3 ml-3"></a>
		                <div class="d-flex">
		                    <ul class="list-unstyled mt-2">
		                        <li>
		                            <a href="" class="text-dark font-weight-bold">상품이름</a>
		                        </li>
		                        <li>100원</li>
		                        <br>
		                        <li>경기도 군포시 ~동</li>
		                    </ul>
		                </div>
		            </div>
		                <a href="거래후기url" class="btn btn-camper-color btn-sm align-self-center mr-3" >거래후기 작성</a>
		        </div>
		        <hr />
		        <div class="d-flex justify-content-between class="mt-3 mb-5">
		            <div class="d-flex">
		            	<a href=""><img src="/Final/img/ㅇㅇ.jpg" alt="" width="120px" class="mr-3 ml-3"></a>
		                <div class="d-flex">
		                    <ul class="list-unstyled mt-2">
		                        <li>
		                            <a href="" class="text-dark">상품이름</a>
		                        </li>
		                        <li>100원</li>
		                        <br>
		                        <li>경기도 군포시 ~동</li>
		                    </ul>
		                </div>
		            </div>
		                <a href="거래후기url" class="btn btn-outline-camper-color btn-sm align-self-center mr-3" >거래후기 수정</a>
		        </div>
		    </div>

		<%-- 본문끝 --%>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />