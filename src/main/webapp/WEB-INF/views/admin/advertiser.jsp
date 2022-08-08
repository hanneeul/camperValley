<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/admin.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/admin/advertiser.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="container" id="admin-container" style="display: flex;">
	<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />
	<div class="admin-content" style="width: 80%;">
		<h5 class="admin-hd">광고주회원 관리</h5>
		<!-- 콘텐츠 영역 -->
		<div class="formBox my-5 d-flex align-items-center justify-content-center">
			<form name="searchAdvertiserFrm" action="">
				<div class="row">
					<div class="col row filterWrapper">
						<div class="px-0 d-flex align-items-center justify-content-center divInputWrapper">
							<label for="">승인상태</label>
							<select class="custom-select custom-select-sm" name="status">
								<option value="all" selected>전체</option>
								<option value="Y">승인완료</option>
								<option value="N">승인대기</option>
							</select>
						</div>
						<div class="col px-0 d-flex align-items-center justify-content-center divInputWrapper">
							<label for="memberId">회원ID</label>
							<input type="text" class="form-control form-control-sm" name="memberId"/>
						</div>
						<div class="col px-0 d-flex align-items-center justify-content-center divInputWrapper">
							<label for="memberId">광고계정명</label>
							<input type="text" class="form-control form-control-sm" name="bisName"/>
						</div>
						<div class="col px-0 d-flex align-items-center justify-content-center divInputWrapper">
							<label for="bizLicenseNo">사업자등록번호</label>
							<input type="text" class="form-control form-control-sm" name="bizLicenseNo"/>
						</div>
					</div>
					<div class="col-1 divInputWrapper">
						<button type="submit" class="btn btn-camper-color btn-sm">검색</button>
					</div>
				</div>
			</form>
		</div>
		<div class="listBox">
			<table id="tblAdvertiserList" class="table mt-5 mb-3">
				<thead class="listHead">
					<tr class="text-center">
						<td>상태</td>
						<td>회원ID</td>
						<td>광고계정명</td>
						<td>사업자등록번호</td>
						<td>사업자등록증</td>
						<td>승인요청일</td>
						<td>권한관리</td> <!-- 승인/회수 -->
					</tr>
				</thead>
				<tbody class="listBody">
					<c:forEach items="${list}" var="advertiser" varStatus="vs">
						<tr data-advertiser-no="${advertiser.advertiserNo}">
							<td class="${advertiser.bizStatus eq 'N' ? 'waiting' : 'permission'}">
								${advertiser.bizStatus eq 'N' ? '승인대기' : '승인완료'}
							</td>
							<td>${advertiser.memberId}</td>
							<td>${advertiser.bizName}</td>
							<td>
								<c:set var="bizLicenseNo" value="${advertiser.bizLicenseNo}"/>
								${fn:substring(bizLicenseNo, 0, 3)}-${fn:substring(bizLicenseNo, 3, 5)}-${fn:substring(bizLicenseNo, 5, 10)}
							</td>
							<td>
								<a href="${pageContext.request.contextPath}/admin/advertiser/fileDownload?no=${advertiser.licenseFile.licenseFileNo}"><i class="fa-solid fa-download"></i></a>
							</td>
							<td>
								<fmt:parseDate value="${advertiser.createdAt}" pattern="yyyy-MM-dd'T'HH:mm" var="createdAt" />
								<fmt:formatDate value="${createdAt}" pattern="yy-MM-dd HH:mm"/>
							</td>
							<td>
								<button class="btn btn-sm ${advertiser.bizStatus eq 'N' ? 'btn-camper-color' : 'btn-camper-red'}">${advertiser.bizStatus eq 'N' ? '승인' : '회수'}</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div class="mt-5 pagebar">${pagebar}</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>