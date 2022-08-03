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
		<div class="col-lg-10">
			<div class="d-flex justify-content-between" id="dashboardTop">
				<div class="align-self-center">
					<form action="" name="chartPeriodFrm" class="m-0">
						<div class="form-row align-items-center">
							<label for="" class="mb-0">조회기간</label>
							<div class="form-group mb-0">
								<input type="date" class="form-control form-control-sm" name="chartStart" />
							</div>
							<div>
								<span>~</span>
							</div>
							<div class="form-group mb-0">
								<input type="date" class="form-control form-control-sm" name="chartEnd" />
							</div>
							<div>
								<button class="btn btn-camper-color btn-sm">조회</button>
							</div>
						</div>
					</form>
				</div>
				<div class="divAdMoney align-self-center">
					<h5 class="d-inline">
						<a id="adMoneyCharge" href="${pageContext.request.contextPath}/mypage/advertiser/admoney">애드머니</a>
					</h5>
					<h5 class="d-inline">
						4,200,000<small class="ml-1">원</small>
					</h5>
				</div>
			</div>
			<div class="my-3" id="chartSection"></div>
			<button type="button" class="btn btn-camper-color btn-sm" onclick="location.href='${pageContext.request.contextPath}/mypage/advertiser/enrollAd'">광고만들기</button>
			<table id="tblAdList" class="table my-3">
				<thead>
					<tr class="text-center">
						<td>삭제</td>
						<td>On/Off</td>
						<td class="tdAdName">광고소재명</td>
						<td class="tdAdZone">노출위치</td>
						<td>클릭수</td>
						<td>노출수</td>
						<td>클릭률</td>
						<td>클릭당 단가</td>
						<td>일예산</td>
						<td>수정</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td><button class="btn btn-camper-red btn-sm">삭제</button></td>
						<td>
							<div class="custom-control custom-switch text-center">
								<input type="checkbox" class="custom-control-input" name="adStatus" id="customSwitch1">
								<label class="custom-control-label" for="customSwitch1"></label>
							</div>
						</td>
						<td>
							<input type="text" class="form-control-plaintext"
								name="adName" value="${ad ? ad.adName : '소재명'}" />
						</td>
						<td>
							<input type="text" class="form-control-plaintext"
								name="adZone" value="${ad ? ad.adName : '위치'}" />
						</td>
						<td class="text-center">10</td>
						<td class="text-center">200</td>
						<td class="text-center">5<small>%</small></td>
						<td>
							<input type="number" class="form-control form-control-sm"
								name="adCpc" value="${ad ? ad.adName : '300'}" />
						</td>
						<td>
							<input type="number" class="form-control form-control-sm"
								name="adDailyBudget" value="${ad ? ad.adName : '100000'}" />
						</td>
						<td>
							<button class="btn btn-camper-color btn-sm">변경</button>
						</td>
					</tr>
				</tbody>
			</table>
			<div class="mt-5">
				<jsp:include page="/WEB-INF/views/common/pagebar.jsp" />
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />