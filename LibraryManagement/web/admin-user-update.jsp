<%@ page import="com.rabbit.po.User" %>
<%@ page import="com.rabbit.service.UserService" %>
<%@ page import="com.rabbit.service.impl.UserServiceImpl" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改用户</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        h1, h2, h3, h4, h5, h6 {
            margin: 0;
            padding: 0;
            text-align: center;
        }

        #before {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
        }

        #before a {
            color: #fff;
            text-decoration: none;
        }

        form {
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        form div {
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #0069d9;
        }

    </style>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<h1>修改用户</h1>
<hr/>
<div id="before">
    <a href="userList">返回上一级</a>
</div>
<%
    //获取admin-userBookList页面的userid
    Integer userid = Integer.parseInt(request.getParameter("userid"));
    UserService userService = new UserServiceImpl();
    User user = userService.getUser(userid);
%>
<form action="updateUser" method="post" name="registerForm">
    <div>
        <tr>
            <label>编号：</label>
            <input type="text" name="userid" id="userid" readonly="readonly" value="<%=user.getUserid()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>用户：</label>
            <input type="text" name="username" id="username" readonly="readonly" value="<%=user.getUsername()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>密码：</label>
            <input type="text" name="password" id="password" value="<%=user.getPassword()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>邮箱：</label>
            <input type="text" name="email" id="email" value="<%=user.getEmail()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>电话：</label>
            <input type="text" name="phone" id="phone" value="<%=user.getPhone()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>是否管理员：</label>
            <input type="text" name="isadmin" id="isadmin" value="<%=user.getIsadmin()%>">
        </tr>
    </div>



    <div>
        <tr>
            <button type="submit" onclick="return checkForm()">修改</button>
            <button type="reset">重置</button>
        </tr>
    </div>
</form>

<script type="text/javascript">
    function checkForm() {
        var userid = registerForm.userid.value
        var username = registerForm.username.value;
        var password = registerForm.password.value;
        var isadmin = registerForm.isadmin.value;
        if( !(/^\d+$/.test(userid))){
            alert("用户编号应为整数");
            registerForm.password.focus();
            return false;
        }else if (username == "" || username == null) {
            alert("请输入用户名");
            registerForm.username.focus();
            return false;
        } else if (password == "" || password == null) {
            alert("请输入密码");
            registerForm.password.focus();
            return false;
        }else if( isadmin!="0"&&isadmin!="1"){
            alert("是否管理员应为0或者1");
            registerForm.password.focus();
            return false;
        }
        alert('修改成功！');
        return true;
    }
</script>

</body>
</html>