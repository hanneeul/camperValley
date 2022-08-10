<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/advertiser/advertiser.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />

<!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

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
						${admoney.balance}<small class="ml-1">원</small>
					</h5>
				</div>
				<div class="selectBtnWrapper">
					<button type="button" class="btn btn-camper-color btn-block" onclick="clickChargeBtn(100000);">100,000원 충전</button>
					<button type="button" class="btn btn-camper-color btn-block" onclick="clickChargeBtn(250000);">250,000원 충전</button>
					<button type="button" class="btn btn-camper-color btn-block" onclick="clickChargeBtn(500000);">500,000원 충전</button>
					<button type="button" class="btn btn-camper-color btn-block" onclick="clickChargeBtn(1000000);">1,000,000원 충전</button>
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
								<button class="btn btn-camper-color" onclick="clickChargeBtn(chargeCustom.value);">충전</button>
							</div>
						</div>
					</div>
				</div>
				<div class="text-right">
					<button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#refundModal">애드머니 환불</button>
				</div>
			</div>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<%-- 모달영역 --%>
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

<spring:eval var="impStoreCode" expression="@customProperties['api.impStoreCode']" />
<script>
IMP.init('${impStoreCode}');

const clickChargeBtn = (amount) => {
	const merchantUid = '${admoney.advertiserNo}_' + new Date().getTime()

	IMP.request_pay({
		pg : 'html5_inicis.INIpayTest', // 일반결제 테스트 상점아이디 : INIpayTest
		pay_method : 'card',
		merchant_uid : merchantUid,
		name : '애드머니충전',
		digital: true,
		amount : 10, // 임의결제금액
		buyer_name : '홍길동', // loginMember.name
		buyer_tel : '01011111111', // loginMember.tel
		buyer_email : 'honggd@gmail.com' // loginMember.email
	}, function (rsp) {
		if(rsp.success) {
			console.log(rsp);
			const {imp_uid : impUid, pay_method : payMethod, paid_amount : paidAmount, status, 
				buyer_email : buyerEmail, buyer_name : buyerName, buyer_tel : buyerTel, paid_at : paidAt, pg_provider : pgProvider} = rsp;
			
			const headers = {
				"${_csrf.headerName}" : "${_csrf.token}"
			};
			
			$.ajax({
				url : '${pageContext.request.contextPath}/mypage/advertiser/admoneyCharge',
				method : 'POST',
				headers,
				data : {
					merchantUid,
					advertiserNo : '${admoney.advertiserNo}',
					impUid,
					payMethod,
					paidAmount,
					status,
					buyerEmail,
					buyerName,
					buyerTel,
					paidAt,
					pgProvider
				}
			}).done(function(data) {
				console.log("결제정보 처리 완료");
			});
		} else {
			console.log(rsp.error_msg);
		}
	});
}
</script>