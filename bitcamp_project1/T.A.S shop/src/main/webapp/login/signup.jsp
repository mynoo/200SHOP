<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>Sign Up</title>
	
	<!-- Font Icon -->
	<link rel="stylesheet"
		href="../fonts/material-icon/css/material-design-iconic-font.min.css">
	<link rel="stylesheet" href="../vendor/nouislider/nouislider.min.css">
	
	<!-- Main css -->
	<link rel="stylesheet" href="../css/css/style.css">
	
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
						<h2>Register now</h2>
						<p>while seats are available !</p>
					</div>
				</div>
				<div class="signup-form">
					<form method="POST" class="register-form" id="register-form">
						<div class="form-row">
							<div class="form-group">
								<div class="form-input">
									<label for="name" class="required">Id</label> <input
										type="text" name="id" id="id" /> <input type="button"
										value="Id Check" class="btn btn-primary" id="button"
										name="button" />
								</div>
								<div class="form-input">
									<label for="name" class="required">Name</label> <input
										type="text" name="name" id="name" />
								</div>
								<div class="form-input">
									<label for="password" class="required">Password</label> <input
										type="text" name="password" id="password" />
								</div>
								<div class="form-input">
									<label for="confpassword" class="required">Confirm
										Password</label> <input type="text" name="confpassword"
										id="confpassword" />
								</div>
								<div class="form-input">
									<label for="birth" class="required">Birth</label> <input
										type="date" name="birth" id="birth" />
								</div>
								<div class="form-input">
									<label for="email" class="required">Email</label> <input
										type="text" name="email" id="email" />
								</div>
								<div class="form-input">
									<label for="phone_number" class="required">Phone number</label>
									<input type="text" name="phone_number" id="phone_number" />
								</div>
							</div>
							<div class="form-group">

								<div class="form-input">
									<label for="name" class="required">Name</label> <input
										type="text" name="name" id="name" />
								</div>

								<div class="form-input">
									<label class="control-label col-sm-3" for="zipcode">Zipcode</label>
									<div class="col-sm-7">
										<input type="text" name="fakezipcode" id="fakezipcode"
											disabled="disabled" /> <input type="text" name="zipcode"
											id="zipcode" />
									</div>
									<div class="col-sm-2">
										<input type="button" value="우편 번호 찾기" class="btn btn-info"
											onclick="zipfind();">
									</div>
								</div>
								<div class="form-input">
									<label for="address1">Address1</label> <input type="text"
										name="fakeaddress1" id="fakeaddress1" disabled="disabled" /> <input
										type="text" name="address1" id="address1" />
								</div>
								<div class="form-input">
									<label for="address2">Address2</label> <input type="text"
										name="address2" id="address2" />
								</div>

								<div class="form-radio">
									<div class="label-flex">
										<label for="gender">Gender</label>
									</div>
									<div class="form-radio-group">
										<div class="form-radio-item">
											<input type="radio" name="gender" id="man" value="남자">
											<label for="man">Man</label> <span class="check"></span>
										</div>
										<div class="form-radio-item">
											<input type="radio" name="gender" id="female" value="여자">
											<label for="female">Female</label> <span class="check"></span>
										</div>
									</div>
								</div>

							</div>
						</div>
						<div class="form-submit">
							<input type="submit" value="Signup" class="submit" id="submit"
								name="submit" /> <input type="reset" value="Reset"
								class="submit" id="reset" name="reset" />
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<!-- JS -->
	<script src="../vendor/jquery/jquery.min.js"></script>
	<script src="../vendor/nouislider/nouislider.min.js"></script>
	<script src="../vendor/wnumb/wNumb.js"></script>
	<script src="../vendor/jquery-validation/dist/jquery.validate.min.js"></script>
	<script src="../vendor/jquery-validation/dist/additional-methods.min.js"></script>
	<script src="../js/signup.js"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>