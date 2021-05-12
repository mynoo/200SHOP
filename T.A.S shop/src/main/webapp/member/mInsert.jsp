<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Sign Up</title>
	<!-- Font Icon -->
	<link rel="stylesheet" href="<%=contextPath%>/fonts/material-icon/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="<%=contextPath%>/vendor/nouislider/nouislider.min.css">

	<!-- Main css -->
	<link rel="stylesheet" href="<%=contextPath%>/css/css/style.css">
	    
	<style type="text/css">
		#button1{
			border-top-left-radius:5px;
			border-bottom-left-radius:5px;
			margin-right:-4px;
			border: 1px solid skyblue;
		}
	</style>
	
	<script type="text/javascript">
		function Idcheck() {
			var id = document.minsertform.id.value;
			
			if(id.length < 4){
				alert('아이디는 최소 4자리 이상이어야 합니다.');
				document.minsertform.id.focus();
				return false;
			}
			
			var url = '<%=Noform%>meIdcheck&id=' + id;
			window.open(url, 'mywin', 'height=150, width=300');
		}
		
		function zipfind() {
			var url = '<%=Noform%>meZipcheck';
			
			window.open(url, 'mywin', 'height=600, width=720 scrollbar=yes')
		}
		
		function isCheckFalse() {
			document.minsertform.isCheck.value = false;
		}
		
		function checkForm(){
			var isCheck = document.minsertform.isCheck.value  ;
			if(isCheck == 'false'){
				alert('아이디 중복 체크를 해주세요.') ;
				return false ; 
			}
		}
		
		function Checkpw() {
			
			// 비밀번호
			var pw = document.getElementById('password').value;
			// 특수문자
			var SC = ["!","@","#","$","%"];
			// 특수문자 갯수
			var check_SC = 0;
	 		
			// 비밀번호에서 특수문자 카운트 
			for(var i=0;i<SC.length;i++){
				if(pw.indexOf(SC[i]) != -1){
				check_SC = 1;
				}
			}
			
			// 특수문자 없을시
			if(check_SC == 0){
				window.alert('!,@,#,$,% 의 특수문자가 들어가 있지 않습니다.')
				document.getElementById('password').value='';
			}
			
			// 비밀번호 확인
			if(document.getElementById('password').value !='' && document.getElementById('confpassword').value!=''){
				if(document.getElementById('password').value==document.getElementById('confpassword').value){
					document.getElementById('same').innerHTML='비밀번호가 일치합니다.'
					document.getElementById('same').style.color='blue';
				}
				else{
					document.getElementById('same').innerHTML='비밀번호가 일치하지 않습니다.';
					document.getElementById('same').style.color='red';
				}
			}
		}

		$(document).ready(function name() {
			$('[data-toggle = "tooltip"]').tooltip();
		});
	</script>

