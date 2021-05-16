<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
<%
/* position for grid system */
/* int offset = 2 ;
int mywidth = twelve - 2 * offset ;
int leftside = 4 ;
int rightside = twelve - leftside ; */

//int formleft = 3 ;
//int formright = twelve - formleft ;
//int rightButton = 2 ;
%>
<!DOCTYPE html>
<html>
<head>
<script>
	$(document).ready(function() {
		$('[data-toggle="popover"]').popover();
	});
</script>
<style>
.imgbox{
	display: inline-block;
	vertical-align: top;
	text-align: right;
}
.containerbox{
	display: inline-block;
}
.container-wrap{
	width: 1200px;
	margin: 40 auto;
}
.btn{
	justify-content: flex-end;
}
.btnbox2{
	text-align: right;
	margin: 0 auto 20px;
	width: 986px;
}
h4{
	margin: 0px auto;
	padding: 20px 0;
	width: 1400px;
}
.form-control-sm{
	margin: 0 10px;
}
.col-lg-10 {
    margin: auto;
}
th{
	text-align: center !important;
}
button.btn.btn-primary {
    margin: 0 10 0 0;
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
						<span class="mr-2"><a
							href="<%=contextPath%>/common/main.jsp">Home <i
								class="fa fa-chevron-right"></i></a></span> <span>Products <i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Product Detail View</h2>
				</div>
			</div>
		</div>
	</section>
	<div class="container-wrap">
	
		<div class="imgbox col-sm-3" >
			<table>
				<tr>
					<%-- <td><img src="${applicationScope.uploadedPath}/${bean.image}" --%>
					<td><img src="<%=contextPath%>/images/${bean.image}"
						class="img-rounded" alt="${bean.pname}" width="350" height="400">
					</td>
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
							<th width="40%">상품명(번호)</th>
							<td width="60%" align="left">${bean.pname}(${bean.pno})</td>
						</tr>
						<tr>
							<th width="40%">재고 수량</th>
							<td width="60%" align="left">${bean.stock}</td>
						</tr>
						<tr>
							<th width="40%">가격</th>
							<td width="60%" align="left">${bean.price}</td>
						</tr>
						<tr>
							<th width="40%">설명</th>
							<td width="60%" align="left">${bean.content}</td>
						</tr>
						<tr>
							<th width="40%">주문 수량</th>
							<td width="60%" align="left">
								<form action="<%=YesForm%>" class="form-inline" role="form"
									method="post">
									<input type="hidden" name="command" value="mallInsert">
									<input type="hidden" name="pno" value="${bean.pno}"> 
									<input type="hidden" name="stock" value="${bean.stock}">
									<div class="form-group">
										<input type="number" name="qty" id="qty" class="form-control-sm" 
											data-toggle="popover" title="수량 입력란" data-trigger="hover"
											data-placement="auto top"
											data-content="구매하시고자 하는 수량을 정수로 입력하세요.">
									</div>
									<a href="${Noform}MallMyCart"><button type="submit" class="btn btn-primary">주문</button></a>
									<a href="${Noform}mallOrder&id=${loginfo.id}"><button type="submit" class="btn btn-primary">장바구니</button></a>
								</form>
							</td>
						</tr>
						<tr>
							<th width="25%" >입고 일자</th>
							<td width="75%" align="left">${bean.date}</td>
						</tr>
					</table>
						<a href="<%=Noform%>prDetailView&pno=${bean.pno}&${requestScope.parameters}">리뷰 등록하기</a>
					
						
					
					
					
					
					
				</div>
			</div>
		</div>
	</div>
		<div class="btnbox2">
			<button class="btn btn-primary" onclick="history.back();">
				돌아가기
			</button>
		</div>
	</div>
	<jsp:include page="../common/footer.jsp" />
</body>
</html>