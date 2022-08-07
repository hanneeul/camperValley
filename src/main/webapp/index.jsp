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
	<form name="searchFrm" class="shadow-custom width-1000 mx-auto p-4 bg-white d-flex justify-content-between">
		<div id="inputArea">
			<div class="py-2 camper-color text-18">지역</div>
			<input class="input p-2 mr-2 mb-3" type="text" placeholder="시/도"/>
			<input class="input p-2 mr-2 mb-3" type="text" placeholder="시/군/구"/>
		</div>
		<div id="inputTema">
			<div class="py-2 camper-color text-18">테마</div>
			<input class="input p-2 mb-3" type="text" placeholder="관련 테마를 입력해주세요."/>
		</div>
		<div id="inputKeyword">
			<div class="py-2 camper-color text-18">키워드</div>
			<input class="input p-2 mb-3" type="text" placeholder="관련 키워드를 입력해주세요."/>
		</div>
		<div class="d-flex flex-column justify-content-center">
			<div id="searchCampSite" class="font-weight-bold p-2 camper-color text-35">&gt;</div>
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
	            <div class="dates text-15 mt-3"></div>
	        </div>
    	</div>
		<div id="areaWeatherBox" class="my-2 d-flex flex-column justify-content-between pr-5">
			<div id="selectArea">
				<div class="text-18 font-weight-bold pb-2">지역</div>
				<div class="d-flex justify-content-between">
					<input class="input p-2" type="text" placeholder="시/도"/>
					<input class="input p-2" type="text" placeholder="시/군/구"/>
				</div>
			</div>
			<div id="selectWeather">
				<div class="text-18 font-weight-bold pb-4">그날의 날씨는?</div>
				<div class="d-flex justify-content-between mb-2">
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
				</div>
			</div>
		</div>
	</form>
	<!-- 광고 -->
	<div id="carouselExampleIndicators" class="carousel slide mx-auto" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
		</ol>
		<div class="carousel-inner">
    		<div class="carousel-item active bg-secondary">
				<%-- <img class="d-block w-100" src="${pageContext.request.contextPath}/resources/images/index/gray.png" alt="First slide"> --%>
			</div>
			<div class="carousel-item bg-secondary">
			</div>
    		<div class="carousel-item bg-secondary">
			</div>
		</div>
		<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="sr-only">Previous</span>
		</a>
		<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="sr-only">Next</span>
		</a>
	</div>
	
	<div id="campsiteGubun" class="width-1000 mx-auto">
		<div class="font-weight-bold text-22">Favorite Camping</div>
		<div class="d-flex justify-content-between">
			<div>
				<div class="text-22">Glamping</div>
				<div id="glamping" class="shadow-custom" style="background-image: url('${pageContext.request.contextPath}/resources/images/index/glamping.jpg')">
				</div>
			</div>
			<div>
				<div class="text-22">Caravan</div>
				<div id="caravan" class="shadow-custom" style="background-image: url('${pageContext.request.contextPath}/resources/images/index/caravan.jpg')">
				</div>
			</div>
		</div>
	</div>
	<script>
	let date = new Date();
    const renderCalendar = () => {
	    const viewYear = date.getFullYear(); // 년도
	    const viewMonth = date.getMonth();  // 월
	    $(year).html(`\${viewYear}`);
	    $(month).html(`\${viewMonth + 1}`);
	    
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
	        
	        
	    if(viewYear < today.getFullYear() || (viewYear === today.getFullYear() && viewMonth < today.getMonth())) {
	        dates.forEach((date, i) => {
	            dates[i] = `<div class="date"><div class='other'>\${date}</div></div>`;
	        });
	    } else if(viewYear === today.getFullYear() && viewMonth === today.getMonth()) {
        	if(firstDateIndex === lastDateIndex) {
		        dates.forEach((date, i) => {
		        	const condition = i >= dates.indexOf(today.getDate()) ? 'this' : 'other';
			        dates[i] = `<div class="date"><div class=\${condition}>\${date}</div></div>`;
		        });
	        } else {
		        dates.forEach((date, i) => {
		        	const condition = i >= dates.indexOf(today.getDate()) && i < lastDateIndex ? 'this' : 'other';
		            dates[i] = `<div class="date"><div class=\${condition}>\${date}</div></div>`;
	        	});
	        }
	    } else {
        	if(firstDateIndex === lastDateIndex) {
		        dates.forEach((date, i) => {
	        		const condition = i >= firstDateIndex ? 'this' : 'other';
		            dates[i] = `<div class="date"><div class=\${condition}>\${date}</div></div>`;
	        	});
        	} else {
		        dates.forEach((date, i) => {
	        		const condition = i >= firstDateIndex && i < lastDateIndex ? 'this' : 'other';
		            dates[i] = `<div class="date"><div class=\${condition}>\${date}</div></div>`;
	        	});
        	}
	    }
	   	document.querySelector(".dates").innerHTML = dates.join("");
    }
    renderCalendar();

    const prevMonth = () => {
        date.setMonth(date.getMonth() - 1);
        renderCalendar();
    }

    const nextMonth = () => {
        date.setMonth(date.getMonth() + 1);
        renderCalendar();
    }
	</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>