<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	
	<style type="text/css">
		th {
			padding: 3px;
			text-align: center;
			background-color: #A23F25;
			color: white;
			border-bottom: 1px solid #ddd;
			border-right: 1px solid #ddd;
		}
		td {
			padding: 3px;
			border-bottom: 1px solid #ddd;
		}
		textarea {
			resize: none;
		}
	</style>
</head>

<body>
    <jsp:include page="../common/generalhead.jsp" />
    
     <section class="hero-wrap hero-wrap-2" style="background-image: url('<%=contextPath%>/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate mb-5 text-center">
          	<p class="breadcrumbs mb-0">
          		<span class="mr-2">
          			<a href="#">
          				Home 
          				<i class="fa fa-chevron-right"></i>
          			</a>
          		</span>
          		<span>Board 
          			<i class="fa fa-chevron-right"></i>
          		</span>
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
					<form id="comment_form" action="<%=YesForm %>" method="post" role="form" >
						<input type="hidden" name="command" value="boUpdate">
						<h3>Update Board</h3>
						<table style="width: 100%">
							<tbody>
								<tr>
									<th>no</th>
									<td width="500px" height="60px">
										<input type="text" disabled="disabled" value="${bean.bno}">
										<input type="hidden" name="bno" id="bno" value="${bean.bno}">
									</td>
								</tr>
								<tr>
									<th>Title</th>
									<td height="60px">
										<input name="title" id="title">
									</td>
								</tr>
								<tr>
									<th>Writer</th>
									<td height="60px">
										<input type="text"  disabled="disabled" value="${bean.writer}">
										<input type="hidden" name="writer" id="writer" value="${bean.writer}">
									</td>
								</tr>
								<tr>
									<th>Contant</th>
									<td height="300px">
										<textarea rows="10" cols="80" name="bcontents" id="bcontents" ></textarea>
									</td>
								</tr>
							</tbody>
						</table>
						<br>
						<div class="button" align="right">
							<button type="reset" class="btn btn-defalt" style="background-color: #A23F25; color: white;">Reset</button>
							&nbsp;&nbsp;&nbsp;
							<button type="submit" class="btn btn-defalt" style="background-color: #A23F25; color: white;">Submit</button>
						</div>
					</form><!-- END -->
				</div> <!-- .col-md-8 -->
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />
  </body>
</html>