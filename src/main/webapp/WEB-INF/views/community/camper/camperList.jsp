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
	<div class="container-md campsite-review-list-wrap pt-3">
		<jsp:include page="/WEB-INF/views/community/communityHeading.jsp"/>
			<div class="col-md float-right">
				<div class="input-group align-items-center community-search-enroll">
			    	<select id="searchType" class="selectpicker" data-style="btn-success bg-camper-color">
						<option value="" disabled selected>선택</option>
						<option value="memberId">작성자</option>
					   	<option value="title">제목</option>
					    <option value="content">내용</option>
					</select>
					<input type="text" name="searchKeyword" class="form-control community-search-input rounded" placeholder="검색어를 입력하세요." aria-label="Recipient's username" aria-describedby="communitySearchBtn">
				  	<div class="input-group-append">
				    	<button class="btn btn-outline-success rounded" type="button" id="communitySearchBtn">
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
				<div class="boardBoxSelect my-4 p-4">
					<div class="text-right">
							<i class="fa-solid fa-ellipsis-vertical"></i>
					</div>
				
				<!-- 
						<label for="dropMenu">
						</label>
						<select name="dropMenu" id="dropMenu">
							
						</select>
						<div class="dropdown d-none">
							<button class="btn btn-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-expanded="false">
							</button>
							<div class="dropdown-menu">
							<a class="dropdown-item" href="#">수정</a>
							<a class="dropdown-item" href="#">삭제</a>
							</div>
						</div>
					</div>
				 -->
					
					
					
					<div class="boardBoxSelectInfo">
						<div class="font-weight-bold text-20 pb-4">제천 캠핑장 놀러가실분들 모집합니다!</div>
						<div class="font-weight-bold text-13">충청북도 제천시</div>
						<div class="font-weight-bold text-13">2022.07.19 ~ 2022.07.20</div>
						<div class="py-4">
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한...
						</div>
						<div id="status" class="font-weight-bold text-13">모집중</div>
					</div>
				</div>
				<div class="boardBox my-4 p-4">
					<div class="boardBoxSelectInfo">
						<div class="font-weight-bold text-20 py-4">제천 캠핑장 놀러가실분들 모집합니다!</div>
						<div class="font-weight-bold text-13">충청북도 제천시</div>
						<div class="font-weight-bold text-13">2022.07.19 ~ 2022.07.20</div>
						<div class="py-4">
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한...
						</div>
						<div id="status" class="font-weight-bold text-13">모집중</div>
					</div>
				</div>
				<div class="boardBox my-4 p-4">
					<div class="boardBoxSelectInfo">
						<div class="font-weight-bold text-20 py-4">제천 캠핑장 놀러가실분들 모집합니다!</div>
						<div class="font-weight-bold text-13">충청북도 제천시</div>
						<div class="font-weight-bold text-13">2022.07.19 ~ 2022.07.20</div>
						<div class="py-4">
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한...
						</div>
						<div id="status" class="font-weight-bold text-13">모집중</div>
					</div>
				</div>
				<div class="boardBox my-4 p-4">
					<div class="boardBoxSelectInfo">
						<div class="font-weight-bold text-20 py-4">제천 캠핑장 놀러가실분들 모집합니다!</div>
						<div class="font-weight-bold text-13">충청북도 제천시</div>
						<div class="font-weight-bold text-13">2022.07.19 ~ 2022.07.20</div>
						<div class="py-4">
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한하게 연락주세요.
							캠핑초보도 좋습니다. 같이 캠핑하고 싶은 분들 편한...
						</div>
						<div id="status" class="font-weight-bold text-13">모집중</div>
					</div>
				</div>
			</div>
			<div class="pl-5">
				<div id="detailSection" class="boardBoxSelect p-5">
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
document.querySelector(".chk_box").addEventListener('change', ()=> {
	const isChecked = document.querySelector("#toggle").checked;
	if(isChecked) {
		$(".chk_box > span").removeClass("off").addClass("on");
	} else {
		$(".chk_box > span").removeClass("on").addClass("off");
	}
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />