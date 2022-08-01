<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>
<script src="https://kit.fontawesome.com/97c6ec6a69.js" crossorigin="anonymous"></script>
<style>
.content {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}
#searchProduct {
	margin-top: -4.5px;
    margin-left: -31px;
    position: absolute;
    top: 56px;
    left: 875.5px;
    width: 242px;
    height: 41px;
    border: 2.5px solid lightgray;
    border-radius: 3px;
    font-size: 12.5px;
    letter-spacing: 0.9px;
}
#searchBtn {    
	margin-top: 11px;
    position: relative;
    top: 51px;
    left: 1057px;
    color: #639A67;
    font-size: 18px;
}
</style>

<!-- 검색창 영역 -->
<div class="search-area">
	<!-- 검색 입력 -->
	<div class="input-group">
		<!-- autocomplete=off 자동완성기능X -->
		<input id="searchProduct" name="searchProduct" type="text"
				autocomplete="off" placeholder=" 상품명, @상점명"> <i
				id="searchBtn" style="cursour:pointer;" onclick=""
				class="fas fa-search"></i>
	</div>
</div>

<!-- container -->
<div class="content"
		style="" >

	<!-- section -->
	<div id="section" style="margin-left:10px;">
		<div>
			<c:if test="${not empty display}">
				<jsp:include page="${display}" />
			</c:if>
			<c:if test="${empty display}">
				<jsp:include page="/WEB-INF/views/usedProduct/display.jsp"/>
			</c:if>
		</div>
	</div>
	<!-- 아이템  -->
</div>

<!-- nav -->
<div id="nav">
	<jsp:include page="/WEB-INF/views/usedProduct/nav.jsp"/>
</div>

