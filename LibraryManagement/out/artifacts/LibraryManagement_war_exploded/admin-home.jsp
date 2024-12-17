<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>管理员主页</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            color: #333;
            font-size: 2em;
            margin-top: 20px;
        }

        hr {
            border: none;
            border-top: 1px solid #ccc;
            margin: 20px 0;
        }

        h4 {
            color: #333;
            font-size: 1.2em;
            margin-bottom: 10px;
        }

        #op a {
            display: inline-block;
            background-color: #007bff;
            color: #fff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            margin-right: 10px;
        }

        #op a:hover {
            background-color: #0056b3;
        }


    </style>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="top.jsp"/>
<h1>欢迎来到书店管理系统</h1>

<hr>
<div id="op" style="text-align: center">
    <h3>管理员操作</h3>

    <a href="userList">管理用户</a>

    <a href="bookList">管理图书</a>
</div>




</body>
</html>
