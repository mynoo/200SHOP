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
}

td {
	padding: 3px;
	border-bottom: 1px solid #ddd;
}

textarea {
	resize: none;
}

.col-xl-10.ftco-animate.fadeInUp.ftco-animated {
	padding: 0 200;
}

th {
	border-radius: 5px;
	text-align: center;
}

tr {
	text-align: center;
}

.button {
	width: 692px;
}

p, label {
	color: #000;
	font-family: 'Slabo 27px', serif;
}

comment-form-wrap pt-5 {
	font-family: 'Slabo 27px', serif;
}

table {
	width: 70%;
	margin: 0 auto;
}
</style>
<script>
		function gotolist(){
			location.href = '<%=Noform%>boList' ;
		}
		function addNewItem(cnum, writer, content, regdate) {
			/* 댓글 1개를 추가해 주는 함수 */
			var litag = $("<li>"); // 새로운 글이 추가될 li태그 객체
			litag.addClass("comment_item");
			
			var ptag = $("<p>");// 작성자 정보가 지정될 <p>태그
			ptag.addClass("writer");
			
			var spantag = $("<span>");// 작성자 정보의 이름
			spantag.addClass("name");
			spantag.html(writer + "님");
			
			var spandate = $("<span>");// 작성 일시
			spandate.html("&nbsp;&nbsp;/&nbsp;&nbsp;" + regdate + " ");
			
			var inputtag = $("<input>");// 삭제하기 버튼
			inputtag.attr({"class" : "btn btn-default btn-xs", "type" : "button", "value" : "삭제하기", "pmkey" : cnum});
			inputtag.addClass("delete_btn");
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
	</style>
	<script>
		function gotolist(){
			location.href = '<%=Noform%>boList' ;
		}
		function addNewItem(cnum, writer, content, regdate) {
			/* 댓글 1개를 추가해 주는 함수 */
			var litag = $("<li>"); // 새로운 글이 추가될 li태그 객체
			litag.addClass("comment_item");
			
			var ptag = $("<p>");// 작성자 정보가 지정될 <p>태그
			ptag.addClass("writer");
			
			var spantag = $("<span>");// 작성자 정보의 이름
			spantag.addClass("name");
			spantag.html(writer + "님");
			
			var spandate = $("<span>");// 작성 일시
			spandate.html("&nbsp;&nbsp;/&nbsp;&nbsp;" + regdate + " ");
			
			var inputtag = $("<input>");// 삭제하기 버튼
			inputtag.attr({"class" : "btn btn-default btn-xs", "type" : "button", "value" : "삭제하기", "pmkey" : cnum});
			inputtag.addClass("delete_btn");
	
			var content_p = $("<p>");// 내용
			content_p.html( content );
	
			// 조립하기
			ptag.append(spantag).append(spandate).append(inputtag);
			litag.append(ptag).append(content_p);
			
			$("#comment_list").append(litag);			
		}
		
		function getListComment(){ /* 댓글 목록을 읽어 온다. */
			$("#comment_list").empty() ;
			$.ajax({ /* 유효성 검사를 통과 했을 때 Ajax 함수 호출 */
	            url: '<%=Noform%>reList',
	            data : 'no=' + '${bean.no}', 
	    		type : "get",             
	            dataType: "json",
	            success: function (obj, textStatus) {
		           	/* var obj = JSON.parse(data); */
		           	 
					$.each(obj, function (idx) {
		           		 var cnum = obj[idx].cnum ;	 
		           		 var writer = obj[idx].writer ;
		           		 var content = obj[idx].content ;	 
		           		 var regdate = obj[idx].regdate ;
		           		 addNewItem(cnum, writer, content, regdate);
		           	});
	            }
	        });
		}
		
		/** 삭제 버튼 클릭시에 항목 삭제하도록 "미리" 지정 */
		$(document).on("click", ".delete_btn", function() {
			if (confirm("정말 선택하신 항목을 삭제하시겠습니까?")) {
				
				$.ajax({ /* 유효성 검사를 통과 했을 때 Ajax 함수 호출 */
		            url: '<%=Noform%>reDelete',
		            data : 'cnum=' + $(this).attr('pmkey') + '&no=' + '${bean.no}',  
		    		type : "post",             
		            dataType: "text",
		            success: function (data, textStatus) { /* 댓글 삭제 */	            	
		            	getListComment() ; /* 목록 갱신 */		           
		            }
		        });			
			}
		});	
		
		$(document).ready(function() {
			getListComment() ; /* 시작하자 마자 읽어 오기 */		 
			 
			/** 덧글 내용 저장 이벤트 */
			$("#comment_form").submit(function(){
				// 작성자 이름에 대한 입력여부 검사
				if (!$("#writer").val()) {
					alert("이름을 입력하세요.");
					$("#writer").focus();
					return false;
				}
	
				// 내용에 대한 입력여부 검사
				if (!$("#content").val()) {
					alert("내용을 입력하세요.");
					$("#content").focus();
					return false;
				}		
				
				var url = '<%=Noform%>reInsert' ;
				var parameter = $('#comment_form').serialize() ;
				$.post(url, parameter, function( data ) {
					/* alert( '댓글이 작성되었읍니다.' ) ; */
					getListComment(0) ; /* 목록 갱신 */
					$("#writer").val('') ;
					$("#content").val('') ;
					
				}).fail(function() {
					alert("덧글 작성에 실패했습니다. 잠시 후에 다시 시도해 주세요.");
				});
				return false ;
			});			
		});	
	</script>
<%
// 여기에 빈을  담아오기
%>

var content_p = $("
<p>
	");// 내용 content_p.html( content ); // 조립하기
	ptag.append(spantag).append(spandate).append(inputtag);
	litag.append(ptag).append(content_p); $("#comment_list").append(litag);
	} function getListComment(){ /* 댓글 목록을 읽어 온다. */
	$("#comment_list").empty() ; $.ajax({ /* 유효성 검사를 통과 했을 때 Ajax 함수 호출 */
	url: '<%=Noform%>reList', data : 'bno=' + '${bean.bno}', type : "get",
	dataType: "json", success: function (obj, textStatus) { /* var obj =
	JSON.parse(data); */ $.each(obj, function (idx) { var cnum =
	obj[idx].cnum ; var writer = obj[idx].writer ; var content =
	obj[idx].content ; var regdate = obj[idx].regdate ; addNewItem(cnum,
	writer, content, regdate); }); } }); } /** 삭제 버튼 클릭시에 항목 삭제하도록 "미리" 지정
	*/ $(document).on("click", ".delete_btn", function() { if (confirm("정말
	선택하신 항목을 삭제하시겠습니까?")) { $.ajax({ /* 유효성 검사를 통과 했을 때 Ajax 함수 호출 */ url:
	'<%=Noform%>reDelete', data : 'cnum=' + $(this).attr('pmkey') + '&bno='
	+ '${bean.bno}', type : "post", dataType: "text", success: function
	(data, textStatus) { /* 댓글 삭제 */ getListComment() ; /* 목록 갱신 */ } }); }
	}); $(document).ready(function() { getListComment() ; /* 시작하자 마자 읽어 오기
	*/ /** 덧글 내용 저장 이벤트 */ $("#comment_form").submit(function(){ // 작성자 이름에
	대한 입력여부 검사 if (!$("#writer").val()) { alert("이름을 입력하세요.");
	$("#writer").focus(); return false; } // 내용에 대한 입력여부 검사 if
	(!$("#content").val()) { alert("내용을 입력하세요."); $("#content").focus();
	return false; } var url = '<%=Noform%>
	reInsert'; var parameter = $('#comment_form').serialize(); $.post(url,
	parameter, function(data) { /* alert( '댓글이 작성되었읍니다.' ) ; */
	getListComment(0); /* 목록 갱신 */ $("#writer").val('');
	$("#content").val(''); }).fail(function() { alert("덧글 작성에 실패했습니다. 잠시 후에
	다시 시도해 주세요."); }); return false; }); });
	</script>
	<%
	// 여기에 빈을  담아오기
	%>

</head>

<body>
	<<jsp:include page="../common/generalhead.jsp" />

	<section class="hero-wrap hero-wrap-2"
		style="background-image: url('<%=contextPath%>/images/bg_4.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2"><a href="../commom/common.jsp">Home
								<i class="fa fa-chevron-right"></i>
						</a></span> <span class="mr-2"><a href="board.jsp">Board <i
								class="fa fa-chevron-right"></i></a></span> <span>Board Detail<i
							class="fa fa-chevron-right"></i></span>
					</p>
					<h2 class="mb-0 bread">Board Detail</h2>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<table>
						<tbody>
							<tr>
								<th>NO</th>
								<td><input class="form-control" type="text"
									disabled="disabled" value="${bean.bno}"></td>
							</tr>
							<tr>
								<th>WRITER</th>
								<td><input class="form-control" type="text"
									disabled="disabled" value="${bean.writer}"></td>
							</tr>
							<tr>
								<th>TITLE</th>
								<td><input class="form-control" type="text"
									disabled="disabled" value="${bean.title}"></td>
							</tr>
							<tr>
								<th>REGDATE</th>
								<td><input class="form-control" type="text"
									disabled="disabled" value="${bean.writedate}"></td>
							</tr>
							<tr>
								<th>CONTENT</th>
								<td><input class="form-control" type="text"
									disabled="disabled" value="${bean.bcontents}"></td>
							</tr>
						</tbody>
					</table>

					<br>
					<div class="button" align="right">
						<a href="board.jsp" class="btn btn-primary">Go Back</a>
					</div>

					<div class="pt-5 mt-5">
						<h3 class="mb-5">6 Comments</h3>
						<ul class="comment-list">


							<li class="comment">
								<div class="vcard bio">
									<img src="<%=contextPath%>/upload/person_1.jpg"
										alt="Image placeholder">
								</div>
								<div class="comment-body">
									<h3>John Doe</h3>
									<div class="meta">April 12, 2020 at 1:21am</div>
									<p>Lorem ipsum dolor sit amet, consectetur adipisicing
										elit. Pariatur quidem laborum necessitatibus, ipsam impedit
										vitae autem, eum officia, fugiat saepe enim sapiente iste
										iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
									<!-- <p align="right">
										<a href="#" class="reply btn btn-primary">Reply</a>
									</p> -->
								</div>
							</li>

							<c:forEach var="rebean" items="${requestScope.relists}">
								<li class="comment">
									<div class="vcard bio">
										<img src="../images/icons/icon2.png" alt="Image placeholder">
									</div>
									<div class="comment-body">
										<h3>${rebean.mid}</h3>
										<div class="meta">${rebean.redate}</div>
										<p>${rebean.comments}</p>
									</div>
								</li>
							</c:forEach>

						</ul>

						<!-- END comment-list -->
						<div class="comment-form-wrap pt-5">
							<h3 class="mb-5">Leave a comment</h3>
							<form action="<%=YesForm%>" class="p-5 bg-light" role="form"
								method="post">
								<input class="form-control" type="hidden" name="command"
									value="boDetailView">
								<div class="form-group">
									<input class="form-control" type="hidden" name="bno" id="bno"
										value="${bean.bno}"> <label for="name">Name *</label>
									<input type="text" name="fakewriter" id="fakemid"
										class="form-control" disabled="disabled"
										value="${sessionScope.loginfo.id}"> <input
										class="form-control" type="hidden" name="mid" id="mid"
										value="${sessionScope.loginfo.id}">
								</div>
								<div class="form-group">
									<label for="message">Message</label>
									<p>
										<textarea rows="10" cols="102" name="comments" id="comments"></textarea>
									</p>
								</div>
								<div class="form-group" align="right">
									<input type="submit" value="Submit" class="btn btn-primary">
								</div>

							</form>
						</div>

					</div>

				</div>
				<!-- .col-md-8 -->
			</div>
		</div>
	</section>
	<!-- .section -->

	<jsp:include page="../common/footer.jsp" />

</body>
</html>