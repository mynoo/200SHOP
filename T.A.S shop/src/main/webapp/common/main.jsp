<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common.jsp"%>
<!DOCTYPE>
<html>
<head>
<style>
.row.justify-content-center.pb-5 {
    margin: 200px 0 30px 0;
}
#viewAll {
    margin: 50px auto 100;
}
</style>
</head>
<body>

	<jsp:include page="mainhead.jsp" />

	<div class="hero-wrap"
		style="background-image: url('<%=contextPath%>/images/bg_2.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-center justify-content-center">
				<div class="col-md-8 ftco-animate d-flex align-items-end">
					<div class="text w-100 text-center">
						<h1 class="mb-4">
							Good <span>Drink</span> for Good <span>Moments</span>.
						</h1>
						<p>
							<a href="<%=Noform%>prprList" class="btn btn-primary py-2 px-4">Shop
								Now</a>
						</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<section class="ftco-intro">
		<div class="container">
			<div class="row no-gutters">
				<div class="col-md-4 d-flex">
					<div class="intro d-lg-flex w-100 ftco-animate">
						<div class="icon">
							<span class="flaticon-support"></span>
						</div>
						<div class="text">
							<h2>연중무휴 온라인 지원</h2>
							<p>고객들의 편의를 위해 24시간 연중무휴 온라인 고객센터를 운영합니다.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex">
					<div class="intro color-1 d-lg-flex w-100 ftco-animate">
						<div class="icon">
							<span class="flaticon-cashback"></span>
						</div>
						<div class="text">
							<h2>환불 보증</h2>
							<p>보다 확실한 품질을 보증하기 위해 조금이라도 품질에 문제가 있을 경우 환불을 보장합니다.</p>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex">
					<div class="intro color-2 d-lg-flex w-100 ftco-animate">
						<div class="icon">
							<span class="flaticon-free-delivery"></span>
						</div>
						<div class="text">
							<h2>무료 배송 &amp; 반품</h2>
							<p> 고객들의 상품에 대한 신뢰도를 높이기 위해 이렇게 했슴다. </p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pb">
		<div class="container">
			<div class="row">
				<div
					class="col-md-6 img img-3 d-flex justify-content-center align-items-center"
					style="background-image: url(<%=contextPath%>/images/about.jpg);"></div>
				<div class="col-md-6 wrap-about pl-md-5 ftco-animate py-5">
					<div class="heading-section">
						<span class="subheading">Since 1905</span>
						<h2 class="mb-4">욕망이 새로운 맛을 만나다.</h2>

						<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.</p>
						<p class="year">
							<strong class="number" data-number="116">0</strong> <span>연혁
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
		<div class="container">
			<div class="row justify-content-center pb-5">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<span class="subheading">Our Delightful offerings</span>
					<h2>Tastefully Yours</h2>
				</div>
			</div>
		</div>
		<div class="container">
			<div class="row">
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-1.jpg);"></div>
						<h3>Brandy</h3>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-2.jpg);"></div>
						<h3>Gin</h3>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-3.jpg);"></div>
						<h3>Rum</h3>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-4.jpg);"></div>
						<h3>Tequila</h3>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-5.jpg);"></div>
						<h3>Vodka</h3>
					</div>
				</div>
				<div class="col-lg-2 col-md-4 ">
					<div class="sort w-100 text-center ftco-animate">
						<div class="img"
							style="background-image: url(<%=contextPath%>/images/kind-6.jpg);"></div>
						<h3>Whiskey</h3>
					</div>
				</div>
			</div>
		</div>
		<div class="row justify-content-center" id="viewAll">
			<div class="col-md-4">
				<a href="<%=contextPath%>/product/product.jsp"
					class="btn btn-primary d-block">View All Products&nbsp&nbsp<span
					class="fa fa-long-arrow-right"></span>
				</a>
			</div>
		</div>

	<section class="ftco-section testimony-section img"
		style="background-image: url(<%=contextPath%>/images/bg_4.jpg);">
		<div class="overlay"></div>
		<div class="container">
			<div class="row justify-content-center mb-5">
				<div
					class="col-md-7 text-center heading-section heading-section-white ftco-animate">
					<span class="subheading">Testimonial</span>
					<h2 class="mb-3">Happy Clients</h2>
				</div>
			</div>
			<div class="row ftco-animate">
				<div class="col-md-12">
					<div class="carousel-testimony owl-carousel ftco-owl">
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-1.jpg)"></div>
										<div class="pl-3">
											<p class="name">Roger Scott</p>
											<span class="position">Marketing Manager</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-2.jpg)"></div>
										<div class="pl-3">
											<p class="name">Roger Scott</p>
											<span class="position">Marketing Manager</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-3.jpg)"></div>
										<div class="pl-3">
											<p class="name">Roger Scott</p>
											<span class="position">Marketing Manager</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-4.jpg)"></div>
										<div class="pl-3">
											<p class="name">Roger Scott</p>
											<span class="position">Marketing Manager</span>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div class="item">
							<div class="testimony-wrap py-4">
								<div
									class="icon d-flex align-items-center justify-content-center">
									<span class="fa fa-quote-left"></span>
								</div>
								<div class="text">
									<p class="mb-4">Far far away, behind the word mountains,
										far from the countries Vokalia and Consonantia, there live the
										blind texts.</p>
									<div class="d-flex align-items-center">
										<div class="user-img"
											style="background-image: url(<%=contextPath%>/images/prod-5.jpg)"></div>
										<div class="pl-3">
											<p class="name">Roger Scott</p>
											<span class="position">Marketing Manager</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="footer.jsp" />
</body>
</html>