<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>

<!DOCTYPE html>
<html>
<head>
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
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-condensed">
						<thead>
							<tr>
								<th class="text-center" style="color: black;">주문 번호</th>
								<th class="text-center" style="color: black;">주문 일자</th>
								<th class="text-center"> </th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="shopinfo" items="${requestScope.lists}">
								<tr class="record">
									<td align="center">${shopinfo.oid}</td>
									<td align="center">${shopinfo.orderdate}</td>
									<td align="center">
										<a href="<%=Noform%>mallDetail&oid=${shopinfo.oid}">
											주문 내역 확인하기
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<div class="button" style="float: right;">
						<a href="<%=Noform%>main" class="btn btn-primary py-3 px-4"> Home </a>
					</div>
				</div>
			</div>
		</div>
	</section>
	
	
</body>
</html>