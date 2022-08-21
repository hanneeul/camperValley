<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!-- chartJs -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/admin/admin.css" />
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

<div class="container" style="display: flex;" id="admin-container">
	<jsp:include page="/WEB-INF/views/common/adminSidebar.jsp" />
	<div class="admin-content" style="width: 80%;">
		<h5 class="admin-hd">관리자 대시보드</h5>

		<div class="camper-hd" style="margin-top: 40px;">


			<div class="container" style="color: #777;">
				<div class="row">
					<div class="col-md-6 se-box">
						<h2 class="a-title">신규 회원 추이</h2>
						<div>
							<canvas id="member-graph"></canvas>
						</div>

					</div>
					<div class="col-md-5 se-box">
						<h2 class="a-title">1주간 게시판별 글 등록 수</h2>
						<div>
							<canvas id="board-graph" width="360" height="200"></canvas>
						</div>
					</div>

					<div class="col-md-6">
						<div class="row">
							<div class="col-md-12 se-box">
								<h2 class="a-title">광고 등록 현황</h2>
								<div>
									<canvas id="money-graph"></canvas>
								</div>
							</div>
							<div class="col-md-12 se-box">
								<h2 class="a-title">To Do List</h2>
								<div class="to-do">

									<table class="table tb-todo" style="color: #777;">

										<tr>
											<th><input type="checkbox" name="" id=""></th>
											<td>Lorem ipsum dolor sit amet consectetur</td>
											<td><button class="x-icon">
													<i class="fa-solid fa-xmark"></i>
												</button></td>
										</tr>

										<tr>
											<th><input type="checkbox" name="" id=""></th>
											<td>Lorem ipsum dolor sit amet consectetur</td>
											<td><button class="x-icon">
													<i class="fa-solid fa-xmark"></i>
												</button></td>
										</tr>
										<tr>
											<th><input type="checkbox" name="" id=""></th>
											<td>Lorem ipsum dolor sit amet consectetur</td>
											<td><button class="x-icon">
													<i class="fa-solid fa-xmark"></i>
												</button></td>
										</tr>
										<tr>
											<th><input type="checkbox" name="" id=""></th>
											<td>Lorem ipsum dolor sit amet consectetur</td>
											<td><button class="x-icon">
													<i class="fa-solid fa-xmark"></i>
												</button></td>
										</tr>
										<tr>
											<th><input type="checkbox" name="" id=""></th>
											<td>Lorem ipsum dolor sit amet consectetur</td>
											<td><button class="x-icon">
													<i class="fa-solid fa-xmark"></i>
												</button></td>
										</tr>

									</table>
								</div>
							</div>
						</div>
					</div>
					<div class="col-md-5 se-box" style="margin-left: 30px;">
						<h2 class="a-title">관리자 최근 작성글</h2>
						<div class="write-div">
							<ul class="write-ul">
											<c:forEach items="${list}" var="list" varStatus="vs">
							
								<li>
									<h2 class="sub-title">
										<span class="timeline"></span>
							<c:if test="${list.category eq 'NOTICE'}">
										<a href="${pageContext.request.contextPath}/cs/noticeDetail?noticeNo=${list.noticeNo}">${list.title}</a>
							</c:if>
							<c:if test="${list.category eq 'FAQ'}">
										<a href="${pageContext.request.contextPath}/cs/faq">${list.title}</a>
							</c:if>
									</h2>
									<p class="write-content">${list.content}</p>
								</li>
								</c:forEach>
								<!-- <li>
									<h2 class="sub-title">
										<span class="timeline"></span><a href="#">Lorem ipsum
											dolor sit amet consectetur</a>
									</h2>
									<p class="write-content">Loriores quae explicabo fugiat earum
										totam.</p>
								</li>
								<li>
									<h2 class="sub-title">
										<span class="timeline"></span><a href="#">Lorem ipsum
											dolor sit amet consectetur</a>
									</h2>
									<p class="write-content">Lorem ipsum dolor sit amet
										consectetur, adipisicing elit. Adipisci repellendus impedit
										natus aliquid voluptate dolore aspernatur eos, aut velit, iure
										saepe. Alias quam eos, asperiores quae explicabo fugiat earum
										totam.</p>
								</li> -->

							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<script>

var now = new Date();
var sysdate = now.getDate();
var minus1 = now.getDate() -1;
var minus2 = now.getDate() -2;
var minus3 = now.getDate() -3;
var minus4 = now.getDate() -4;
var minus5 = now.getDate() -5;
var minus6 = now.getDate() -6;

var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
	  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
	];

var m = new Date();

var context = document.getElementById('member-graph').getContext('2d');
var memberGraph = new Chart(context, {
	type : 'bar', 
	data : { 
		labels : [
		month[m.getMonth()] +' '+ minus6, month[m.getMonth()] +' '+ minus5, month[m.getMonth()] +' '+ minus4, month[m.getMonth()] +' '+ minus3, month[m.getMonth()] +' '+ minus2, month[m.getMonth()] +' '+ minus1, month[m.getMonth()] +' ' + sysdate],
		datasets : [ { 
			label : '회원가입 수', 
			fill : false, 
			data : [ ${minus6}, ${minus5}, ${minus4}, ${minus3}, ${minus2}, ${minus1}, ${sysdate} 
			],
			backgroundColor : [
			"#209e91", "#0e8174", "#639A67", "#005562", "#9DC183",
					"#4B5320", "#8A9A5B" ],
			borderColor : [
			"#209e91", "#0e8174", "#639A67", "#005562", "#9DC183",
					"#4B5320", "#8A9A5B" ],
			borderWidth : 1
		} ]
	},
	options : {
		legend : {
			display : false
		},
		scales : {
			yAxes : [ {
				ticks : {
					beginAtZero : true
				}
			} ]
		}
	}
});

// 애드머니 결제 현황
var context = document.getElementById('money-graph').getContext('2d');
var moneyGraph = new Chart(context, {
	type : 'line', 
	data : { 
		labels : [
		'1', '2', '3', '4', '5', '6', '7' ],
		datasets : [ { 
			label : '회원가입 수',
			fill : true, 
			data : [ 21, 19, 25, 20, 23, 26, 25 
			],
			backgroundColor : [
			'rgba(32, 158, 145, 0.5);', 'rgba(54, 162, 235, 0.2)' ],
			borderColor : [
			'rgba(32, 158, 145, 0.5);' ],
			borderWidth : 1
		} ]
	},
	events: ['mousemove', 'mouseout', 'click', 'touchstart', 'touchmove'],
	options : {
		legend : {
			display : false
		},
		scales : {
			yAxes : [ {
				ticks : {
					beginAtZero : true
				}
			} ]
		}
	}
});

// 등록글 수
var context = document.getElementById('board-graph').getContext('2d');
var boardGraph = new Chart(context,
		{
			type : 'doughnut',
			data : {
				labels : [ "캠퍼모집", "캠핑장 후기", "캠핑용품거래" ],
				datasets : [ {
					labels : [ "캠퍼모집", "캠핑장 후기", "캠핑용품거래" ],
					fill : true,
					data : [${camper}, ${review}, ${product}],
					backgroundColor : [ "#005562", "#0e8174", "#b9f2a1"],
					borderColor : [ "#005562", "#0e8174", "#b9f2a1"],
					borderWidth : 1
				} ]
			},
			options : {
				legend : {
					display : true,
					position : "right"
				},

				responsive : false,

			},

		});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>