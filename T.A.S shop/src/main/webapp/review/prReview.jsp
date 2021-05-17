<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/common/common.jsp" %>
<!DOCTYPE html>
<html>
<head>


<style type="text/css">
*{margin:0; padding:0;}
.star{
  display:inline-block;
  width: 30px;height: 60px;
  cursor: pointer;
}
.star_left{
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat 0 0; 
  background-size: 60px; 
  margin-right: -3px;
}
.star_right{
  background: url(http://gahyun.wooga.kr/main/img/testImg/star.png) no-repeat -30px 0; 
  background-size: 60px; 
  margin-left: -3px;
}
.star.on{
  background-image: url(http://gahyun.wooga.kr/main/img/testImg/star_on.png);
}
</style>


<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/generalhead.jsp" />
	
	
 			  <div class="comment-form-wrap pt-5">
                <h3 align="center">리뷰 작성</h3>
                <form method="POST" class="p-5 bg-light" action="<%=YesForm%>" enctype="multipart/form-data" >
                
                 <input type="hidden" id="command" name="command" value="reviewInsert">
                  
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
<div class="star-box">
  <span class="star star_left" ></span>
  <span class="star star_right"></span>

  <span class="star star_left"></span>
  <span class="star star_right"></span>

  <span class="star star_left"></span>
  <span class="star star_right"></span>

 <span class="star star_left"></span>
 <span class="star star_right"></span>

 <span class="star star_left"></span>
 <span class="star star_right"></span>
</div>
<script type="text/javascript">
$(".star").on('click',function(){
	   var idx = $(this).index();
	   $(".star").removeClass("on");
	     for(var i=0; i<=idx; i++){
	        $(".star").eq(i).addClass("on");
	   }
	 });
</script>
                  <div class="form-group" align="right">
                    <input type="submit" value="Post Review" class="btn py-3 px-4 btn-primary">
					<input type="reset" value="Reset" class="btn py-3 px-4 btn-primary" name="reset" />
                  </div>
                </form>
              </div>
</body>
</html>