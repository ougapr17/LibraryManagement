<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>新增用户</title>
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

<h1>新增用户</h1>
<hr>

<div id="before">
    <a href="userList">返回上一级</a>
</div>
</br>

<form action="addUser" method="post" name="registerForm">
    <div>
        <tr>
            <label>编号：</label>
            <input type="text" name="userid" id="userid" placeholder="用户编号" autofocus="autofocus">
        </tr>
    </div>
    <div>
        <tr>
            <label>账号：</label>
            <input type="text" name="username" id="username" placeholder="用户名" >
        </tr>
    </div>
    <div>
        <tr>
            <label>密码：</label></td>
            <input type="text" name="password" id="password" placeholder="密码">
        </tr>
    </div>
    <div>
        <tr>
            <label>邮箱：</label>
            <input type="text" name="email" id="email" placeholder="邮箱">
        </tr>
    </div>
    <div>
        <tr>
            <label>电话：</label>
            <input type="text" name="phone" id="phone" placeholder="电话">
        </tr>
    </div>
    <div>
        <tr>
            <label>是否管理员：</label>
            <input type="text" name="isadmin" id="isadmin" placeholder="是否管理员（1是，0否）">
        </tr>
    </div>

    <div id="submitbtn">
        <tr>
            <button type="submit" onclick="return checkForm()">添加</button>
            <button type="reset">重置</button>

        </tr>
    </div>
</form>

<script type="text/javascript">
    function checkForm() {

        <%--<% if (request.getAttribute("errorMessage") != null) { %>--%>
        <%--    alert("用户编号存在，请输入正确的用户编号");--%>
        <%--    registerForm.password.focus();--%>
        <%--    return false;--%>
        <%--<% } %>--%>

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
        alert('添加成功！');
        return true;
    }
</script>

</body>
</html>