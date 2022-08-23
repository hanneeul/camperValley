<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"/>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/index/index.css"/>
	<!-- 검색 -->
	<div id="searchWeatherBox" style="background-image:url('${pageContext.request.contextPath}/resources/images/index/top.jpg')">
		<form id="searchFrmTop" name="searchFrmTop" action="${pageContext.request.contextPath}/campsite/searchCampsiteIndex" class="shadow-custom width-1000 mx-auto p-4 bg-white d-flex justify-content-between">
			<div id="inputArea">
				<div class="py-2 camper-color text-18">지역</div>
				<select name="sido" id="sido1" class="input p-2 mr-2 mb-3"></select>
				<select name="gugun" id="gugun1" class="input p-2 mr-2 mb-3"></select>
			</div>
			<div id="inputTheme">
				<div class="py-2 camper-color text-18">테마</div>
				<select name="themaEnvrnCl" class="input p-2 mb-3">
					<option value="">관련 테마를 선택하세요.</option>
					<option value="일출명소">일출명소</option>
					<option value="일몰명소">일몰명소</option>
					<option value="수상레저">수상레저</option>
					<option value="항공레저">항공레저</option>
					<option value="스키">스키</option>
					<option value="낚시">낚시</option>
					<option value="액티비티">액티비티</option>
					<option value="봄꽃여행">봄꽃여행</option>
					<option value="여름물놀이">여름물놀이</option>
					<option value="가을단풍명소">가을단풍명소</option>
					<option value="겨울눈꽃명소">겨울눈꽃명소</option>
					<option value="걷기길">걷기길</option>
				</select>
			</div>
			<div id="inputFacltNm">
				<div class="py-2 camper-color text-18">캠핑장명</div>
				<input name="facltNm" class="input p-2 mb-3" type="text" placeholder="캠핑장명을 입력해주세요."/>
			</div>
			<div class="d-flex flex-column justify-content-center">
				<div id="searchCampsite" class="font-weight-bold p-2 camper-color text-35">&gt;</div>
			</div>
		</form>
		
		<!-- 날씨 -->
		<form name="weatherFrm" class="shadow-custom width-1000 mx-auto p-4 bg-white d-flex justify-content-between">
			<div id="selectCalendar" class="mt-2">
		        <div class="calendarHeader d-flex justify-content-center">
		        	<div class="nav-btn font-weight-bold text-18 pr-3" onclick="prevMonth();">&lt;</div>
		            <div class="font-weight-bold text-18">
		            	<span id="year"></span>년 <span id="month"></span>월
		            </div>
		            <div class="nav-btn font-weight-bold text-18 pl-3" onclick="nextMonth();">&gt;</div>
		        </div>
		        <div class="m-4">
		            <div class="days text-15 my-2">
		                <div class="day">일</div>
		                <div class="day">월</div>
		                <div class="day">화</div>
		                <div class="day">수</div>
		                <div class="day">목</div>
		                <div class="day">금</div>
		                <div class="day">토</div>
		            </div>
		            <div class="dates text-15 mt-1"></div>
		        </div>
	    	</div>
			<div id="areaWeatherBox" class="my-2 d-flex flex-column justify-content-start pr-5">
				<div id="selectArea">
					<div class="text-18 font-weight-bold pb-1 mb-3">지역</div>
					<div class="d-flex justify-content-between">
						<select name="sido" id="sido2" class="input p-2 mr-2 mb-3"></select>
						<select name="gugun" id="gugun2" class="input p-2 mr-2 mb-3"></select>
					</div>
				</div>
				<div id="selectWeather">
					<div id="weather-btn" class="text-18 font-weight-bold py-4 mt-5">그날의 날씨는 ?</div>
					<!-- <div class="d-flex justify-content-between mb-2">
						<div>
							<div class="text-center">
								<div>금</div>
								<i class="fa-solid fa-bolt-lightning fa-lg"></i>
							</div>
						</div>
						<div>
							<div class="text-center">
								<div>토</div>
								<i class="fa-solid fa-bolt-lightning fa-lg"></i>
							</div>
						</div>
						<div>
							<div class="text-center">
								<div>일</div>
								<i class="fa-solid fa-cloud fa-lg"></i>
							</div>
						</div>
						<div>
							<div class="text-center">
								<div class="rounded-circle bg-camper-color text-light">월</div>
								<i class="fa-solid fa-cloud-sun fa-lg"></i>
							</div>
						</div>
						<div>
							<div class="text-center">
								<div>화</div>
								<i class="fa-solid fa-cloud-rain fa-lg"></i>
							</div>
						</div>
						<div>
							<div class="text-center">
								<div>수</div>
								<i class="fa-solid fa-wind fa-lg"></i>
							</div>
						</div>
						<div>
							<div class="text-center">
								<div>목</div>
								<i class="fa-solid fa-cloud fa-lg"></i>
							</div>
						</div>
					</div> -->
				</div>
			</div>
		</form>
	</div>
	<!-- 광고 -->
	<%-- EJ start --%>
	<c:if test="${not empty adList}">
		<div id="carouselExampleIndicators" class="carousel slide mx-auto" data-ride="carousel">
			<ol class="carousel-indicators">
				<c:forEach items="${adList}" var="advertisement" varStatus="vs">
					<li data-target="#carouselExampleIndicators" data-slide-to="${vs.count - 1}" ${vs.count eq 1 ? 'active' : ''}></li>
				</c:forEach>
			</ol>
			<div class="carousel-inner">
				<c:forEach items="${adList}" var="advertisement" varStatus="vs">
		    		<div class="carousel-item ${vs.count eq 1 ? 'active' : ''}"
		    			data-advertisement-no="${advertisement.advertisementNo}"
		    			onclick="clickUpAndMove(${advertisement.advertisementNo}, '${advertisement.adLink}');">
		    			<img src="${pageContext.request.contextPath}/resources/upload/mypage/advertiser/advertisement/${advertisement.adAttach.renamedFilename}"
		    				alt="메인홈 광고이미지${vs.count}" style="cursor: pointer;"/>
					</div>
				</c:forEach>
			</div>
			<c:if test="${fn:length(adList) > 1}">
				<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</c:if>
		</div>
	</c:if>
	<%-- EJ end --%>
	<form id="searchFrmBottom" name="searchFrmBottom" action="${pageContext.request.contextPath}/campsite/searchCampsiteIndex">
		<div id="gubunBox" style="background-image:url('${pageContext.request.contextPath}/resources/images/index/bottom.jpg')">
			<div id="campsiteGubun" class="width-1000 mx-auto">
				<div class="font-weight-bold text-22">Favorite Camping</div>
				<div class="d-flex justify-content-between">
					<div>
						<div class="text-22">Glamping</div>
						<div id="glamping" class="campsite shadow-custom" style="background-image: url('${pageContext.request.contextPath}/resources/images/index/glamping.jpg')">
						</div>
					</div>
					<div>
						<div class="text-22">Caravan</div>
						<div id="caravan" class="campsite shadow-custom" style="background-image: url('${pageContext.request.contextPath}/resources/images/index/caravan.jpg')">
						</div>
					</div>
				</div>
			</div>
		</div>
		<input type="hidden" name="induty" />
	</form>
