<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Order Information</title>
	
	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	
	<script type="text/javascript">
		function neworder() {
			location.href = "orderdetail/neworderinformation.jsp"
		}
	
		$(document).ready(function name() {
			
		});
	</script>
</head>

<body>
	<jsp:include page="../common/generalhead.jsp" />

	<section class="hero-wrap hero-wrap-2" style="background-image: url('<%=contextPath%>/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2">
							<a href="<%=Noform%>main">Home <i class="fa fa-chevron-right"></i></a>
						</span> 
						<span>Order<i class="fa fa-chevron-right"></i>
						</span>
					</p>
					<h2 class="mb-0 bread">Order Information</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">
					<form action="<%=YesForm%>" class="billing-form" method="post">
					
						<input type="hidden" name="command" value="mallDetail">
						
						<h3 class="mb-4 billing-heading">Billing Details</h3>
						<div class="row align-items-end">
							<div class="col-md-12">
								<div class="form-group mt-4">
									<div class="radio">
										<label>
											<input type="radio" onclick="neworder();"> Ship to different address
										</label>
									</div>
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="name">받는 사람</label>
									<input type="text" name="name" class="form-control" value="${loginfo.name}">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="zipcode"> 우편 번호 </label>
									<input type="text" name="zipcode" class="form-control" value="${loginfo.zipcode}">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="roadaddress">도로명 주소</label>
									<input type="text" name="roadaddress" class="form-control" value="${loginfo.roadaddress}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="address2">상세 주소</label>
									<input type="text" name="address2" class="form-control" value="${loginfo.address2}">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="address1">지번 주소</label>
									<input type="text" name="address1" class="form-control" value="${loginfo.address1}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="extraaddress">참조 주소</label>
									<input type="text" name="extraaddress" class="form-control" value="${loginfo.extraaddress}">
								</div>
							</div>
							<div class="w-100"></div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="phonenumber">핸드폰 번호</label>
									<input type="text" name="phonenumber" class="form-control" value="${loginfo.phonenumber}">
								</div>
							</div>
							<div class="col-md-6">
								<div class="form-group">
									<label for="email">이메일</label>
									<input type="text" name="email" class="form-control" value="${loginfo.email}">
								</div>
							</div>
						</div>

						<div class="row mt-5 pt-3 d-flex">
							<div class="col-md-6 d-flex">
								<div class="cart-detail cart-total p-3 p-md-4">
									<h3 class="billing-heading mb-4">Cart Total</h3>
									<p class="d-flex">
										<span>Subtotal</span>
										<span>$20.60</span>
									</p>
									<p class="d-flex">
										<span>Delivery</span>
										<span>$0.00</span>
									</p>
									<p class="d-flex">
										<span>Discount</span>
										<span>$3.00</span>
									</p>
									<hr>
									<p class="d-flex total-price">
										<span>Total</span>
										<span>$17.60</span>
									</p>
								</div>
							</div>
							<div class="col-md-6">
								<div class="cart-detail p-3 p-md-4">
									<h3 class="billing-heading mb-4">Payment Method</h3>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<label>
													<input type="radio" name="optradio" class="mr-2" value="계좌 이체"> Direct Bank Tranfer
												</label>
										</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<label>
													<input type="radio" name="optradio" class="mr-2" value="신용/체크"> Check Payment
												</label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<div class="col-md-12">
											<div class="radio">
												<label>
													<input type="radio" name="optradio" class="mr-2" value="페이"> Paypal
												</label>
											</div>
										</div>
										<div class="button" align="center">
											<input type="submit" class="btn btn-default"
												style="background-color: #b7472a; color: white;" value="Place to order">
										</div>
									</div>
								</div>
							</div>
						</div>
					</form><!-- END -->
				</div> <!-- .col-md-8 -->
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />
	</body>
</html>
