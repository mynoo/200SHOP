<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>





<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/generalhead.jsp" />
 			  <div class="comment-form-wrap pt-5">
                <h3 class="mb-5">Leave a review</h3>
                <form method="POST" class="p-5 bg-light" action="<%=YesForm%>" enctype="multipart/form-data" >
                
                 <input type="hidden" id="command" name="command" value="reviewInsert">
                  <input type="hidden" name="pno" value="${bean.pno}">
                  
                   <div class="form-group">
                    <label for="name">Pno</label>
                    <input type="text" class="form-control" name="pno" id="pno" value="${bean.pno}" readonly/>
                  </div>
                  <div class="form-group">
                    <label for="name">ID</label>
                    <input type="text" class="form-control" name="mid" id="mid" value="${loginfo.id}" readonly />
                  </div>
                   <div class="form-group">
                    <label for="message">Message</label>
                    <textarea name="vcomment" id="vcomment" cols="30" rows="10" class="form-control"></textarea>
                  </div>
                  <div class="form-group" align="right">
                    <input type="submit" value="Post Comment" class="btn py-3 px-4 btn-primary">
					<input type="reset" value="Reset" class="btn py-3 px-4 btn-primary" name="reset" />
                  </div>
                </form>
              </div>
</body>
</html>