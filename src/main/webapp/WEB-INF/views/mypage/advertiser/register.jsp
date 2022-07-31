<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<style>
img {
	width: 200px;
	height: 200px;
}
div[name="divNotice"] {
	background-color: gainsboro;
}
.divInputWrapper {
	margin: 3em 0;
}
.divImgWrapper {
	border-radius: 1em;
	width: 8em;
	height: 8em;
	background-color: #f0f0f0;
}
.deepgreen {
	color: #2B580C;
}
.midgreen {
	color: #639A67;
}
</style>

<script src="https://kit.fontawesome.com/4ade5a15fa.js" crossorigin="anonymous"></script>

<div class="container">
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2 mt-5">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp"/>
		</div>
		<div class="col-lg-10 mt-5 px-5">
			<h2>광고주 등록하기</h2>
			<form name="enrollAdvertiserFrm" action="" style="width:800px;">
				<div class="divInputWrapper">
					<label for="bizName">광고계정 이름</label>
					<input type="text" name="bizName" id="bizName" class="form-control form-control-sm" placeholder="광고계정명을 입력해주세요.">
				</div>
				<div class="divInputWrapper">
					<label for="bizLicenseNo">사업자등록번호</label>
					<div class="row">
						<div class="col">
							<input type="text" name="bizLicenseNo" id="bizLicenseNo" class="form-control form-control-sm" placeholder="사업자등록번호를 입력해주세요.">
						</div>
						<div class="col-1">
							<button type="button" class="btn btn-outline-primary btn-sm">확인</button>
						</div>
					</div>
				</div>
				<div class="divInputWrapper">
					<label for="">사업자등록증</label>
					<div class="divImgWrapper d-flex align-items-center justify-content-center">
						<i class="fa-solid fa-circle-plus fa-2x midgreen"></i>
						<!-- <img class="img-fluid rounded" src="${pageContext.request.contextPath}/resources/images/서강준.jpg" alt=""> -->
						<!-- <img class="rounded" src="" alt=""> -->
					</div>
				</div>
				<div class="divInputWrapper">
					<div name="divNotice" class="p-3">
						광고주 관련 기능은 관리자의 승인 후 이용하실 수 있습니다. 광고주 승인은 영업일 기준 최대 10일이 소요됩니다.
						광고관리 페이지에서 등록하신 광고는 충전된 애드머니 잔액과 해당 광고소재의 일예산, 클릭당 비용을 기준으로 노출됩니다.
					</div>
				</div>
				<div class="divInputWrapper">
					<button type="submit" class="btn btn-primary btn-block">광고주승인 요청하기</button>
				</div>
			</form>
		</div>
	</div>
</div>