<script>
// ----- 캠핑장검색 -----
$('document').ready(function() {
	const area0  = ["시/도","서울특별시","인천광역시","대전광역시","광주광역시","대구광역시","울산광역시","부산광역시","경기도","강원도","충청북도","충청남도","전라북도","전라남도","경상북도","경상남도","제주도"];
	const area1  = ["강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구"];
	const area2  = ["계양구","남구","남동구","동구","부평구","서구","연수구","중구","강화군","옹진군"];
	const area3  = ["대덕구","동구","서구","유성구","중구"];
	const area4  = ["광산구","남구","동구",     "북구","서구"];
	const area5  = ["남구","달서구","동구","북구","서구","수성구","중구","달성군"];
	const area6  = ["남구","동구","북구","중구","울주군"];
	const area7  = ["강서구","금정구","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구","기장군"];
	const area8  = ["고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시","가평군","양평군","여주군","연천군"];
	const area9  = ["강릉시","동해시","삼척시","속초시","원주시","춘천시","태백시","고성군","양구군","양양군","영월군","인제군","정선군","철원군","평창군","홍천군","화천군","횡성군"];
	const area10 = ["제천시","청주시","충주시","괴산군","단양군","보은군","영동군","옥천군","음성군","증평군","진천군","청원군"];
	const area11 = ["계룡시","공주시","논산시","보령시","서산시","아산시","천안시","금산군","당진군","부여군","서천군","연기군","예산군","청양군","태안군","홍성군"];
	const area12 = ["군산시","김제시","남원시","익산시","전주시","정읍시","고창군","무주군","부안군","순창군","완주군","임실군","장수군","진안군"];
	const area13 = ["광양시","나주시","목포시","순천시","여수시","강진군","고흥군","곡성군","구례군","담양군","무안군","보성군","신안군","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군"];
	const area14 = ["경산시","경주시","구미시","김천시","문경시","상주시","안동시","영주시","영천시","포항시","고령군","군위군","봉화군","성주군","영덕군","영양군","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군"];
	const area15 = ["거제시","김해시","마산시","밀양시","사천시","양산시","진주시","진해시","창원시","통영시","거창군","고성군","남해군","산청군","의령군","창녕군","하동군","함안군","함양군","합천군"];
	const area16 = ["서귀포시","제주시","남제주군","북제주군"];

	// 시/도 선택 박스 초기화
	$("select[name^=sido]").each(function() {
		$selsido = $(this);
		$.each(eval(area0), function() {
			$selsido.append("<option value='"+this+"'>"+this+"</option>");
		});
		$selsido.next().append("<option value=''>시/군/구</option>");
	});
	// 시/도 선택시 구/군 설정
	$("select[name^=sido]").change(function() {
		const area = "area"+$("option",$(this)).index($("option:selected",$(this))); // 선택지역의 구군 Array
		const $gugun = $(this).next(); // 선택영역 군구 객체
		$("option",$gugun).remove(); // 구군 초기화
	
		if(area == "area0")
			$gugun.append("<option value=''>시/군/구</option>");
		else {
			$.each(eval(area), function() {
				$gugun.append("<option value='"+this+"'>"+this+"</option>");
			});
		}
	});
});

