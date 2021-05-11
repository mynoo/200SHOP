<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../common/common.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>My profile</title>
	
	<!-- Font Icon -->
	<link rel="stylesheet"
		href="<%=contextPath%>/fonts/material-icon/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="<%=contextPath%>/vendor/nouislider/nouislider.min.css">
	
	<!-- Main css -->
	<link rel="stylesheet" href="<%=contextPath%>/css/css/style.css">
	
	<style type="text/css">
	#button1 {
		border-top-left-radius: 5px;
		border-bottom-left-radius: 5px;
		margin-right: -4px;
		border: 1px solid skyblue;
	}
	</style>

</head>

<body>
	<div class="main">
		<div class="container">
			<div class="signup-content">
				<div class="signup-img">
					<img src="../images/solid.png" alt="">
					
					<div class="signup-img-content">
					 <img src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" class="avatar img-circle img-thumbnail rounded-circle" alt="avatar"><br><br>
						<h2>My profile</h2>
						<p>while seats are available !</p>
					</div>
				</div>
				<div class="signup-form">
					<form method="post" class="register-form" id="register-form" name="myform" action="<%=YesForm%>">
					<input type="hidden" name="command" value="meInsert" >
						<div class="form-row">
							<div class="form-group">
								<div class="form-input">
									<label for="name" class="required">Id</label>
									<input type="text" name="id" id="id" value="${loginfo.id}" disabled="disabled" />
								</div>
								<div class="form-input">
									<label for="password" class="required">Password</label>
									<input type="text" name="password" id="password" value="${loginfo.password}"/>
								</div>
								<div class="form-input">
									<label for="birth" class="required">Birth</label>
									<input type="date" name="birth" id="birth" value="${loginfo.birth}" disabled="disabled"/>
								</div>
								<div class="form-input">
									<label for="email" class="required">Email</label>
									<input type="text" name="email" id="email"  value="${loginfo.email}" />
								</div>
								<div class="form-input">
									<label for="phone_number" class="required">Phone number</label>
									<input type="text" name="phone_number" id="phone_number"  value="${loginfo.phonenumber}" />
								</div>
							</div>
							<div class="form-group">

								<div class="form-input">
									<label for="name" class="required">Name</label>
									<input type="text" name="name" id="name" value="${loginfo.name}" disabled="disabled"/>
								</div>

								<div class="form-input">
									<label class="control-label col-sm-3" for="zipcode">Zipcode</label>
									<div class="col-sm-7">
										<input type="text" name="fakezipcode" id="fakezipcode" disabled="disabled" />
										<input type="text" name="zipcode" id="zipcode" value="${loginfo.zipcode}" />
									</div>
									<div class="col-sm-2">
										<input type="button" value="우편 번호 찾기" class="btn btn-info"
											onclick="zipfind();" >
									</div>
								</div>
								<div class="form-input">
									<label for="address1">Address1</label> 
									<input type="text" name="fakeaddress1" id="fakeaddress1" disabled="disabled" />
										<input type="text" name="address1" id="address1" value="${loginfo.address1}" />
								</div>
								<div class="form-input">
									<label for="address2">Address2</label> 
									<input type="text" name="address2" id="address2" value="${loginfo.address2}" />
								</div>

								<div class="form-radio">
									<div class="label-flex">
										<label for="gender">Gender</label>
									</div>
									<div class="form-radio-group">
										<div class="form-radio-item">
											<input type="radio" name="gender" id="man" value="남자" 
											<c:if test="${loginfo.gender == '남자'}">
												checked="${loginfo.gender}"
											</c:if>
											>
											<label for="man">Man</label>
											<span class="check"></span>
										</div>
										<div class="form-radio-item">
											<input type="radio" name="gender" id="female" value="여자" 
											<c:if test="${loginfo.gender == '여자'}">
												checked="${loginfo.gender}"
											</c:if>
											>
											<label for="female">Female</label>
											<span class="check"></span>
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="form-submit">
							<input type="button" value="Modify" class="submit" id="submit" name="submit" />
							<input type="button" value="Home" class="submit" name="home" onclick="location='<%=Noform%>main'" />
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