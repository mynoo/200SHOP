<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<style>
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
            <h2 class="mb-0 bread">Board</h2>
          </div>
        </div>
      </div>
    </section>

	<section class="ftco-section">
		<div class="container">
			<table>
				<thead>
					<tr>
						<th>no</th>
						<th>title</th>
						<th>contant</th>
						<th>writer</th>
						<th>writedate</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>1</td>
						<td>
							<a href="board_Detail.jsp"> The Recipe from a <br>
								Winemakerâs Restaurent
							</a>
						</td>
						<td>
							<p>A small river named Duden flows by their place and
								supplies</p>
						</td>
						<td>aaaa</td>
						<td>23 April 2020</td>
					</tr>
					<tr>
						<td>2</td>
						<td>
							<a href="#"> The Recipe from a <br>
								Winemakerâs Restaurent
							</a>
						</td>
						<td>
							<p>A small river named Duden flows by their place and
								supplies</p>
						</td>
						<td>bbbb</td>
						<td>23 April 2020</td>
					</tr>
					<tr>
						<td>3</td>
						<td>
							<a href="#"> The Recipe from a <br>
								Winemakerâs Restaurent
							</a>
						</td>
						<td>
							<p>A small river named Duden flows by their place and
								supplies</p>
						</td>
						<td>cccc</td>
						<td>23 April 2020</td>
					</tr>
				</tbody>
			</table>
			<br>
			<p>
				<a href="board_Insert.jsp" class="btn btn-primary py-2 px-4" >Write</a>
			</p>
		</div>

		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<li><a href="#">&lt;</a></li>
						<li class="active"><span>1</span></li>
						<li><a href="#">2</a></li>
						<li><a href="#">3</a></li>
						<li><a href="#">4</a></li>
						<li><a href="#">5</a></li>
						<li><a href="#">&gt;</a></li>
					</ul>
				</div>
			</div>
		</div>
	</section>

	<jsp:include page="../common/footer.jsp" />
    
  </body>
</html>