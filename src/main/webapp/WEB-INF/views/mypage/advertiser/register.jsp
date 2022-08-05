<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/mypage.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mypage/advertiser/advertiser.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp"/>

<div class="container">
	<div class="row d-flex justify-content-between">
		<div class="col-lg-2">
			<jsp:include page="/WEB-INF/views/common/mypageSidebar.jsp"/>
		</div>
		<div class="col-lg-10 px-5">
			<h2>광고주 등록하기</h2>
			<form name="enrollAdvertiserFrm" action="" style="width:800px;">
				<div class="divInputWrapper">
					<label for="bizName">광고계정 이름</label>
					<input type="text" name="bizName" id="bizName" class="form-control form-control-sm" placeholder="광고계정명을 입력해주세요.">
				</div>
				<div class="divInputWrapper">
					<label for="bizLicenseNo">사업자등록번호</label>
					<div class="input-group">
						<input type="text" name="bizLicenseNo" id="bizLicenseNo" class="form-control form-control-sm" placeholder="사업자등록번호를 입력해주세요." aria-describedby="button-addon2">
						<div class="input-group-append">
							<button class="btn btn-outline-camper-color btn-sm" type="button" id="button-addon2">확인</button>
						</div>
					</div>
				</div>
				<div class="divInputWrapper">
					<label for="">사업자등록증</label>
					<input type="file" class="custom-file-input hide" name="adImg" id="validatedCustomFile" accept="image/*" required>
					<div class="divImgWrapper d-flex align-items-center justify-content-center" id="upFileWrapper">
						<button type="button" class="invisibleBtn" id="upFileBtn">
							<i class="fa-solid fa-circle-plus fa-2x midgreen"></i>
						</button>
					</div>
					<div class="divImgWrapper hide" id="previewWrapper">
						<img class="img-fluid rounded" id="preview" src="" alt="">
					</div>
				</div>
				<div class="divInputWrapper">
					<div name="divNotice" class="p-3">
						광고주 관련 기능은 관리자의 승인 후 이용하실 수 있습니다. 광고주 승인은 영업일 기준 최대 10일이 소요됩니다.
						광고관리 페이지에서 등록하신 광고는 충전된 애드머니 잔액과 해당 광고소재의 일예산, 클릭당 비용을 기준으로 노출됩니다.
					</div>
				</div>
				<div class="divInputWrapper">
					<button type="submit" class="btn btn-camper-color btn-block">광고주승인 요청하기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
<script>

document.querySelector("#upFileBtn").addEventListener('click', (e) =>{
	document.querySelector("#validatedCustomFile").click();
});
document.querySelector("#preview").addEventListener('click', (e) =>{
	document.querySelector("#validatedCustomFile").click();
});

document.querySelector("#validatedCustomFile").addEventListener('change', (e) =>{
	const input = e.target;
	const upFileWrapper = document.getElementById('upFileWrapper');
	const previewWrapper = document.getElementById('previewWrapper');
	
	if (input.files && input.files[0]) {
		const reader = new FileReader();
		reader.onload = function(e) {
			document.getElementById('preview').src = e.target.result;
		};
		reader.readAsDataURL(input.files[0]);
		
		previewWrapper.classList.remove('hide');
		previewWrapper.classList.add('d-flex');
		previewWrapper.classList.add('align-items-center');
		previewWrapper.classList.add('ustify-content-center');
		
		upFileWrapper.classList.add('hide');
		upFileWrapper.classList.remove('d-flex');
		upFileWrapper.classList.remove('align-items-center');
		upFileWrapper.classList.remove('ustify-content-center');
		
	} else {
		document.getElementById('preview').src = "";
		
		previewWrapper.classList.add('hide');
		previewWrapper.classList.remove('d-flex');
		previewWrapper.classList.remove('align-items-center');
		previewWrapper.classList.remove('ustify-content-center');
		
		upFileWrapper.classList.remove('hide');
		upFileWrapper.classList.add('d-flex');
		upFileWrapper.classList.add('align-items-center');
		upFileWrapper.classList.remove('ustify-content-center');
	}
});
</script>