<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
    <%
        // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
        String path = request.getContextPath();
        String basePath = request.getScheme() + "://" + request.getServerName() + ":"
                + request.getServerPort() + path + "/";
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>用户登录</title>
    <style type="text/css">
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f2f2f2;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        h1, h2 {
            text-align: center;
            color: #333;
            margin: 0.5em 0;
        }

        form {
            width: 450px;
            padding: 30px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        table {
            width: 100%;
        }

        table tr td {
            padding: 10px;
            border-bottom: 1px solid #eaeaea;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #4CAF50;
            outline: none;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 10px 20px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #3e8e41;
        }

        a {
            color: #4CAF50;
            text-decoration: none;
            font-size: 16px;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #3e8e41;
            text-decoration: underline;
        }
    </style>

    <script>

        window.onload = function() {
            var errorMessage = '<%= request.getAttribute("errorMessage") != null ? request.getAttribute("errorMessage") : "" %>';
            if (errorMessage) {
                alert("用户名或密码错误");
            }
        };

    </script>

</head>
<body>
    <form action="login" method="post">
        <h1>书店管理系统</h1>
        <h2>用户登录</h2>
        <hr/>
        <table align="center">
            <tr>
                <td style="font-size: 20px">账号：</td>
                <td><input type="text" name="username" id="username" placeholder="请输入您的账号" autofocus="autofocus"></td>
            </tr>
            <tr>
                <td style="font-size: 20px">密码：</td>
                <td><input type="password" name="password" id="password" placeholder="请输入您的密码"></td>

            </tr>
            <tr>
                <td colspan="1">
                </td>
                <td>
                    <input type="submit" value="登录"/>
                    <input type="reset" value="重置"/>
                    <a href="register.jsp" target="_blank">注册</a>
                    <a href="search-password.jsp">找回密码</a>
                </td>
            </tr>
        </table>
    </form>
</body>

</html>
