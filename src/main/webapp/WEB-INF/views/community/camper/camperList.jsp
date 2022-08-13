<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/community/camper/camperList.css" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/css/bootstrap-select.min.css">
<!-- Latest compiled and minified JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap-select@1.14.0-beta3/dist/js/bootstrap-select.min.js"></script>

	<div class="container-md campsite-review-list-wrap pt-2">
		<jsp:include page="/WEB-INF/views/community/communityHeading.jsp"/>
			<div class="col-md float-right">
				<div class="input-group align-items-center community-search-enroll">
			    	<select id="searchType" class="custom-select btn-outline-success btn-outline-camper-color">
						<option value="" disabled selected>선택</option>
						<option value="memberId">작성자</option>
					   	<option value="title">제목</option>
					    <option value="content">내용</option>
					</select>
					<input type="text" name="searchKeyword" class="form-control border-camper-color community-search-input" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="communitySearchBtn">
				  	<div class="input-group-append">
				    	<button class="btn btn-outline-success btn-outline-camper-color" type="button" id="communitySearchBtn">
				    		<i class="fa-solid fa-magnifying-glass camper-color"></i>
				    	</button>
				  	</div>
					<div class="ml-1">
						<button type="button" id="communityEnrollBtn" class="btn btn-success bg-camper-color" onclick="location.href='${pageContext.request.contextPath}/community/camper/camperEnroll'">글쓰기</button>
					</div>
				</div>
			</div>
		</div>
		<div class="pl-3 d-flex justify-content-between mt-4">
			<div id="listSection">
				<label for="toggle" class="chk_box">
					<input type="checkbox" id="toggle" checked="checked" />
					<span class="on"></span>
					모집중 게시글만 조회
				</label>
				<%-- <c:set var="loginMember" value="<sec:authentication property ="principal.username"/>"/> --%>
				<c:forEach var="camper" items="${camperList}" varStatus="vs">
					<div class="${vs.first ? "boardBoxSelect" : "boardBox"} my-4 p-4" onclick="selectBoardBox(this);">
						<c:if test="${camper.getMemberId()} === ${loginMember}">
							<div class="drop-down drop-down-1">
								<div class="selected text-right">
									<i class="fa-solid fa-ellipsis-vertical d-block" onclick="dropdown(this);"></i>
								</div>
								<div class="options text-right">
									<ul class="border-top border-dark">
										<li onclick="location.href='${pageContext.request.contextPath}/community/camper/camperUpdate'">수정</li>
										<li>삭제</li>
									</ul>
								</div>
							</div>
						</c:if>
						<div class="boardBoxSelectInfo">
							<div class="font-weight-bold text-20 pb-4">${camper.getTitle()}</div>
							<div class="font-weight-bold text-13">${camper.getArea()}</div>
							<fmt:parseDate value="${camper.getDepartureDate()}" pattern="yyyy-MM-dd" var="departureDate"/>
							<fmt:parseDate value="${camper.getArrivalDate()}" pattern="yyyy-MM-dd" var="arrivalDate"/>
							
							<div class="font-weight-bold text-13"><fmt:formatDate value="${departureDate}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${arrivalDate}" pattern="yyyy.MM.dd"/></div>
							<div class="py-4">
								<c:if test="${camper.getContent().length() > 110}">
									${fn:substring(camper.getContent(), 0, 110)}...
								</c:if>
								<c:if test="${camper.getContent().length() <= 110}">
									${camper.getContent()}
								</c:if>
							</div>
							<div class="font-weight-bold text-13">${camper.getStatus() eq "I" ? "모집중" : "모집완료"}</div>
							<input type="hidden" data-no="${camper.getCamperNo()}" />
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="pl-5">
				<div id="detailSection" class="boardBoxSelect p-5 mb-4 d-flex flex-column justify-content-between">
					<div id="detailHeader" class="pb-3">
						<div id="title" class="font-weight-bold text-25">${camperList[0].getTitle()}</div>
						<div id="nickname" class="font-weight-bold text-15 text-right py-3">${camperList[0].getNickname()}님</div>
						<div class="d-flex justify-content-between">
							<div>
								<div id="area" class="font-weight-bold text-13">${camperList[0].getArea()}</div>
								<fmt:parseDate value="${camperList[0].getDepartureDate()}" pattern="yyyy-MM-dd" var="departureDateDetail"/>
								<fmt:parseDate value="${camperList[0].getArrivalDate()}" pattern="yyyy-MM-dd" var="arrivalDateDetail"/>
								<div id="dates" class="font-weight-bold text-13"><fmt:formatDate value="${departureDateDetail}" pattern="yyyy.MM.dd"/> ~ <fmt:formatDate value="${arrivalDateDetail}" pattern="yyyy.MM.dd"/></div>
							</div>
							<div>
								<div id="memberCount" class="font-weight-bold text-15 text-right text-danger">${camperList[0].getMemberCount()}명</div>
								<div id="status" class="font-weight-bold text-13 text-right">${camperList[0].getStatus() eq "I" ? "모집중" : "모집완료"}</div>
							</div>
						</div>
					</div>
					<div id="detailBody">
						<div class="font-weight-bold py-2">상세내용</div>
						<div id="ctent" >${camperList[0].getContent()}</div>
						<div class="font-weight-bold py-2">모임취지</div>
						<div id="purpose" >${camperList[0].getPurpose()}</div>
						<div class="font-weight-bold py-2">예상비용</div>
						<div id="expectedCost">${camperList[0].getExpectedCost()}</div>
					</div>
					<div id="detailFooter" class="mt-4">
						<label for="basic-url" class="text-15">오픈채팅방에서 자유롭게 소통해요!</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon3">URL</span>
							</div>
						<input id="chatUrl" type="text" class="form-control bg-light" aria-describedby="basic-addon3" value="${camperList[0].getChatUrl()}" onclick="window.open('${camperList[0].getChatUrl()}')" readonly>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<script>
