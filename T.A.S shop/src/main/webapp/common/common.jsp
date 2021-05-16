<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	int twelve = 12 ;
%>
<%-- 로그인 상태 정보 --%>
<c:set var="whologin" value="0" /> 
<c:if test="${empty sessionScope.loginfo}">
	<c:set var="whologin" value="0" />
</c:if>
<c:if test="${not empty sessionScope.loginfo}">
	<c:if test="${sessionScope.loginfo.id == 'admin'}">
		<c:set var="whologin" value="2" />
	</c:if>
	<c:if test="${sessionScope.loginfo.id != 'admin'}">
		<c:set var="whologin" value="1" />
	</c:if>
</c:if>
<%
	String contextPath = request.getContextPath();
	
	String mapping = "/Shopping";
	
	String Noform = contextPath + mapping + "?command=";
	
	String YesForm = contextPath + mapping;
%>
<!DOCTYPE>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport"
		content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<link
		href="https://fonts.googleapis.com/css2?family=Spectral:ital,wght@0,200;0,300;0,400;0,500;0,700;0,800;1,200;1,300;1,400;1,500;1,700&display=swap"
		rel="stylesheet">
	<link rel="preconnect" href="https://fonts.gstatic.com">
	<link href="https://fonts.googleapis.com/css2?family=Song+Myung&display=swap" rel="stylesheet">
	<link rel="stylesheet"
		href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
	<link rel="stylesheet" href="<%=contextPath%>/css/animate.css">
	
	<link rel="stylesheet" href="<%=contextPath%>/css/owl.carousel.min.css">
	<link rel="stylesheet" href="<%=contextPath%>/css/owl.theme.default.min.css">
	<link rel="stylesheet" href="<%=contextPath%>/css/magnific-popup.css">
	
	<link rel="stylesheet" href="<%=contextPath%>/css/flaticon.css">
	<link rel="stylesheet" href="<%=contextPath%>/css/style.css">
	
	<script src="<%=contextPath%>/js/jquery.min.js"></script>
	<script src="<%=contextPath%>/js/jquery-migrate-3.0.1.min.js"></script>
	<script src="<%=contextPath%>/js/popper.min.js"></script>
	<script src="<%=contextPath%>/js/bootstrap.min.js"></script>
	<script src="<%=contextPath%>/js/jquery.easing.1.3.js"></script>
	<script src="<%=contextPath%>/js/jquery.waypoints.min.js"></script>
	<script src="<%=contextPath%>/js/jquery.stellar.min.js"></script>
	<script src="<%=contextPath%>/js/owl.carousel.min.js"></script>
	<script src="<%=contextPath%>/js/jquery.magnific-popup.min.js"></script>
	<script src="<%=contextPath%>/js/jquery.animateNumber.min.js"></script>
	<script src="<%=contextPath%>/js/scrollax.min.js"></script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="<%=contextPath%>/js/google-map.js"></script>
	<script src="<%=contextPath%>/js/main.js"></script>
	
	<style type="text/css">
		/* for form validation check */
		.err{font-size:10pt;color:red;font-weight:bolder;}
	</style>
	
</head>
<body>

</body>
</html>