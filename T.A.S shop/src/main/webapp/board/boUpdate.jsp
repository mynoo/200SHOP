<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
<!DOCTYPE html>
<html>
<head>

<style type="text/css">
th {
	padding: 3px;
	background-color: #A23F25;
	color: white;
	border-bottom: 1px solid #ddd;
	border-right: 1px solid #ddd;
	border-radius: 5px;
    text-align: center;
}
tr{
text-align: center;
}
td {
	padding: 3px;
	border-bottom: 1px solid #ddd;
}

textarea {
	resize: none;
}
.col-xl-10.ftco-animate.fadeInUp.ftco-animated {
    padding: 0 200px;
}
</style>
</head>

<body>
	<jsp:include page="../common/generalhead.jsp" />

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('<%=contextPath%>/images/bg_4.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"><a href="../common/common.jsp">Home
								<i class="fa fa-chevron-right"></i>
						</a></span> <span>Board<i class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Board Update</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-xl-10 ftco-animate">
					<form id="comment_form" action="<%=YesForm%>" method="post"
						role="form">
					<form id="comment_form" action="<%=YesForm %>" method="post" role="form" >
						<input type="hidden" name="command" value="boUpdate">
						<table style="width: 100%">
							<tbody>
								<tr>
									<th>NO</th>
									<td><input class="form-control" type="hidden" name="bno" id="bno"
										value="${bean.bno}"></td>
									<th>no</th>
									<td>
										<input type="hidden" name="bno" id="bno" value="${bean.bno}">
									</td>
								</tr>
								<tr>
									<th>TITLE</th>
									<td><input class="form-control" name="title" id="title"
										value="${bean.title}"></td>
								</tr>
								<tr>
									<th>WRITER</th>
									<td><input class="form-control" type="hidden" name="writer" id="writer"
										value="${bean.writer}"></td>
									<th>Writer</th>
									<td>
										<input type="hidden" name="writer" id="writer" width="100%" value="${bean.writer}">
									</td>
								</tr>
								<tr>
									<th>COTENT</th>
									<td><input class="form-control" name="bcontents" id="bcontents"></td>
								</tr>
								<tr>
									<th>ATTACHMENTS</th>
									<td><input class="form-control" type="file" name="image" id="image"></td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="button" align="right">
							<button type="reset" class="btn btn-primary">Reset</button>
							<button type="submit" class="btn btn-primary">Submit</button>
						</div>
					</form>
					<!-- END -->
				</div>
				<!-- .col-md-8 -->
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />
</body>
</html>