$(document).ready(() => {
	$(review).removeClass("active");
	$(camper).addClass("active");
	
});

const docHeight = $(document).height();
const winHeight = $(window).height();
let timer;
let cPage = 1;
$(document).scroll(function () {
	if(timer) {
		clearTimeout(timer);
	}
	timer = setTimeout(() => {
		if(document.querySelector("#listSection").getBoundingClientRect().bottom < $(window).height()) {
			$.ajax({
				url: "${pageContext.request.contextPath}/community/camper/moreCamperList",
				data: {cPage},
				success(response) {
					const {camperList} = response;
					for(let i = 0; i < camperList.length; i++) {
						const $boardBox = $('<div class="boardBox my-4 p-4" onclick="selectBoardBox(this);"></div>');
						if(${not empty loginMember}) {
							const $dropdown = $('<div class="drop-down drop-down-1"></div>');
							const $selected = $('<div class="selected text-right"></div>');
							const $icon = $('<i class="fa-solid fa-ellipsis-vertical d-block"></i>');
						} else {
							// 로그인 아이디와 동일할 시 dropdown
							const $drop = $('<div class="drop-down drop-down-1"></div>');
							const $dropDiv1 = $('<div class="selected text-right"></div>');
							const $dropI = $('<i class="fa-solid fa-ellipsis-vertical d-block" onclick="dropdown(this);"></i>');
							const $dropDiv2 = $('<div class="options text-right"></div>');
							const $dropUl = $('<ul class="border-top border-dark"></ul>');
							const $dropLi1 = $('<li>수정</li>');
							const $dropLi2 = $('<li>삭제</li>');
							$dropLi1.on("click", (li) => {
								$(li).closest('ul').hide();
								location.href = "${pageContext.request.contextPath}/community/camper/camperUpdate";
							});
							$dropLi2.on("click", (li) => $(li).closest('ul').hide());
							$dropUl.append($dropLi1, $dropLi2);
							$dropDiv2.append($dropUl);
							$dropDiv1.append($dropI);
							$drop.append($dropDiv1, $dropDiv2);
							$boardBox.append($drop);
						}
						
						const $info = $('<div class="boardBoxSelectInfo"></div>');
						const $title = $('<div class="font-weight-bold text-20 pb-4"></div>');
						$title.html(camperList[i].title);
						const $area = $('<div class="font-weight-bold text-13"></div>');
						$area.html(camperList[i].area);
						const $dates = $('<div class="font-weight-bold text-13"></div>');
						const departureDate = camperList[i].departureDate;
						const arrivalDate = camperList[i].arrivalDate;
						$dates.html(departureDate.year + "." + f(departureDate.monthValue) + "." + f(departureDate.dayOfMonth) + " ~ " + arrivalDate.year + "." + f(arrivalDate.monthValue) + "." + f(arrivalDate.dayOfMonth)); 
						const $content = $('<div class="py-4"></div>');
						camperList[i].content.length > 110 ? $content.html(camperList[i].content.substring(0, 110) + "...") : $content.html(camperList[i].content); 
						const $status = $('<div class="font-weight-bold text-13">');
						camperList[i].status === "I" ? $status.html("모집중") : $status.html("모집완료");
						const $camperNo = $('<input type="hidden"/>');
						$camperNo.data("no", camperList[i].camperNo);
						$info.append($title, $area, $dates, $content, $status, $camperNo);
						$boardBox.append($info);
						
						$("#listSection").append($boardBox);
					}
				},
				error: console.log
			});
			cPage++;
		}
	}, 500);
	
	
});

