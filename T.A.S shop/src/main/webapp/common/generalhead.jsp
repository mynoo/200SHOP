<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
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
</head>
<body>
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<p class="mb-0 phone pl-md-2">
						<span class="fa fa-phone mr-1"></span>
						+82 02 3486 9600
						<span class="fa fa-paper-plane mr-1"></span>
						youremail@tasshop.com 
					</p>
				</div>
				<div class="col-md-6 d-flex justify-content-md-end">
					<div class="social-media mr-4">
						<p class="mb-0 d-flex">
							<a href="#" target=”_blank” onclick="javascript:window.open('https://www.facebook.com/sharer/sharer.php?u=' +encodeURIComponent(document.URL)+'&t='+encodeURIComponent(document.title), 'facebooksharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Facebook" class="d-flex align-items-center justify-content-center" >
								<span class="fa fa-facebook">
									<i class="sr-only">Facebook</i>
								</span>
							</a>
							<a href="#" onclick="javascript:window.open('https://twitter.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Twitter" class="d-flex align-items-center justify-content-center">
								<span class="fa fa-twitter">
									<i class="sr-only">Twitter</i>
								</span>
							</a>
							<a href="#" onclick="javascript:window.open('https://instagram.com/intent/tweet?text=[%EA%B3%B5%EC%9C%A0]%20' +encodeURIComponent(document.URL)+'%20-%20'+encodeURIComponent(document.title), 'twittersharedialog', 'menubar=no,toolbar=no,resizable=yes,scrollbars=yes,height=300,width=600');return false;" target="_blank" alt="Share on Instagram" class="d-flex align-items-center justify-content-center">
								<span class="fa fa-instagram">
									<i class="sr-only">Instagram</i>
								</span>
							</a>
						</p>
					</div>
					<div class="reg">
						<p class="mb-0">
							<c:if test="${whologin == 0}">
								<a href="<%=Noform%>regForm" class="mr-2">Sign Up</a>
								<a href="<%=Noform%>meLogin">Log In</a>
							</c:if>
							<c:if test="${whologin == 2}">
								<a href="<%=Noform%>meList" class="mr-2">Member List</a>
							</c:if>
							<c:if test="${whologin != 0}">
								<a href="<%=Noform%>meDetailView" class="mr-2">My Profile</a>
								<a href="<%=Noform%>meLogout">Log Out</a>
							</c:if>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<nav
		class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light"
		id="ftco-navbar">
		<div class="container">
			<a class="navbar-brand" href="<%=Noform%>main">T.A.S <span>store</span></a>
			<div class="order-lg-last btn-group">
				<a href="<%=Noform%>prprList" class="btn-cart dropdown-toggle dropdown-toggle-split">
					<span class="flaticon-shopping-bag"></span>
					<div class="d-flex justify-content-center align-items-center">
						<c:set var="shopcount" value="${sessionScope.shoplists.size() }" />
						<small style="color: white;">${shopcount}</small>
					</div>
				</a>
				<div class="dropdown-menu dropdown-menu-right">
					<div class="dropdown-item d-flex align-items-start" href="#">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/prod-1.jpg);"></div>
						<div class="text pl-3">
							<h4>Bacardi 151</h4>
							<p class="mb-0">
								<a href="#" class="price">$25.99</a><span class="quantity ml-3">Quantity:
									01</span>
							</p>
						</div>
					</div>
					<div class="dropdown-item d-flex align-items-start" href="#">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/prod-2.jpg);"></div>
						<div class="text pl-3">
							<h4>Jim Beam Kentucky Straight</h4>
							<p class="mb-0">
								<a href="#" class="price">$30.89</a><span class="quantity ml-3">Quantity:
									02</span>
							</p>
						</div>
					</div>
					<div class="dropdown-item d-flex align-items-start" href="#">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/prod-3.jpg);"></div>
						<div class="text pl-3">
							<h4>Citadelle</h4>
							<p class="mb-0">
								<a href="#" class="price">$22.50</a><span class="quantity ml-3">Quantity:
									01</span>
							</p>
						</div>
					</div>
					<a class="dropdown-item text-center btn-link d-block w-100"
						href="<%=contextPath%>/order/order.jsp"> View All <span
						class="ion-ios-arrow-round-forward"></span>
					</a>
				</div>
			</div>

			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#ftco-nav" aria-controls="ftco-nav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="oi oi-menu"></span> Menu
			</button>

			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active">
						<a href="<%=Noform%>main" class="nav-link">Home</a>
					</li>
					<li class="nav-item">
						<a href="<%=Noform%>prprList" class="nav-link">Products</a>
					</li>
					<li class="nav-item">
						<a href="<%=Noform%>boList" class="nav-link">Boards</a>
					</li>
					<li class="nav-item">
						<a href="<%=contextPath%>/common/contact.jsp" class="nav-link">Contact</a>
					</li>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="dropdown04" 
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">My Info</a>
						<div class="dropdown-menu" aria-labelledby="dropdown04">
							<a class="dropdown-item" href="<%=Noform%>meDetailView">My Profile</a>
							<a class="dropdown-item" href="<%=Noform%>meUpdate">Profile Modify</a>
							<c:if test="${whologin == 2}">
								<a class="dropdown-item" href="<%=Noform%>meList">Member List</a>
							</c:if>
							<a class="dropdown-item" href="<%=Noform%>meDelete&id=${loginfo.id}"> Secession</a>
						</div>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<!-- END nav -->
</body>
</html>