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
					<div class="${vs.first ? "boardBoxSelect" : "boardBox"} my-4 p-4">
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
								${fn:substring(camper.getContent(), 0, 110)}...
							</div>
							<div id="status" class="font-weight-bold text-13">${camper.getStatus() eq "I" ? "모집중" : "모집완료"}</div>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="pl-5">
				<div id="detailSection" class="boardBoxSelect p-5 mb-4 d-flex flex-column justify-content-between">
					<div id="detailHeader" class="pb-3">
						<div id="title" class="font-weight-bold text-25">제천 캠핑장 놀러가실분들 모집합니다!</div>
						<div id="name" class="font-weight-bold text-15 text-right py-3">최강길동님</div>
						<div class="d-flex justify-content-between">
							<div>
								<div id="area" class="font-weight-bold text-13">충청북도 제천시</div>
								<div id="dates" class="font-weight-bold text-13">2022.07.19 ~ 2022.07.20</div>
							</div>
							<div>
								<div id="memberCount" class="font-weight-bold text-15 text-right text-danger">4명</div>
								<div id="status" class="font-weight-bold text-13 text-right">모집중</div>
							</div>
						</div>
					</div>
					<div id="detailBody">
						<div class="font-weight-bold py-2">상세내용</div>
						<div>
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
						</div>
						<div class="font-weight-bold py-2">이용수칙</div>
						<div>
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
						</div>
						<div class="font-weight-bold py-2">예상비용</div>
						<div>
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
						</div>
					</div>
					<div id="detailFooter" class="mt-4">
						<label for="basic-url" class="text-15">오픈채팅방에서 자유롭게 소통해요!</label>
						<div class="input-group mb-3">
							<div class="input-group-prepend">
								<span class="input-group-text" id="basic-addon3">URL</span>
							</div>
						<input id="openURL" type="text" class="form-control bg-light" id="basic-url" aria-describedby="basic-addon3" value="https://kakaotalk.openchat/asdlqwoas/qwer" readonly>
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
					console.log(camperList);
					
					for(let i = 0; i < camperList.length; i++) {
						const $boardBox = $('<div class="boardBox my-4 p-4">');
						console.log(camperList[i].memberId);
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
							const $dropLi1 = $('<li onclick="location.href="${pageContext.request.contextPath}/community/camper/camperUpdate">수정</li>');
							const $dropLi2 = $('<li>삭제</li>');
							
							$dropUl.append($dropLi1, $dropLi2);
							$dropDiv2.append($dropUl);
							$dropDiv1.append($dropI);
							$drop.append($dropDiv1, $dropDiv2);
							$boardBox.append($drop);
							$("#listSection").append($boardBox);
						}
					}
					/* 
					<div class="boardBox boardBoxSelect my-4 p-4">
						<c:if test="${camper.getMemberId()} === ${loginMember}">
							<div class="drop-down drop-down-1">
								<div class="selected text-right">
									<i class="fa-solid fa-ellipsis-vertical d-block"></i>
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
								${fn:substring(camper.getContent(), 0, 110)}...
							</div>
							<div id="status" class="font-weight-bold text-13">${camper.getStatus() eq "I" ? "모집중" : "모집완료"}</div>
						</div>
					</div>
					*/
					
					
				},
				error: console.log
			});
			cPage++;
		}
	}, 500);
	
	
	/* const listSec = document.querySelector("#listSection");
	const listSecAbsolute = window.pageYOffset + listSec.getBoundingClientRect().bottom;
	
	console.log(listSec.getBoundingClientRect().bottom);
	console.log("list 위치 = ", listSecAbsolute);
	console.log("scorll 위치1 = ", window.pageYOffset);
	console.log("scorll 위치2 = ", $(document).scrollTop()); */
	
	
	
});
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
/* $(".drop-down .selected i").click(function() {
    //$(".drop-down .options ul").toggle();
    const $options = $(this).parent().siblings('.options');
    $options.find('> ul').toggle();
}); */

//옵션 선택 및 선택 후 옵션 숨기기
const close = (liTag) => {
    $(liTag).closest('ul').hide();
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