const selectBoardBox = (boardBox) => {
	$("#listSection .boardBoxSelect").removeClass("boardBoxSelect").addClass("boardBox");
	$(boardBox).removeClass("boardBox").addClass("boardBoxSelect");
	
	const $hidden = $(boardBox).find("input[type=hidden]");
	const camperNo = $hidden.data("no");
	// detailBox 비동기 요청
	$.ajax({
		url: "${pageContext.request.contextPath}/community/camper/camperDetail",
		data: {camperNo},
		success(response) {
			const {camper} = response;
			$("#title").html(camper.title);
			$("#nickname").html(camper.nickname + "님");
			$("#area").html(camper.area);
			const departureDate = camper.departureDate;
			const arrivalDate = camper.arrivalDate;
			$("#dates").html(departureDate.year + "." + f(departureDate.monthValue) + "." + f(departureDate.dayOfMonth) + " ~ " + arrivalDate.year + "." + f(arrivalDate.monthValue) + "." + f(arrivalDate.dayOfMonth));
			$("#memberCount").html(camper.memberCount + "명");
			camper.status === "I" ? $("#status").html("모집중") : $("#status").html("모집완료");
			$("#ctent").html(camper.content);
			$("#purpose").html(camper.purpose);
			$("#expectedCost").html(camper.expectedCost);
			$("#chatUrl").val(camper.chatUrl);
			$("#chatUrl").on("click", () => window.open(camper.chatUrl));
		},
		error: console.log
	});
	
}

const f = (n) => n < 10 ? "0" + n : n;

document.querySelector(".chk_box").addEventListener('change', ()=> {
	const isChecked = document.querySelector("#toggle").checked;
	if(isChecked) {
		$(".chk_box > span").removeClass("off").addClass("on");
	} else {
		$(".chk_box > span").removeClass("on").addClass("off");
	}
});

//토글 ul
const dropdown = (iTag) => {
	const $options = $(iTag).parent().siblings('.options');
    $options.find('> ul').toggle();
}

//페이지의 다른 위치를 클릭하면 옵션 숨기기
$(document).bind('click', function(e) {
    const $clicked = $(e.target);
    if (!$clicked.parents().hasClass("drop-down")){
        $(".drop-down .options ul").hide();
    }
});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />