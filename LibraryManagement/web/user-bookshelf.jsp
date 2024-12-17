<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.rabbit.po.Book" %>
<%@ page import="com.rabbit.service.impl.BookServiceImpl" %>
<%@ page import="java.util.List" %>
<%@ page import="com.rabbit.service.BookShelfService" %>
<%@ page import="com.rabbit.service.impl.BookShelfServiceImpl" %>
<%@ page import="com.rabbit.po.BookShelf" %>
<%@ page import="com.rabbit.po.User" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>查看图书</title>
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
            background-color:  #5f9ea0;
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
            background-color: #5f9ea0;
            color: #000;
            font-weight: bold;
        }

        tr:nth-child(even) {
            background-color: #fff;
        }

        tr:nth-child(odd) {
            background-color: #fff;
        }

        td a {
            color: #5f9ea0;
        }

        td a:hover {
            color: #000;
        }

    </style>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="user-top.jsp"/>

<%--图书信息--%>

<h1>书架列表</h1>
<hr>
<div id="before">
    <form action="userBookList" method="post">
        请输入书名：<input type="text" name="bookname" placeholder="输入图书名称搜索">
        <input type="submit" value="查询"/>
    </form>
    <a href="user-home.jsp">返回上一级</a>
</div>
<br>
<table align="center" cellspacing="0">
    <tr bgcolor="#5f9ea0" style="font-size: 20px;height:40px;text-align: center">
        <td style="width: 120px">图书编号</td>
        <td style="width: 120px">图书名称</td>
        <td style="width: 120px">加入时间</td>
        <td style="width: 120px">操作书架</td>
    </tr>
    <%
        List<BookShelf> list = (List<BookShelf>) request.getAttribute("list");
        String bg = null;
        for (int i = 0; i < list.size(); i++) {
            BookShelf b = list.get(i);
            if (i % 2 == 0) {
                bg = "pink";
            } else {
                bg = "yellow";
            }

    %>
    <tr bgcolor="<%=bg%>" style="height:40px;text-align: center">

        <td><%=b.getBookid()%>
        </a></td>
        <td><%=b.getBookname()%>
        </td>
        <td><%=b.getAdddate()%>
        </td>

        <td><a href="user-bookshelf-remove.jsp?bookid=<%=b.getBookid() %>">移出书架</a>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
