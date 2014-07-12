<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>jQuery UI Dialog - Modal message</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.11.0/themes/smoothness/jquery-ui.css">
<link href="http://cdn.bootcss.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<style>
 
 </style> 
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://code.jquery.com/ui/1.11.0/jquery-ui.js"></script>
<script>
$(function() {
	$("#username").focus();
	addBlur();
	$("#loginBtn").click(login);
});
	
	function login(){
		if(validate()){
			var username = $("#username").val();
			var password = $("#password").val();
			$.ajax({
				type: "POST",
				url:"http://localhost:8080/mymvc/login",
				data:{username:username,password:password},
				dataType:"json",
				success: function (data) {
					alert(data);
				},
				error: function (XMLHttpRequest, textStatus, errorThrown) {
					alert(textStatus+errorThrown);
				} 
			});
			return true;
		}
		return false;
	}

	function validate(){
		if(checkForm($("#username")) && checkForm($("#password"))){
			return true;
		}
		return false;
	}
	
	function addBlur(){
		$("#username").blur(function(){
			checkForm($(this));
		});
		$("#password").blur(function(){
			checkForm($(this));
		});
	}

	function checkForm(obj){
		if(obj.val() != ''){
			obj.parent().removeClass("has-error");
			obj.parent().addClass("has-success");
			obj.next().text("");
			return true;
		}
		obj.parent().removeClass("has-success");
		obj.parent().addClass("has-error");
		setErrorInfo(obj);
		return false;
	}
	
	function setErrorInfo(obj){
		if(obj.attr("id") == "username"){
			obj.next().text("please input username");
		}else if(obj.attr("id") == "password"){
			obj.next().text("please input password");
		}
	}

</script>
</head>
<body>

<form class="form-horizontal" role="form">
  <div class="form-group">
    <label for="username" class="col-sm-2 control-label">Username</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" id="username" placeholder="Username"/>
	  <label class="usernameError"></label>
    </div>
  </div>
  <div class="form-group">
    <label for="password" class="col-sm-2 control-label">Password</label>
    <div class="col-sm-4">
      <input type="password" class="form-control" id="password" placeholder="Password" />
	  <label class="passwordError"></label>
    </div>
  </div>
  <div class="form-group">
    <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-default col-sm-2" id="loginBtn">Sign in</button>
    </div>
  </div>
</form>
</body>
</html>





