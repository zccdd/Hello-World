<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<title>登录</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link rel="stylesheet" href="/login/css/style.css" />
</head>
<body>

<div class="login-container">
	<h1>Hi dd ,I'm zcc</h1>
	
	<div class="connect">
		<p>Nice to meet you!</p>
	</div>
	
	<form action="/login2" method="post" id="loginForm">
		<div>
			<input type="text" name="userName" class="username" placeholder="用户名" autocomplete="off"/>
		</div>
		<div>
			<input type="password" name="passWord" class="password" placeholder="密码" oncontextmenu="return false" onpaste="return false" />
		</div>
		<button id="submit" type="submit">登 录</button>
	</form>
</div>
<a href="http://beian.miit.gov.cn/" target="_blank" style="
	    color: white;
    text-decoration: none;
    position: fixed;
    bottom: 0;
    width: 100%;
    display: block;
">京ICP备2021035896号</a>

<script src="/login/js/jquery.min.js"></script>
<script src="/login/js/common.js"></script>
<!--背景图片自动更换-->
<script src="/login/js/supersized.3.2.7.min.js"></script>
<script src="/login/js/supersized-init.js"></script>
<!--表单验证-->
<script src="/login/js/jquery.validate.min.js?var1.14.0"></script>

</body>
</html>
