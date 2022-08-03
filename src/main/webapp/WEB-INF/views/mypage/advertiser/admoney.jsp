<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/advertiser/advertiser.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<div class="container">
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp" />
		</div>
		<div class="col-lg-10 px-5">
			<div class="adMoneyWrapper mx-auto">
				<h2>애드머니</h2>
				<div class="divNowAdMoney d-flex justify-content-between">
					<h6 class="d-inline">현재 보유 애드머니</h6>
					<h5 class="d-inline">
						4,200,000<small class="ml-1">원</small>
					</h5>
				</div>
				<form action="" name="chargeAdmoneyFrm">
					<input type="hidden" name="amount"/>
					<button type="button" class="btn btn-camper-color btn-block" id="charge100000">100,000원 충전</button>
					<button type="button" class="btn btn-camper-color btn-block" id="charge250000">250,000원 충전</button>
					<button type="button" class="btn btn-camper-color btn-block" id="charge500000">500,000원 충전</button>
					<button type="button" class="btn btn-camper-color btn-block" id="charge1000000">1,000,000원 충전</button>
					<div class="form-group">
						<label for="">직접입력하기</label>
						<div class="form-row d-flex justify-content-between">
							<div class="form-row align-items-center">
								<div class="col-auto">
									<input type="number" class="form-control" name="amountCustom" id="chargeCustom" />
								</div>
								<div class="col-auto">
									<span>원</span>
								</div>
							</div>
							<div class="col-auto">
								<button class="btn btn-camper-color">충전</button>
							</div>
						</div>
					</div>
				</form>
				<div class="text-right">
					<button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#refundModal">애드머니 환불</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<div class="modal fade" id="refundModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">애드머니 환불</h5>
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<form action="" name="refundAdmoneyFrm">
				<div class="modal-body px-4">
					<p>환불가능금액 : </p>
					<div class="form-row align-items-center">
						<div class="col-auto">
							<span>환불금액 지정 : </span>
						</div>
						<div class="col-auto">
							<input type="number" class="form-control" name="" id="refundCustom" />
						</div>
						<div class="col-auto">
							<span>원</span>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-sm btn-secondary" data-dismiss="modal">뒤로가기</button>
					<button type="button" class="btn btn-sm btn-camper-red">환불하기</button>
				</div>
			</form>
		</div>
	</div>
</div>