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
		padding: 15px;
		border-bottom: 1px solid #ddd;
	}
	
	input{
		background-color: white;
		border-bottom-color: white;
		border-color: white;
		box-shadow: no;
		border: none;
		border-bottom: 0 px;
		border-left: 0 px;
		border-right: 0 px;
		border-top: 0 px;
		
	}
	
	input:focus {
		outline: none;
	}
	h3 {
	color: black;
	}
	span.meta {
    color: #b7472a;;
	}
	span.black{
	color: #808080;
	}
	
	
	
	</style>
	

	
</head>

<body>
	<<jsp:include page="../common/generalhead.jsp" />
    
	<section class="hero-wrap hero-wrap-2" style="background-image: url('<%=contextPath%>/images/bg_2.jpg');" data-stellar-background-ratio="0.5">
		<div class="container">
			<div class="row no-gutters slider-text align-items-end justify-content-center">
				<div class="col-md-9 ftco-animate mb-5 text-center">
					<p class="breadcrumbs mb-0">
						<span class="mr-2">
							<a href="<%=Noform%>main">Home <i class="fa fa-chevron-right"></i></a>
						</span> 
						<span>Board<i class="fa fa-chevron-right"></i>
						</span>
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
						<th>no</th>
						<td width="500px" height="60px">
							<input type="text" disabled="disabled" width="500px" value="${bean.bno}">
						</td>
					</tr>
					<tr>
						<th>작성자</th>
						<td height="60px">
							<input type="text" disabled="disabled" value="${bean.writer}">
						</td>
					</tr>
					<tr>
						<th>제목</th>
						<td height="60px">
							<input type="text" disabled="disabled" value="${bean.title}">
						</td>
					</tr>
					<tr>
						<th>
							등록 날짜
						</th>
						<td height="60px">
							<input type="text" disabled="disabled" value="${bean.writedate}">
						</td>
					</tr>
					<tr>
						<th>내용</th>
						<td height="350px">
							<input type="text" disabled="disabled" value="${bean.bcontents}">	
						</td>
					</tr>
				</tbody>
			</table>
			
            
            <div class="button" align="right">
				<a href="<%=Noform %>boList" class="btn btn-primary py-1 px-2" >Go Back</a>
			</div>
            
            <div class="pt-5 mt-5">
              <h3 class="mb-5">Comments</h3>
              <ul class="comment-list">
              
              
                <li class="comment">
                  <div class="vcard bio">
                	<img src="<%=request.getContextPath()%>/upload/icon2.png" >
				 </div>
                  <div class="comment-body">
                    <h3>John Doe</h3>
                    <div class="meta">
                    <span class="meta">
                    April 12, 2020 at 1:21am
                   	</span>
                    </div>
                    <span class="black">
                    <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Pariatur quidem laborum necessitatibus, ipsam impedit vitae autem, eum officia, fugiat saepe enim sapiente iste iure! Quam voluptas earum impedit necessitatibus, nihil?</p>
                   </span>
                   </div>
                </li>
                
                <c:forEach var="rebean" items="${requestScope.relists}">
                <li class="comment">
                  <div class="vcard bio">
                    <img src="<%=request.getContextPath()%>/upload/icon2.png" >
                  </div>
                  <div class="comment-body">
                    <h3>
                    ${rebean.mid}
                    </h3>
                    <div class="meta">
                    <span class="meta">
                    ${rebean.redate}
                    </span>
                    </div>
                    <p>
                    <span class="black">
                    ${rebean.comments}
                    </span>
                    </p>
                  </div>
                </li>
                </c:forEach>
                
              </ul>
              
              <c:if test="${sessionScope.loginfo.id == 'admin'}">
              
              <!-- END comment-list -->
              <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">답글 작성</h3>
                <form action="<%=YesForm %>" class="p-5 bg-light" role="form" method="post">
                	<input type="hidden" name="command" value="boDetailView">
                  <div class="form-group">
                  	<input type="hidden" name="bno" id="bno" value="${bean.bno}">
                    <label for="name">Name *</label>
                    <input type="text" name="fakewriter" id="fakemid" class="form-control" disabled="disabled" value="관리자">
                    <input type="hidden" name="mid" id="mid" value="관리자">
                  </div>
                   <div class="form-group">
                    <label for="message">Message</label>
                    <p>
                    <textarea rows="10" cols="77" name="comments" id="comments"></textarea>
                    </p>
                  </div>
                  <div class="form-group" align="right">
                    <input type="submit" value="답글 등록" class="btn py-3 px-4 btn-primary">
                  </div>

                </form>
              </div>
              
              </c:if>
              
            </div>

          </div> <!-- .col-md-8 -->
         

        </div>
      </div>
    </section> <!-- .section -->

	<jsp:include page="../common/footer.jsp" />
    
  </body>
</html>