document.querySelector("#searchFrmTop #searchCampsite").addEventListener("click", (e) => {
	const frm = document.searchFrmTop;
	if(frm.sido.value == "시/도" && frm.themaEnvrnCl.value == "" && frm.facltNm.value == "") {
		$.alert({
			icon: 'fa fa-warning',
		    title: '',
		    content: '검색조건을 입력하세요.',
		    buttons: {
		    	'확인': function() {}
		    }
		});
		e.preventDefault();
		return;
	}
	frm.submit();
});


// ----- 날씨조회 -----
let date = new Date();
let selectDate = new Date();

const renderCalendar = () => {
    const viewYear = date.getFullYear(); // 년도
    const viewMonth = date.getMonth();  // 월
    $("#year").html(`\${viewYear}`);
    $("#month").html(`\${viewMonth + 1}`);
    
    const prevLast = new Date(viewYear, viewMonth, 0);
    const thisLast = new Date(viewYear, viewMonth + 1, 0);
    const PLDate = prevLast.getDate();  // 저번달 마지막 날짜
    const PLDay = prevLast.getDay();    // 저번달 마지막 요일
    const TLDate = thisLast.getDate();  // 이번달 마지막 날짜
    const TLDay = thisLast.getDay();    // 이번달 마지막 요일

    const prevDates = [];
    const thisDates = [...Array(TLDate + 1).keys()].slice(1); // 1 ~ 31
    const nextDates = [];
    
    // 이번달에 포함되는 저번달 마지막 주와 다음달 첫째 주
    if(PLDay !== 6) {
        for(let i = 0; i < PLDay + 1; i++) {
            prevDates.unshift(PLDate - i);
        }
    }
    for(let i = 1; i < 7 - TLDay; i++) {
        nextDates.push(i);
    }
    const dates = prevDates.concat(thisDates, nextDates);
    
    const today = new Date ();
    const firstDateIndex = dates.indexOf(1);
    const lastDateIndex = dates.lastIndexOf(1);
       
   	// 저번달까지
    if(viewYear < today.getFullYear() || (viewYear === today.getFullYear() && viewMonth < today.getMonth())) {
        dates.forEach((date, i) => {
            dates[i] = `<div class="date"><div class='other'>\${date}</div></div>`;
        });
    } 
   	// 이번달
    else if(viewYear === today.getFullYear() && viewMonth === today.getMonth()) {
    	// 다음달 날짜 포함 x
       	if(firstDateIndex === lastDateIndex) {
	        dates.forEach((date, i) => {
	        	if(i >= dates.indexOf(today.getDate())) dates[i] = `<div class="date"><div class='this' onclick='changeSelectDate(this);'>\${date}</div></div>`;
	        	else dates[i] = `<div class="date"><div class='other'>\${date}</div></div>`;
	        });
        } 
    	// 다음달 날짜 포함 o
       	else {
	        dates.forEach((date, i) => {
	        	if(i >= dates.indexOf(today.getDate()) && i < lastDateIndex) dates[i] = `<div class="date"><div class='this' onclick='changeSelectDate(this);'>\${date}</div></div>`;
	        	else dates[i] = `<div class="date"><div class='other'>\${date}</div></div>`;
        	});
        }
    } 
   // 다음달부터
    else {
    	// 다음달 날짜 포함 x
       	if(firstDateIndex === lastDateIndex) {
	        dates.forEach((date, i) => {
	        	if(i >= firstDateIndex) dates[i] = `<div class="date"><div class='this' onclick='changeSelectDate(this);'>\${date}</div></div>`;
	        	else dates[i] = `<div class="date"><div class='other'>\${date}</div></div>`;
        	});
       	} 
    	// 다음달 날짜 포함 o
       	else {
	        dates.forEach((date, i) => {
	        	if(i >= firstDateIndex && i < lastDateIndex) dates[i] = `<div class="date"><div class='this' onclick='changeSelectDate(this);'>\${date}</div></div>`;
	        	else dates[i] = `<div class="date"><div class='other'>\${date}</div></div>`;
        	});
       	}
    }
   	document.querySelector(".dates").innerHTML = dates.join("");
   	
   };
   
