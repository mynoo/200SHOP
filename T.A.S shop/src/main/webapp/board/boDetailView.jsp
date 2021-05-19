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
	            data : 'bno=' + '${bean.bno}', 
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
		            data : 'cnum=' + $(this).attr('pmkey') + '&bno=' + '${bean.bno}',  
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
	
	
</head>

<body>
	<<jsp:include page="../common/generalhead.jsp" />
    
    <section class="hero-wrap hero-wrap-2" style="background-image: url('../images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end justify-content-center">
          <div class="col-md-9 ftco-animate mb-5 text-center">
          	<p class="breadcrumbs mb-0"><span class="mr-2"><a href="../commom/common.jsp">Home <i class="fa fa-chevron-right"></i></a></span> <span class="mr-2"><a href="board.jsp">Board <i class="fa fa-chevron-right"></i></a></span> <span>Board Detail<i class="fa fa-chevron-right"></i></span></p>
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
						<th>no</th>
						<td>
							<input type="text" disabled="disabled" value="${bean.bno}">
						</td>
					</tr>
					<tr>
						<th>writer</th>
						<td>
							<input type="text" disabled="disabled" value="${bean.writer}">
						</td>
					</tr>
					<tr>
						<th>title</th>
						<td>
							<input type="text" disabled="disabled" value="${bean.title}">
						</td>
					</tr>
					<tr>
						<th>
							regdate
						</th>
						<td>
							<input type="text" disabled="disabled" value="${bean.writedate}">
						</td>
					</tr>
					<tr>
						<th>contant</th>
						<td>
							<input type="text" disabled="disabled" value="${bean.bcontents}">	
						</td>
					</tr>
				</tbody>
			</table>
			
            <div class="tag-widget post-tag-container mb-5 mt-5">
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">Life</a>
                <a href="#" class="tag-cloud-link">Sport</a>
                <a href="#" class="tag-cloud-link">Tech</a>
                <a href="#" class="tag-cloud-link">Travel</a>
              </div>
            </div>
            
            <div class="button" align="right">
				<a href="board.jsp" class="btn btn-primary py-2 px-4" >Go Back</a>
			</div>
            
            <div class="pt-5 mt-5">
              <h3 class="mb-5">6 Comments</h3>
              <ul class="comment-list">
              
              
                <li class="comment">
                  <div class="vcard bio">
                    <img src="../images/person_1.jpg" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">April 12, 2020 at 1:21am</div>
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                    <p align="right">
             			<a href="#" class="reply" >Reply</a>
                    </p>
                  </div>
                </li>
                
                <c:forEach var="rebean" items="${requestScope.relists}">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="../images/icons/icon2.png" alt="Image placeholder">
                  </div>
                  <div class="comment-body">
                    <h3>
                    ${rebean.mid}
                    </h3>
                    <div class="meta">
                    ${rebean.redate}
                    </div>
                    <p>
                    ${rebean.comments}
                    </p>
                    <p align="right">
             			<a href="#" class="reply">Reply</a>
                    </p>
                  </div>
                </li>
                </c:forEach>
                
              </ul>
              
              <!-- END comment-list -->
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Leave a comment</h3>
                <form action="<%=YesForm %>" class="p-5 bg-light" role="form" method="post">
                	<input type="hidden" name="command" value="boDetailView">
                  <div class="form-group">
                  	<input type="hidden" name="bno" id="bno" value="${bean.bno}">
                    <label for="name">Name *</label>
                    <input type="text" name="fakewriter" id="fakemid" class="form-control" disabled="disabled" value="${sessionScope.loginfo.id}">
                    <input type="hidden" name="mid" id="mid" value="${sessionScope.loginfo.id}">
                  </div>
                   <div class="form-group">
                    <label for="message">Message</label>
                    <input type="text" name="comments" id="comments">
                  </div>
                  <div class="form-group" align="right">
                    <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
              
            </div>

          </div> <!-- .col-md-8 -->
          <div class="col-lg-4 sidebar pl-lg-5 ftco-animate">
            <div class="sidebar-box">
              <form action="#" class="search-form">
                <div class="form-group">
                  <span class="fa fa-search"></span>
                  <input type="text" class="form-control" placeholder="Type a keyword and hit enter">
                </div>
              </form>
            </div>
