<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
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
	width: 1400px;
	margin: 0 auto;
}
.btnbox2{
	text-align: right;
	margin: 0 auto 20px;
	width: 1130px;
}
h4{
	margin: 0px auto;
	padding: 20px 0;
	width: 1400px;
}
.form-control-sm{
	margin: 0 10px;
}

table {
	border-collapse: collapse;
	width: 100%;
}
th {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}
td {
	padding: 8px;
	text-align: center;
	border-bottom: 1px solid #ddd;
}
h4 {
	text-align: center;
}
ul.pagination{
	justify-content: center;
}
ul.pagination li {
    padding: 3;
}
form.form-inline {
    justify-content: center;
}

.hidden-col{display: none;}
#btn3 {
    margin: 20px auto 0;
}
form.form-inline {
    margin: auto;
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
					<h2 class="mb-0 bread">Products</h2>
				</div>
			</div>
		</div>
	</section>
	<h4>Product Detail View</h4>
	<div class="container-wrap">
	
		<div class="imgbox col-sm-2" >
			<table>
				<tr>
					<td><img src="${applicationScope.uploadedPath}/${bean.image}"
						class="img-rounded" alt="${bean.pname}" width="200" height="200">
					</td>
				</tr>
			</table>
		</div>
	<div class="containerbox container col-sm-offset col-sm-6">
		<div class="panel panel-primary">
			<div class="panel-heading"></div>
			<div class="panel-body">
				<div class="col-sm-2">
					<table class="table table-bordered">
						<tr>
							<td width="25%" align="center">상품명(번호)</td>
							<td width="75%" align="left">${bean.pname}(${bean.pno})</td>
						</tr>
						<tr>
							<td width="25%" align="center">재고 수량</td>
							<td width="75%" align="left">${bean.stock}</td>
						</tr>
						<tr>
							<td width="25%" align="center">가격</td>
							<td width="75%" align="left">${bean.price}</td>
						</tr>
						<tr>
							<td width="25%" align="center">설명</td>
							<td width="75%" align="left">${bean.content}</td>
						</tr>
						<tr>
							<td width="25%" align="center">주문 수량</td>
							<td width="75%" align="left">
								<form action="<%=YesForm%>" class="form-inline" role="form"
									method="post">
									<input type="hidden" name="command" value="mallInsert">
									<input type="hidden" name="pno" value="${bean.pno}"> <input
										type="hidden" name="stock" value="${bean.stock}">
									<div class="form-group">
										<input type="number" name="qty" id="qty" class="form-control-sm"
											data-toggle="popover" title="수량 입력란" data-trigger="hover"
											data-placement="auto top"
											data-content="구매하시고자 하는 수량을 정수로 입력하세요.">
									</div>
									<a href="${Noform}MallMyCart"><button type="submit" class="btn btn-primary btn2">주문</button></a>
								</form>
							</td>
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
			<button class="btn btn-primary" onclick="history.back();">
				돌아가기
			</button>
		</div>
	</div>
	
	
	
	<section class="ftco-section">
	<div>
		<h4><상품 리뷰></h4>
	</div>
		<div class="container">
			<table>
				<thead align="center">
					<tr>
						<th>회원 아이디</th>
						<th>코멘트</th>
						<th>작성 날짜</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
				<tr>
							<%-- <td class="hidden-col">${bean.vnum}</td> --%>
							<td>${bean.mid}</td>
							<td>${bean.vcomment}</td>
							<td>${bean.inputdate}</td>
					<td>
					<form action="<%=YesForm%>" class="form-inline" role="form"	method="get">
							<input type="hidden" name="command" value="reviewDelete">
							<input type="hidden" name="vnum" value="${bean.vnum}">
							<input type="hidden" name="pno" value="${bean.pno}">
							<button type="submit" class="btn btn-danger" id="btn2" onclick="return confirm('삭제하시겠습니까?');">삭제</button>		
					</form>
					</td>
					<td>
							<form action="<%=YesForm%>" class="form-inline" role="form"	method="get">
							<input type="hidden" name="command" value="reviewUpdate">
							<input type="hidden" name="vnum" value="${bean.vnum}">
							<button type="submit" class="btn btn-danger" id="btn2" onclick="return confirm('수정하시겠습니까?');">수정</button>		
							</form>
					</td>
				</tr>
				</c:forEach>		
				</tbody>
			</table>
			<form action="<%=YesForm%>" role="form"	method="post">
				<input type="hidden" name="command" value="reviewMain">
				<input type="hidden" name="pno" value="${bean.pno}">
				<input type="submit" class="btn btn-danger" id="btn3" style="float: right;" value="리뷰 등록">		
			</form>
			<%-- <div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<footer>${pageInfo.pagingHtml}</footer>
					</div>
				</div>
			</div> --%>
		</div>
	</section>
	
	
	
	
	<jsp:include page="../common/footer.jsp" />
</body>
</html>