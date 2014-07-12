<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!doctype html>
<html>
<head>
<title>Login</title>
<script src="http://code.jquery.com/jquery-1.10.2.js"></script>
<script src="http://blog.faultylabs.com/files/md5.js"></script>
<script>
	$(function(){
		$("form").submit(function(){
			//$("#password").val(faultylabs.MD5($("#password").val()));
		});
		
	});
</script>
</head>
<body>
<div id="login-error">${error}</div>
<form method="POST" action="/mymvc/j_spring_security_check" name="f">
<table>
	<tr>
		<td align="right">Username</td>
		<td><input type="text" name="j_username" /></td>
	</tr>
	<tr>
		<td align="right">Password</td>
		<td><input type="password" name="j_password" id="password"/></td>
	</tr>
	<tr>
		<td colspan="2" align="right"><input type="submit" value="Login" />
		<input type="reset" value="Reset" /></td>
	</tr>
</table>
</form>
</body>
</html>