</head>
<body>
	<div class="main">
        <div class="container">
            <div class="signup-content">
                <div class="signup-img">
                    <img src="<%=contextPath %>/images/solid.png" alt="">
                    <div class="signup-img-content">
                        <h2>Register now </h2>
                        <p>while seats are available !</p>
                    </div>
                </div>
                <div class="signup-form">
                    <form method="POST" class="register-form" name="minsertform" >
                    
                    <input type="hidden" id="command" value="meInsert">
                    <input type="hidden" id="isCheck" value="false">
                    
                        <div class="form-row">
                            <div class="form-group">
                                <div class="form-input">
                                    <label for="id" class="required">Id</label>
                                    <input type="text" class="form-control" name="id" id="id" pattern="[A-Za-z]+"
                                    	placeholder="input your id" data-toggle="tooltip" 
                                    	onkeyup="isCheckFalse()" value="${bean.id}"/>
									<input type="button" value="Id Check" class="btn btn-primary" id="button" name="button" 
										onclick="Idcheck()"/>
									<span class="err">${errid}</span>
                                </div>
                                
                                <div class="form-input">
                                    <label for="name" class="required">Name</label>
                                    <input type="text" name="name" id="name" value="${bean.name}"/>
                                    <span class="err">${errname}</span>
                                </div>
                                
                                <div class="form-input">
                                    <label for="password" class="required">Password</label>
                                    <input type="password" name="password" id="password" onchange="Checkpw()"/>
                                    <span class="err">${errpassword}</span>
                                </div>
                                
                                <div class="form-input">
                                    <label for="confpassword" class="required">Confirm Password</label>
                                    <input type="password" name="confpassword" id="confpassword" onchange="Checkpw()"/>
                                    <span id="same"></span>
                                </div>
                                
                                <div class="form-input">
                                    <label for="birth" class="required">Birth</label>
                                    <input type="date" name="birth" id="birth" value="${bean.birth}"/>
                                    <span class="err">${errbirth}</span>
                                </div>
                                
                                <div class="form-input">
									<label for="phonenumber" class="required">Phone</label>
                                    <input type="text" name="phonenumber" id="phonenumber" pattern="[0-9]+" value="${bean.phonenumber}"/>
                                    <span class="err">${errphonenumber}</span>
                                </div>
                                
                            </div>
                            <div class="form-group">
                            	
                            	<div class="form-input">
                                    <label for="email" class="required">Email</label>
                                    <input type="email" name="email" id="email" placeholder="ex)abc@abc.com" value="${bean.email}"/>
                                    <span class="err">${erremail}</span>
                                </div>
                            
                                <div class="form-input">
                                    <label class="control-label required" for="zipcode">Zipcode</label>
                                    <div class="col-sm-7">
	                                    <input type="text" name="fakezipcode" id="fakezipcode" disabled="disabled" value="${bean.zipcode}"/>
	                                    <input type="hidden" name="zipcode" id="zipcode" />
                                    </div>
									<div class="button">
										<input type="button" value="우편 번호 찾기" class="btn btn-info" onclick="zipfind();">
									</div>
				      			</div>
                                <div class="form-input">
                                    <label class="required" for="address1">Address1</label>
                                    <input type="text" name="fakeaddress1" id="fakeaddress1" disabled="disabled" value="${bean.address1}"/>
                                    <input type="hidden" name="address1" id="address1" />
                                </div>
                                <div class="form-input">
                                    <label class="required" for="address2">Address2</label>
                                    <input type="text" name="address2" id="address2" value="${bean.address2}"/>
                                </div>
                                
                                 <div class="form-radio">
                                    <div class="label-flex">
                                        <label class="required" for="gender">Gender</label>
                                    </div>
                                    <div class="form-radio-group">
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="man" value="남자" >
                                            <c:if test="${bean.gender == '남자'}">
												checked="${bean.gender}"
											</c:if>
                                            <label for="man">Man</label>
                                            <span class="check"></span>
                                        </div>
                                        <div class="form-radio-item">
                                            <input type="radio" name="gender" id="female" value="여자" >
                                             <c:if test="${bean.gender == '여자'}">
												checked="${bean.gender}"
											</c:if>
                                            <label for="female">Female</label>
                                            <span class="check"></span>
                                        </div>
                                    </div>
                                    <span class="err">${errgender}</span>
                                </div>
                            </div>
                        </div>
                        <div class="form-submit">
                            <input type="submit" value="Signup" class="submit" onclick="return checkForm();"/>
                            <input type="reset" value="Reset" class="submit" name="reset" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
	</div>

	<!-- JS -->
	<script src="<%=contextPath%>/vendor/jquery/jquery.min.js"></script>
	<script src="<%=contextPath%>/vendor/nouislider/nouislider.min.js"></script>
	<script src="<%=contextPath%>/vendor/wnumb/wNumb.js"></script>
	<script src="<%=contextPath%>/vendor/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="<%=contextPath%>/vendor/jquery-validation/dist/additional-methods.min.js"></script>
	<script src="<%=contextPath%>/js/signup.js"></script>
	
</body>
</html>