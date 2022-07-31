<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/advertiser/advertiser.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container">
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 pl-5">
			<div class="d-flex justify-content-between" id="dashboardTop">
				<div>
					<form action="" name="chartPeriodFrm">
						<label for="">조회기간</label>
						<input type="date" name="chartStart" />
						<span>~</span>
						<input type="date" name="chartEnd" />
						<button class="btn btn-primary btn-sm">조회</button>
					</form>
				</div>
				<div>
					<span>애드머니</span>
					<span>4,200,000</span><small>원</small>
				</div>
			</div>
			<div class="" id="chartSection"></div>
			<button type="button" class="btn btn-primary btn-sm">광고만들기</button>
			<table>
				<thead>
					<tr>
						<td>삭제</td>
						<td style="width: 100px">On/Off</td>
						<td>광고소재명</td>
						<td>노출위치</td>
						<td>클릭수</td>
						<td>노출수</td>
						<td>클릭률</td>
						<td>클릭당 단가</td>
						<td>일예산</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><button class="btn btn-sm">삭제</button></td>
						<td style="width: 100px">
							<div class="custom-control custom-switch">
							  <input type="checkbox" class="custom-control-input" id="customSwitch1">
							  <label class="custom-control-label" for="customSwitch1">엥</label>
							</div>
						</td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</div>