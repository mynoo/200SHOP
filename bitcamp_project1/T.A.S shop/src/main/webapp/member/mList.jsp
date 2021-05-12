<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<jsp:include page="../common/generalhead.jsp"></jsp:include>
	
	<section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_2.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2">
							<a href="<%=contextPath %>/commom/common.jsp">Home <i class="fa fa-chevron-right"></i>
							</a>
						</span> 
						<span class="mr-2">
							<a href="board.jsp">Member<i class="fa fa-chevron-right"></i>
							</a>
						</span>
						<span>Member List<i class="fa fa-chevron-right"></i>
						</span>
					</p>
					<h2 class="mb-0 bread">Member List</h2>
				</div>
			</div>
		</div>
	</section>
	
	 <section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<table>
						<thead>
						
						</thead>
						<tbody>
							<tr>
								<th>no</th>
								<td>1</td>
							</tr>
							<tr>
								<th>writer</th>
								<td>aaaa</td>
							</tr>
							<tr>
								<th>title</th>
								<td>
									<h3 class="mb-3">It is a long established fact a reader be distracted</h3>
								</td>
							</tr>
							<tr>
								<th>
									regdate
								</th>
								<td>
									<input type="date" id="regdate" name="regdate" value="23 April 2020">
								</td>
							</tr>
							<tr>
								<th>contant</th>
								<td>
									
									Lorem ipsum dolor sit amet, consectetur adipisicing elit. Reiciendis, eius mollitia suscipit, quisquam doloremque distinctio perferendis et doloribus unde architecto optio laboriosam porro adipisci sapiente officiis nemo accusamus ad praesentium? Esse minima nisi et. Dolore perferendis, enim praesentium omnis, iste doloremque quia officia optio deserunt molestiae voluptates soluta architecto tempora.
									Molestiae cupiditate inventore animi, maxime sapiente optio, illo est nemo veritatis repellat sunt doloribus nesciunt! Minima laborum magni reiciendis qui voluptate quisquam voluptatem soluta illo eum ullam incidunt rem assumenda eveniet eaque sequi deleniti tenetur dolore amet fugit perspiciatis ipsa, odit. Nesciunt dolor minima esse vero ut ea, repudiandae suscipit!
								</td>
							</tr>
							<tr>
								<th>Attachments</th>
								<td>
									<input type="file" name="image" id="image">
								</td>
							</tr>
						</tbody>
					</table>
			
					<div class="button">
						<button type="button" class="btn btn-danger" style="float: right;"> 
							Back
						</button>
					</div>
				</div>
			</div>
		</div>
	</section>
		<jsp:include page="../common/footer.jsp"></jsp:include>
		
</body>
</html>