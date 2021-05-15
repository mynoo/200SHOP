<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp" %>
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
ul.pagination{
	justify-content: center;
}
ul.pagination li {
    padding: 3;
}
form.form-inline {
    justify-content: center;
}
</style>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<section class="ftco-section">
		<div class="container">
			<table>
				<tbody>
					<tr>
						<th>등록 번호</th>
						&nbsp;&nbsp;
						<th>회원 아이디</th>
						&nbsp;&nbsp;
						<th>코멘트</th>
						&nbsp;&nbsp;
						<th>작성 날짜</th>
					</tr>
				</tbody>
				<tbody>
				<tbody>
				<c:forEach var="bean" items="${requestScope.lists}">
				<tr>
							<td>${bean.vnum}</td>
							<td>${bean.mid}</td>
							<td>${bean.vcomment}</td>
							<td>${bean.inputdate}</td>
					<td>
					<form action="<%=YesForm%>" class="form-inline" role="form"	method="get">
							<input type="hidden" name="command" value="reviewDelete">
							<input type="hidden" name="vnum" value="${bean.vnum}">
							<input type="hidden" name="pno" value="${bean.pno}">
							<button type="submit" class="btn btn-danger" onclick="return confirm('삭제하시겠습니까?');">삭제</button>		
					</form>
							<%-- <a href="<%=Noform%>reviewDelete&vnum=${bean.vnum}" onclick="return confirm('삭제하시겠습니까?');">
								Delete
							</a> --%>
					</td>
					<td>
							<a href="<%=Noform%>prUpdate&pno=${bean.pno}">
								Update
							</a>
						
					</td>
				</tr>
				</c:forEach>		
				</tbody>
			</table>
			<%-- <div class="row mt-5">
				<div class="col text-center">
					<div class="block-27">
						<footer>${pageInfo.pagingHtml}</footer>
					</div>
				</div>
			</div> --%>
		</div>
	</section>


</body>
</html>