const renderSelectDate = () => {
   	const year = selectDate.getFullYear();
   	const month = selectDate.getMonth();
   	const date = selectDate.getDate();
   	
   	if(parseInt($("#year").html()) === year && ($("#month").html() - 1) === month) {
   		document.querySelectorAll(".this").forEach((dateTag) => {
   			if(parseInt($(dateTag).html()) === date) {
   				$(dateTag).addClass("text-light bg-camper-color");
   			}
   		});
   }
};
   
renderCalendar();
renderSelectDate();
$("#weather-btn span").mouseover((e) => {
   
});

const prevMonth = () => {
    date.setMonth(date.getMonth() - 1);
    renderCalendar();
    renderSelectDate();
}
const nextMonth = () => {
    date.setMonth(date.getMonth() + 1);
    renderCalendar();
    renderSelectDate();
}
// 클릭시
const changeSelectDate = (e) => {
	$(".this").removeClass("text-light bg-camper-color");
	selectDate.setFullYear(parseInt($("#year").html()));
	selectDate.setMonth(parseInt($("#month").html() - 1));
	selectDate.setDate(parseInt($(e).html()));
	renderSelectDate();
}

// gubun section opacity 조절
$(".campsite").mouseover((bg) => {
	$(bg.target).animate({opacity:1}, 500);
});
$(".campsite").mouseout((bg) => {
	$(bg.target).animate({opacity:0.7}, 500);
});

// calendar 날짜 선택시 날씨 조회 비동기 요청
document.querySelectorAll("#selectCalendar .this").forEach((date) => {
	date.addEventListener("click", (e) => {
		getWeather();
	});
});

const getWeather = () => {
	if(!$("#areaWeatherBox #sido2").val() || !$("#areaWeatherBox #gugun2").val()) {
		$.ajax({
			url: "https://api.openweathermap.org/data/2.5/weather?lat=35&lon=139&appid=258c117568975d31910fb88d82e33c36",
			dataType: "json",
			success(response) {
				const $totalWeatherBox = $('<div class="d-flex justify-content-between mb-2">');
				const $weatherBox = $('<div></div>');
				console.log(response);
				/* 
				<div class="d-flex justify-content-between mb-2">
					<div>
						<div class="text-center">
							<div>금</div>
							<i class="fa-solid fa-bolt-lightning fa-lg"></i>
						</div>
					</div>
				*/
			},
			error: console.log
		});
	}
}

$("#searchFrmBottom #glamping").on("click", () => {
	const frm = document.searchFrmBottom;
	frm.induty.value = "글램핑";
	frm.submit();
});
$("#searchFrmBottom #caravan").on("click", () => {
	const frm = document.searchFrmBottom;
	frm.induty.value = "카라반";
	frm.submit();
});


</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>
<%-- EJ start --%>
<c:if test="${not empty adList}">
<script>
window.addEventListener('load', (e) => {
	// 첫번째 광고 조회수 증가처리
	viewUpFirstAd();
});
const viewUpFirstAd = () => {
	const active = document.querySelector(".carousel-inner .active");
	const advertisementNo = active.dataset.advertisementNo;
	viewUpAd(advertisementNo);
};
// 조회수 증가
const viewUpAd = (advertisementNo) => {
	$.ajax({
		url: "${pageContext.request.contextPath}/mypage/advertiser/viewUp",
		type: "POST",
		headers: {
			"${_csrf.headerName}" : "${_csrf.token}"
		},
		data: {
			advertisementNo
		},
		error: console.log
	});
};
// 슬라이드 시 조회수증가 function 실행
$('#carouselExampleIndicators').on('slid.bs.carousel', function () {
	const active = document.querySelector(".carousel-inner .active");
	const advertisementNo = active.dataset.advertisementNo;
	viewUpAd(advertisementNo);
});
// 클릭수 증가 -> 광고 링크 이동
const clickUpAndMove = (advertisementNo, adLink) => {
	console.log(advertisementNo);
	console.log(adLink);
	
	$.ajax({
		url: "${pageContext.request.contextPath}/mypage/advertiser/clickUp",
		type: "POST",
		headers: {
			"${_csrf.headerName}" : "${_csrf.token}"
		},
		data: {
			advertisementNo
		},
		success(response) {
			location.href = adLink;
		},
		error: console.log
	});
};
</script>
</c:if>
<%-- EJ end --%>