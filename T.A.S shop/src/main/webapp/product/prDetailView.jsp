<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>
<script>
$(document).ready(function() {
	$('[data-toggle="popover"]').popover();
});
function goinsert() {
    location.href = '<%=Noform%>
    	mallInsert';
}
</script>
<style>
.imgbox {
display: inline-block;
vertical-align: top;
text-align: right;
}

.containerbox {
display: inline-block;
}

.container-wrap {
width: 1200px;
margin: 100 auto;
margin-left: 200;
}

.btn {
justify-content: flex-end;
}

.btnbox2 {
text-align: right;
margin: 0 auto 20px;
width: 986px;
}

h4 {
margin: 0px auto;
padding: 20px 0;
width: 1400px;
}

.form-control-sm {
margin: 0 10px;
}

.col-lg-10 {
margin: auto;
}

th {
text-align: center !important;
}

button.btn.btn-primary {
margin: 0 10 0 0;
}
.containerbox.container.col-sm-offset.col-sm-6 {
margin: 0;
}
</style>
</head>
<body>
<jsp:include page="../common/generalhead.jsp" />

<section class="hero-wrap hero-wrap-2"
	style="background-image: url('<%=contextPath%>/images/bg_2.jpg');"
	data-stellar-background-ratio="0.5">
	<div class="overlay"></div>
	<div class="container">
		<div
			class="row no-gutters slider-text align-items-end justify-content-center">
			<div class="col-md-9 ftco-animate mb-5 text-center">
				<p class="breadcrumbs mb-0">
					<span class="mr-2"><a href="<%=Noform%>main">Home <i
							class="fa fa-chevron-right"></i></a></span> <span>Products <i
						class="fa fa-chevron-right"></i></span>
				</p>
				<h2 class="mb-0 bread">Products</h2>
			</div>
		</div>
	</div>
</section>
<div class="container-wrap">
	<form action="<%=YesForm%>" class="form-inline" role="form"
		method="post">
		<input type="hidden" name="command" value="mallInsert">
		<div class="imgbox col-sm-3">
			<table>
				<tr>
					<td><img src="upload/${bean.image}" class="img-rounded"
						alt="${bean.pname}" width="300" height="400"></td>
				</tr>
			</table>
		</div>
		<div class="containerbox container col-sm-offset col-sm-6">
			<div class="panel panel-primary">
				<div class="panel-heading"></div>
				<div class="panel-body">
					<div class="col-lg-10">
						<table class="table table-bordered">
							<tr>
								<td width="40%" align="center">상품명(번호)</td>
								<td width="60%" align="left">${bean.pname}(${bean.pno})<input
									type="hidden" name="pno" value="${bean.pno}">
								</td>
							</tr>
							<tr>
								<td width="40%" align="center">재고 수량</td>
								<td width="60%" align="left">${bean.stock}<input
									type="hidden" name="stock" value="${bean.stock}">
								</td>
							</tr>
							<tr>
								<td width="40%" align="center">가격</td>
								<td width="60%" align="left">${bean.price}<input
									type="hidden" name="price" value="${bean.price}">
								</td>
							</tr>
							<tr>
								<td width="40%" align="center">설명</td>
								<td width="60%" align="left">${bean.content}</td>
							</tr>
							<tr>
								<td width="40%" align="center">주문 수량</td>
								<td width="60%" align="left"><input type="number"
									name="qty" id="qty" class="form-control-sm"
									data-toggle="popover" title="수량 입력란" data-trigger="hover"
									data-placement="auto top"
									data-content="구매하시고자 하는 수량을 정수로 입력하세요."></td>
							</tr>
							<tr>
								<td width="25%" align="center">입고 일자</td>
								<td width="75%" align="left">${bean.date}</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="btnbox2">
			<button type=submit class="btn btn-primary btn2">주문</button>
			<button type=submit class="btn btn-primary btn2">장바구니</button>
		</div>
	</form>
<div class="btnbox3">
	<c:set var="totalcount" value="${requestScope.totalcount}" />
	<form action="<%=YesForm%>" class="form-inline" role="form"
		method="get">
		<input type="hidden" name="command" value="reviewList"> <input
			type="hidden" name="pno" value="${bean.pno}"> <input
			type="hidden" name="totalcount" value="${requestScope.totalcount}">
	<button type="submit" class="btn btn-primary" id="btn1">리뷰보기(${requestScope.totalcount})</button>
	<button class="btn btn-primary" onclick="history.back();">돌아가기</button>
	</form>
</div>
</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>