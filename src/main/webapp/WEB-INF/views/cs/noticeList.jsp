<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<jsp:include page="/WEB-INF/views/common/header.jsp"></jsp:include>

	<h1>테스트</h1>
<div class="menu-test">
            <h4>메뉴 타입별 조회(GET)</h4>
            <select class="form-control" id="typeSelector">
	            <option value="" disabled selected>음식타입선택</option>
	            <option value="kr">한식</option>
	            <option value="ch">중식</option>
	            <option value="jp">일식</option>
            </select>
        </div>
        	<div class="menu-test">
			<h4>메뉴 맛별 조회(GET)</h4>
			<div class="form-check form-check-inline">
				<input type="radio" class="form-check-input" name="taste" id="get-hot" value="hot">
				<label for="get-hot" class="form-check-label">매운맛</label>&nbsp;
				<input type="radio" class="form-check-input" name="taste" id="get-mild" value="mild">
				<label for="get-mild" class="form-check-label">순한맛</label>
			</div>
		</div> 
		<input type="submit" class="btn btn-block btn-outline-success btn-send" value="등록" >

<jsp:include page="/WEB-INF/views/common/footer.jsp"></jsp:include>