<!--             <div class="sidebar-box ftco-animate">
              <div class="categories">
                <h3>Services</h3>
                <li><a href="#">Relation Problem <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Couples Counseling <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Depression Treatment <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Family Problem <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Personal Problem <span class="fa fa-chevron-right"></span></a></li>
                <li><a href="#">Business Problem <span class="fa fa-chevron-right"></span></a></li>
              </div>
            </div> -->

            <div class="sidebar-box ftco-animate">
              <h3>Recent Board</h3>
              <div class="block-21 mb-4 d-flex">
                <div class="text">
                  <h3 class="heading">
                  	<a href="https://brunch.co.kr/@paxcom/268">
                  		술은 성질이 따뜻해서 몸의 체온을 올리고 혈액순환을 왕성하게 하며 통증을 줄여준다.
                  	</a>
                  </h3>
                  <div class="meta">
                    <div><a href="#"><span class="fa fa-calendar"></span> Apr. 18, 2020</a></div>
                    <div><a href="#"><span class="fa fa-user"></span> Admin</a></div>
                    <div><a href="#"><span class="fa fa-comment"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <div class="text">
                  <h3 class="heading">
                  	<a href="http://blog.yes24.com/blog/blogMain.aspx?blogid=silvianim&artSeqNo=423273">
                  		청주는 일반적으로 15~20도가 적당하고, 데워서 마실 때는 40~45도 정도가 좋다.
                  	</a>
                  </h3>
                  <div class="meta">
                    <div><a href="#"><span class="fa fa-calendar"></span> Apr. 18, 2020</a></div>
                    <div><a href="#"><span class="fa fa-user"></span> Admin</a></div>
                    <div><a href="#"><span class="fa fa-comment"></span> 19</a></div>
                  </div>
                </div>
              </div>
              <div class="block-21 mb-4 d-flex">
                <div class="text">
                  <h3 class="heading"><a href="#">Even the all-powerful Pointing has no control about the blind texts</a></h3>
                  <div class="meta">
                    <div><a href="#"><span class="fa fa-calendar"></span> Apr. 18, 2020</a></div>
                    <div><a href="#"><span class="fa fa-user"></span> Admin</a></div>
                    <div><a href="#"><span class="fa fa-comment"></span> 19</a></div>
                  </div>
                </div>
              </div>
            </div>
			<c:if test="${whologin == 2}">
			<div class="button" align="right">
				<a href="board_Detail" class="btn btn-primary py-1 px-2" >write</a>
			</div>
			</c:if>
            <div class="sidebar-box ftco-animate">
              <h3>Tag Cloud</h3>
              <div class="tagcloud">
                <a href="#" class="tag-cloud-link">counsel</a>
                <a href="#" class="tag-cloud-link">problem</a>
                <a href="#" class="tag-cloud-link">family</a>
                <a href="#" class="tag-cloud-link">personal</a>
                <a href="#" class="tag-cloud-link">business</a>
                <a href="#" class="tag-cloud-link">computer</a>
                <a href="#" class="tag-cloud-link">house</a>
                <a href="#" class="tag-cloud-link">technology</a>
              </div>
            </div>

          <!--   <div class="sidebar-box ftco-animate">
              <h3>Paragraph</h3>
              <p>
              	Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ducimus itaque, 
              	autem necessitatibus voluptate quod mollitia delectus aut, 
              	sunt placeat nam vero culpa sapiente consectetur similique, 
              	inventore eos fugit cupiditate numquam!
              </p>
            </div>-->
          </div> 

        </div>
      </div>
    </section> <!-- .section -->

	<jsp:include page="../common/footer.jsp" />
    
  </body>
</html>