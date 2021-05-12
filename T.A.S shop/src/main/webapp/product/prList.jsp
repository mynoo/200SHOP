<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp"%>
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

h4 {
	text-align: center;
}
</style>
<script>	
		function search(){
			var mode = $('#mode').val() ;
			var keyword = $('#keyword').val() ;
			location.href='<%=Noform%>prList' + '&mode=' + mode + '&keyword=' + keyword ;
		}
		function searchAll(){
			location.href='<%=Noform%>prList';
		}
		function writeForm(){
			location.href='<%=Noform%>prInsert';
		}
		
		$(document).ready(function(){
			
		});
	</script>
</head>

<body>

	<section class="ftco-section">
		<div class="container">
			<h4>Product List</h4>
			<table>
				<thead>
					<tr>
						<td align="center" colspan="12">
							<form action="" class="form-inline" role="form" name="myform"
								method="get">
								<div class="form-group">
									<select id="mode" name="mode" class="form-control">
										<option value="all" selected="selected">-- 선택하세요.
										<option value="pname">이름
										<option value="company">제조회사
										<option value="category">카테코리
									</select>
								</div>
								<div class="form-group">
									<input type="text" class="form-control" name="keyword"
										id="keyword">
								</div>
								&nbsp;&nbsp;
								<button class="btn btn-default" type="button"
									onclick="search();">검색</button>
								&nbsp;&nbsp;
								<button class="btn btn-default" type="button"
									onclick="searchAll();">전체 검색</button>
								<c:if test="${whologin == 2}">
									<button class="btn btn-default btn-info" type="button"
										onclick="writeForm();">상품 등록</button>
								</c:if>
								&nbsp;&nbsp; ${pageInfo.pagingStatus}
							</form>
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th>PNO</th>
						<th>PNAME</th>
						<th>CONTENT</th>
						<th>BRAND</th>
						<th>COMPANY</th>
						<th>CATEGORY</th>
						<th>STOCK</th>
						<th>PRICE</th>
						<th>ALCOHOL</th>
						<th>VOLUME</th>
						<th>DATE</th>
						<th>DELETE</th>
						<th>UPDATE</th>
					</tr>
				</tbody>
				<tbody>
				<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
				<tr>
					<td>${bean.pno}</td>
					<td>
						<a href="<%=Noform%>prDetailView&num=${bean.pname}&${requestScope.parameters}">
							${bean.pname}
						</a>
					</td>
							<td>${bean.content}</td>
							<td>${bean.brand}</td>
							<td>${bean.company}</td>
							<td>${bean.category}</td>
							<td>${bean.stock}</td>
							<td>${bean.price}</td>
							<td>${bean.alcohol}</td>
							<td>${bean.volume}</td>
							<td>${bean.date}</td>
					<td>
						<c:if test="${whologin == 2}">
							<a href="<%=Noform%>prDelete&num=${bean.pno}&${requestScope.parameters}">
								삭제
							</a>
						</c:if>
						<c:if test="${whologin != 2}">
							삭제
						</c:if>				
					</td>
					<td>
						<c:if test="${whologin == 2}">
							<a href="<%=Noform%>prUpdate&num=${bean.pno}&${requestScope.parameters}">
								수정
							</a>
						</c:if>
						<c:if test="${whologin != 2}">
							수정
						</c:if>					
						
					</td>
				</tr>
				</c:forEach>		
				</tbody>
			</table>
			<div align="center">
				<footer>${pageInfo.pagingHtml}</footer>
			</div>
			<a href="board_Insert.jsp"><button class="btn btn-primary"
					id="pr-btn">상품 등록</button></a>
		</div>
	</section>
	<br><br><br><br>
		<script type="text/javascript">
		   /* 방금 전 선택한 콤보 박스를 그대로 보여 주기 */ 
			$('#mode option').each(function(){
				if( $(this).val() == '${pageInfo.mode}' ){
					$(this).attr('selected', 'selected') ;
				}
			});	
			/* 이전에 넣었던 값 그대로 보존 */
			$('#keyword').val( '${pageInfo.keyword}' ) ;		
		</script>	

</body>
</html>