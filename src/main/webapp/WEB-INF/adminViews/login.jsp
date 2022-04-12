<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="path" value="${pageContext.request.contextPath}/resources/adminLogin"/>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>admin-Login</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="${path}/images/icons/favicon.ico"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${path}/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/vendor/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="${path}/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="${path}/css/util.css">
	<link rel="stylesheet" type="text/css" href="${path}/css/main.css?ver=1">
<!--===============================================================================================-->
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>

<script type="text/javascript">
$(function() {
	$(document).on('click','.login100-form-btn', function(){	
		var id = $('.input100').eq(0).val();
		var pwd = $('.input100').eq(1).val();
		//alert(id);
		$.ajax({
			url : 'adminLoginCheck.mdo',
			type : 'post',
			data : {
				"admin_id" : id,
				"admin_pwd" : pwd
			},
			success : function(data){
				//data = 1이면 로그인 성공 1이 아니면 로그인 실패
				if(data == 0){
					alert('아이디나 비밀번호가 일치하지 않아요!');
				}else if(data == 1){
					adminLoginForm.submit();
				}
			}
		})
	})
})
</script>
</head>
<body>
	
	<div class="limiter">
		<div class="container-login100">
			<div class="wrap-login100">
				<div class="login100-form-title" style="background-image: url(${path}/images/banneradmin.png);">
					 <!-- <span class="login100-form-title-1">
						Sign In
					</span> --> 
				</div>

				<form class="login100-form validate-form" method="post" action="adminLoginSuccess.mdo" name="adminLoginForm">
					<div class="wrap-input100 validate-input m-b-26" data-validate="Username is required">
						<span class="label-input100">Admin ID</span>
						<input class="input100" type="text" name="admin_id" placeholder="Enter username">
						<span class="focus-input100"></span>
					</div>

					<div class="wrap-input100 validate-input m-b-18" data-validate = "Password is required">
						<span class="label-input100">Password</span>
						<input class="input100" type="password" name="admin_pwd" placeholder="Enter password">
						<span class="focus-input100"></span>
					</div>

					<div class="flex-sb-m w-full p-b-30">
						<div class="contact100-form-checkbox">
							<input class="input-checkbox100" id="ckb1" type="checkbox" name="remember-me">
							<label class="label-checkbox100" for="ckb1">
								Remember me
							</label>
						</div>

						<!-- <div>
							<a href="#" class="txt1">
								Forgot Password?
							</a>
						</div> -->
					</div>

					<div class="container-login100-form-btn">
						<button class="login100-form-btn" type="button" style="margin-left:20%;">
							Login
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	
<!--===============================================================================================-->
	<script src="${path}/vendor/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="${path}/vendor/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="${path}/vendor/bootstrap/js/popper.js"></script>
	<script src="${path}/vendor/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="${path}/vendor/select2/select2.min.js"></script>
<!--===============================================================================================-->
	<script src="${path}/vendor/daterangepicker/moment.min.js"></script>
	<script src="${path}/vendor/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="${path}/vendor/countdowntime/countdowntime.js"></script>
<!--===============================================================================================-->
	<script src="${path}/js/main.js"></script>

</body>
</html>