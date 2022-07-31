<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<style>
.divInputWrapper {
	margin: 3em 0;
}
div[name="divNotice"] {
	background-color: gainsboro;
}
</style>
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container">
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2 mt-5">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 mt-5 px-5">
			<h2>광고주 해제하기</h2>
			<form name="exitAdvertiserFrm" action="" style="width: 800px;">
				<div class="divInputWrapper">
					<label for="bizName">광고계정 이름</label>
					<input type="text" name="bizName" id="bizName" class="form-control form-control-sm" readonly>
				</div>
				<div class="divInputWrapper">
					<label for="bizLicenseNo">사업자등록번호</label>
					<input type="text" name="bizLicenseNo" id="bizLicenseNo" class="form-control form-control-sm"
						placeholder="광고주님의 사업자등록번호를 입력해주세요.">
					<small class="form-text text-muted">사업자등록번호가 일치하지 않습니다.</small>
				</div>
				<div class="divInputWrapper">
					<label for="admoney">잔여애드머니</label>
					<input type="text" name="admoney" id="admoney" class="form-control form-control-sm" readonly>
				</div>
				<div class="divInputWrapper">
					<label>광고주 해제 규정</label>
					<div name="divNotice" class="p-3">광고주해제 시 잔여 애드머니는 자동으로 환불되지 않습니다. 이점 유의하시어 잔여 애드머니를 환불하신 뒤에 광고주 해제하시길 바랍니다.</div>
					<div class="form-group form-check text-right mt-1">
						<input type="checkbox" name="agreement" id="agreement" />
						<label for="agreement" class="form-check-label">광고주 해제 규정을 확인하였습니다.</label>
					</div>
				</div>
				<div class="divInputWrapper">
					<button type="submit" class="btn btn-danger btn-block">광고주 해제하기</button>
				</div>

			</form>
		</div>
	</div>
</div>