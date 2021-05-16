<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<%
int pageSize = 9;
%>
<!DOCTYPE html>
<html lang="en">
<head>
</head>
<style>
#prList {
	float: right;
}

ul.pagination {
	justify-content: center;
}

ul.pagination li {
	padding: 3;
}

.block-27 {
	margin-bottom: 20px;
}
</style>
<script>	
		function search(){
			var mode = $('#mode').val() ;
			var keyword = $('#keyword').val() ;
			location.href='<%=Noform%>prprList' + '&mode=' + mode + '&keyword=' + keyword ;
		}
		function searchAll(){
			location.href='<%=Noform%>prprList';
	}
	$(document).ready(function() {

	});
</script>
<body>
	<jsp:include page="../common/generalhead.jsp" />

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url(<%=contextPath%>/images/bg_4.jpg);"
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
					<h2 class="mb-0 bread">Products</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row">
				<div class="col-md-9">
					<div class="row mb-4">
						<div class="col-md-12" id="prList">
				<c:if test="${whologin == 2}">
					<a href="<%=Noform%>prList"><button class="btn btn-primary">상품
							목록</button></a>
				</c:if>
							<form action="" class="form-inline" role="form" name="myform"
								method="get">
								<div class="form-group">
									<select id="mode" name="mode" class="form-control-sm">
										<option value="all" selected="selected">-- 선택하세요.
										<option value="pname">이름
										<option value="brand">제조회사
										<option value="category">카테고리
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control-sm" name="keyword"
										id="keyword">
								</div>
								&nbsp;&nbsp;
								<button class="btn btn-default" type="button"
									onclick="search();">검색</button>
								&nbsp;&nbsp;
								<button class="btn btn-default" type="button"
									onclick="searchAll();">전체 검색</button>
								&nbsp;&nbsp; ${pageInfo.pagingStatus}
							</form>
						</div>
					</div>
					<div class="row">
						<c:forEach var="bean" items="${requestScope.lists}">
							<div class="col-md-4 d-flex">
								<div class="product ftco-animate">

									<div
										class="img d-flex align-items-center justify-content-center"
										style="background-image: url(<%=contextPath%>/images/${bean.image});">
										<div class="desc">
											<p class="meta-prod d-flex">
												<a href="<%=Noform%>mallOrder&id=${loginfo.id}"
													class="d-flex align-items-center justify-content-center"><span
													class="flaticon-shopping-bag"></span></a> <a
													href="<%=Noform%>prDetailView&pno=${bean.pno}&${requestScope.parameters}"
													class="d-flex align-items-center justify-content-center"><span
													class="flaticon-visibility"></span></a>
											</p>
										</div>
									</div>
									<div class="text text-center">
										<span class="new">New Arrival</span> <span class="category">${bean.category}</span>
										<h2>${bean.pname }</h2>
										<p class="mb-0">
											<span class="price price-sale">${bean.price }</span> <span
												class="price">${bean.price-bean.price/10 }</span>
										</p>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="col-md-3">
					<div class="sidebar-box ftco-animate">
						<div class="categories" id="mode" name="mode">
							<h3>Product Types</h3>
							<ul class="p-0">
								<li><a href="<%=Noform%>prprList&category=brandy">Brandy <span
										class="fa fa-chevron-right" name="keyword"
										id="keyword"></span></a></li>
								<li><a href="<%=Noform%>prprList&category=gin">Gin <span class="fa fa-chevron-right"></span></a></li>
								<li><a href="<%=Noform%>prprList&category=rum">Rum <span class="fa fa-chevron-right"></span></a></li>
								<li><a href="<%=Noform%>prprList&category=tequila">Tequila <span
										class="fa fa-chevron-right"></span></a></li>
								<li><a href="<%=Noform%>prprList&category=vodka">Vodka <span class="fa fa-chevron-right"></span></a></li>
								<li><a href="<%=Noform%>prprList&category=whiskey" name="keyword"
										id="keyword">Whiskey <span
										class="fa fa-chevron-right" ></span></a></li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<hr>
	<div class="row mt-5">
		<div class="col text-center">
			<div class="block-27">
				<footer>${pageInfo.pagingHtml}</footer>
			</div>
		</div>
	</div>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>