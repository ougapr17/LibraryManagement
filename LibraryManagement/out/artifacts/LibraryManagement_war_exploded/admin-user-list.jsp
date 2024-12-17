<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.rabbit.po.Book" %>
<%@ page import="com.rabbit.po.User" %>
<%@ page import="com.rabbit.service.UserService" %>
<%@ page import="com.rabbit.service.impl.UserServiceImpl" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查看用户</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        h1, h2, h3, h4, h5, h6 {
            text-align: center;
            margin: 0;
            padding: 0;
        }

        p {
            margin: 0;
            padding: 0;
        }

        #before {
            width: 100%;
            padding: 20px;
            background-color: #fff;
            color: #000;
            text-align: center;
            font-size: 25px;
        }

        #before a {
            color: #000;
        }
        input[type="text"],
        input[type="password"] {
            width: 280px;
            padding: 5px;
            font-size: 25px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 8px 16px;
            font-size: 20px;

            color: #000;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        #before a:hover {
            color: #000;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table, th, td {
            border: 1px solid #ddd;
            padding: 15px;
            text-align: left;
        }

        th {

            color: #000;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #fff;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }



        td a:hover {
            color: #000;
        }

    </style>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<h1>用户列表</h1>
<hr>
<div id="before">
    <form action="userList" method="post">
        请输入用户名：<input type="text" name="username" placeholder="输入用户名搜索">
        <input type="submit" value="查询"/>
    </form>
    <div style="margin-top: 10px">
        <a href="admin-home.jsp">返回上一级</a>
        <a href="admin-user-add.jsp">新增用户</a>
    </div>
</div>
<br>
<table align="center" cellspacing="0">
    <tr bgcolor="#5f9ea0" style="font-size: 20px;height:40px;text-align: center">
        <th style="width: 120px">编号</th>
        <th style="width: 120px">用户名</th>
        <th style="width: 120px">密码</th>
        <th style="width: 120px">邮箱</th>
        <th style="width: 120px">电话</th>
        <th style="width: 120px">是否管理员</th>
        <th style="width: 120px">操作用户</th>
    </tr>
    <%
        List<User> list = (List<User>) request.getAttribute("list");
        String bg = null;
        for (int i = 0; i < list.size(); i++) {
            User u = list.get(i);
            if (i % 2 == 0) {
                bg = "pink";
            } else {
                bg = "yellow";
            }

    %>
    <tr bgcolor="<%=bg%>" style="width: 120px;height: 40px;text-align: center">
        <td><%=u.getUserid()%>
        </td>
        <td><%=u.getUsername()%>
        </td>
        <td><%=u.getPassword()%>
        </td>
        <td><%=u.getEmail()%>
        </td>
        <td><%=u.getPhone() %>
        </td>
        <td><%=u.getIsadmin() %>
        </td>
        <td>
            <a href="admin-user-update.jsp?userid=<%=u.getUserid()%>">修改</a>
            <a href="deleteUser?userid=<%=u.getUserid()%>">删除</a>
        </td>
    </tr>
    <%
        }
    %>

</table>

</body>
</html>
