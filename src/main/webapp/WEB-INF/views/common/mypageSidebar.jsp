<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<style>
ul.sideNav .sideNavMenu a:hover, .nowSideMenu {
    color: #639a67;
}
.sideNavMenu a, .navGroup a {
	color: #000;
	text-decoration: none;
}
.navGroup a {
	font-weight: bolder;
}
</style>
	
<h4 class="px-3">마이페이지</h4>
<ul class="sideNav navbar-nav mt-3 px-3">
    <li class="nav-item navGroup">
    	<a class="nav-link" href="">회원관리</a>
    </li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="">회원정보관리</a>
    </li>
    <li class="nav-item navGroup">
    	<a class="nav-link" href="">중고거래</a>
   	</li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="">구매내역</a>
    </li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="">판매내역</a>
    </li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="">관심상품</a>
    </li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="">나의채팅방</a>
    </li>
    <li class="nav-item navGroup">
    	<a class="nav-link" href="">커뮤니티</a>
    </li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="">캠퍼모집</a>
    </li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="">작성후기</a>
    </li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="">관심캠핑장</a>
    </li>
    <li class="nav-item navGroup">
    	<a class="nav-link" href="">광고주</a>
    </li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="${pageContext.request.contextPath}/mypage/advertiser/register">광고주등록</a>
    </li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="${pageContext.request.contextPath}/mypage/advertiser/exit">광고주해제</a>
    </li>
    <li class="nav-item sideNavMenu">
    	<a class="nav-link" href="${pageContext.request.contextPath}/mypage/advertiser/dashboard">광고관리</a>
    </li>
</ul>


