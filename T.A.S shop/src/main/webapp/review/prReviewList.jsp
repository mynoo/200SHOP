<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./../common/common.jsp"%>
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
		  color: initial;
		}
		
		td {
		  padding: 8px;
		  text-align: center;
		  border-bottom: 1px solid #ddd;
		  font: message-box;
		}
		ul.pagination {
   		justify-content: center;
		}
		h4{
		   margin: 0px auto;
		   padding: 20px 0;
		   width: 1400px;
		   text-align: center;
		}
	</style>
</head>

<body>
	   <jsp:include page="../common/generalhead.jsp" />
	   
			 <c:set var="totalcount" value="${requestScope.totalcount}"/>
			<c:if test="${totalcount < 1 }">
				 <script>
		 		 	alert('등록된 리뷰가 없습니다.');
   				 </script>
			</c:if>  
			
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
               <h2 class="mb-0 bread">Product Review</h2>
            </div>
         </div>
      </div>
   </section>
    
 <section class="ftco-section">
      <div class="container">
         <table>
            <thead align="center">
               <tr>
                  <th>회원 아이디</th>
                  <th>코멘트</th>
                  <th>작성 날짜</th>
                  <th></th>
                  <th></th>
               </tr>
            </thead>
            <tbody>
            <c:forEach var="bean" items="${requestScope.lists}">
            <tr>
                     <td>${bean.mid}</td>
                     <td>${bean.vcomment}</td>
                     <td>${bean.inputdate}</td>
               <td>
               <form action="<%=YesForm%>" class="form-inline" role="form"   method="get" style="margin-block: initial">
                     <input type="hidden" name="command" value="reviewDelete">
                     <input type="hidden" name="vnum" value="${bean.vnum}">
                     <input type="hidden" name="pno" value="${bean.pno}">
                     <button type="submit" class="btn btn-danger" id="btn2" onclick="return confirm('삭제하시겠습니까?');">삭제</button>      
               </form>
               </td>
               <td>
              	 	 <c:set var="mid" value="${bean.mid}" />
               		 <c:if test="${loginfo.id eq mid}">
	               		 <form action="<%=YesForm%>" class="form-inline" role="form" method="get" style="margin-block: initial">
		                     <input type="hidden" name="command" value="reviewUpdate">
		                     <input type="hidden" name="vnum" value="${bean.vnum}">
	                     	 <button type="submit" class="btn btn-danger" id="btn2" onclick="return confirm('수정하시겠습니까?');">수정</button>      
                    	 </form>
               		 </c:if>
               </td>
            </tr>
            </c:forEach> 
            </tbody>
              <c:if test="${requestScope.lists eq '[]'}">
            		<td colspan="3" align="center">
            			등록된 리뷰가 없습니다.
            		</td>
              </c:if>
         </table>
         <form action="<%=YesForm%>" role="form"   method="post">
            <input type="hidden" name="command" value="reviewMain">
            <input type="hidden" name="pno" value="${requestScope.pno}">
            <input type="submit" class="btn btn-danger" id="btn3" style="float: right; margin-top: 10;" value="리뷰 등록">      
         </form>
         
	
      </div>
      
      <div class="row mt-5" align="center">
			<div class="col text-center" >
				<div class="block-27" >
					<footer>${pageInfo.pagingHtml}</footer>
				</div>
			</div>
	  </div>
   </section>

	<jsp:include page="../common/footer.jsp" />
    
  </body>
</html>