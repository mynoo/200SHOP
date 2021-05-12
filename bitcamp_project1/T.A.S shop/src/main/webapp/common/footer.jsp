<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<footer class="ftco-footer">
		<div class="container">
			<div class="row mb-5">
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2 logo">
							<a href="<%=contextPath%>/common/main.jsp">T.A.S <span>Store</span></a>
						</h2>
						<p>Far far away, behind the word mountains, far from the
							countries.</p>
						<ul class="ftco-footer-social list-unstyled mt-2">
							<li class="ftco-animate">
								<a href="#">
									<span class="fa fa-twitter"></span>
								</a>
							</li>
							<li class="ftco-animate">
								<a href="#">
									<span class="fa fa-facebook"></span>
								</a>
							</li>
							<li class="ftco-animate">
								<a href="#">
									<span class="fa fa-instagram"></span>
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">My Accounts</h2>
						<ul class="list-unstyled">
							<li>
								<a href="<%=Noform%>meDetailView"><span class="fa fa-chevron-right mr-2"></span>
									My Account 
								</a>
							</li>
							<li>
								<c:if test="${whologin == 0}">
									<a href="<%=Noform%>meInsert"><span class="fa fa-chevron-right mr-2" ></span>
										Register 
									</a>
								</c:if>
							</li>
							<li>
								<c:if test="${whologin == 0}">
									<a href="<%=Noform%>meLogin"><span class="fa fa-chevron-right mr-2"></span>
									Log In 
									</a>
								</c:if>
								<c:if test="${whologin != 0}">
									<a href="<%=Noform%>meLogout"><span class="fa fa-chevron-right mr-2"></span>
									Log Out 
									</a>
								</c:if>
							</li>
							<li>
								<a href="#"><span class="fa fa-chevron-right mr-2"></span>
									My Order 
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4 ml-md-4">
						<h2 class="ftco-heading-2">Information</h2>
						<ul class="list-unstyled">
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>
									About us </a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>
									Catalog </a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>
									Contact us </a></li>
							<li><a href="#"><span class="fa fa-chevron-right mr-2"></span>
									Term &amp; Conditions </a></li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Quick Link</h2>
						<ul class="list-unstyled">
							<li>
								<a href="<%=Noform%>meInsert">
									<c:if test="${whologin == 0}">
										<span class="fa fa-chevron-right mr-2"></span>
										New User 
									</c:if>
								</a>
							</li>
							<li>
								<a href="#">
									<span class="fa fa-chevron-right mr-2"></span>
									Help Center 
								</a>
							</li>
							<li>
								<a href="#"><span class="fa fa-chevron-right mr-2"></span>
									Report Spam 
								</a>
							</li>
							<li>
								<a href="#">
									<span class="fa fa-chevron-right mr-2"></span>
									Faq's
								</a>
							</li>
						</ul>
					</div>
				</div>
				<div class="col-sm-12 col-md">
					<div class="ftco-footer-widget mb-4">
						<h2 class="ftco-heading-2">Have a Questions?</h2>
						<div class="block-23 mb-3">
							<ul>
								<li><span class="icon fa fa-map marker"></span> 
									<span class="text">
										459, Gangnam-daero, Seocho-gu, Seoul, Republic of Korea
									</span>
								</li>
								<li>
									<a href="#"> <span class="icon fa fa-phone"></span>
										<span class="text">+82 02 3486 9600</span>
									</a>
								</li>
								<li>
									<a href="#"> <span class="icon fa fa-paper-plane pr-4"></span>
										<span class="text">info@yourdomain.com</span>
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid px-0 py-5 bg-black">
			<div class="container">
				<div class="row">
					<div class="col-md-12">
						<p class="mb-0" style="color: rgba(255, 255, 255, .5);">
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
							Copyright &copy;
							<script>
								document.write(new Date().getFullYear());
							</script>
							All rights reserved | This template is made with
							<i class="fa fa-heart color-danger" aria-hidden="true"></i> by 
							<a href="https://colorlib.com" target="_blank">Colorlib.com</a>
							<!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
						</p>
					</div>
				</div>
			</div>
		</div>
	</footer>

	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
				<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
				<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" />
			</svg>
	</div>
</body>
</html>