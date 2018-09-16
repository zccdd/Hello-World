<%--
  Created by IntelliJ IDEA.
  User: dell
  Date: 2018/5/13
  Time: 18:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>注册</title>
</head>
<body>
    <form action="/adduser" method="post">
        昵称：<input name="userName" /><br/>
        密码：<input name="passWord" type="password"/><br/>
        年龄：<input name="age" /><br/>
        性别：男<input type="radio" name="sex" value="1" /> 女<input type="radio" name="sex" value="0" /><br/>
        <input type="submit" value="注册" />
    </form>
</body>
</html>
