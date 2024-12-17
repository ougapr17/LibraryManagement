<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath %>" />
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>找回密码</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f2f2f2;
        }

        h1, h2 {
            text-align: center;
        }

        form {
            width: 350px;
            margin: 0 auto;
            margin-top: 100px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        table {
            width: 100%;
            margin-bottom: 20px;
        }

        table tr td {
            padding: 5px;
            border-bottom: 1px solid #ccc;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 8px 16px;
            background-color: #4CAF50;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        a {
            color: #4CAF50;
        }
    </style>
</head>
<body>

    <form action="searchPassword" method="post">
        <h1>找回密码</h1>
        <hr>
        <div>
            <a href="javascript: window.history.go(-1)">返回上一级</a>
        </div>
        <br>
        <%-- 在表单上方添加错误信息提示 --%>
        <% if (request.getAttribute("errorMessage") != null) { %>
        <div style="color: red;">
            <%= "请输入正确的用户名" %>
        </div>
        <% } %>
        <table align="center">
            <tr>
                <td>请输入账号：</td>
                <td><input type="text" name="name"/></td>
            </tr>
            <tr>
                <td colspan="1"></td>
                <td>
                    <input type="submit" value="提交">
                    <input type="reset" value="重置">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
