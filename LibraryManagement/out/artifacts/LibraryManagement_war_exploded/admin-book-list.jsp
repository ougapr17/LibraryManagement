<%@ page import="com.rabbit.po.Book" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
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
            /*background-color:  #5f9ea0;*/
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
            /*background-color: #5f9ea0;*/
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
            /*color: #5f9ea0;*/
        }

        td a:hover {
            color: #000;
        }

    </style>
</head>

<body>

<jsp:include page="top.jsp"/>


<br>
<table align="center" cellspacing="0" align="center">
    <%-- 图书信息 --%>
    <h1>图书列表</h1>
    <hr>
    <div id="before">
        <form action="bookList" method="post">
            请输入书名：<input type="text" name="bookname" placeholder="输入图书名称搜索">
            <input type="submit" value="查询"/>
        </form>
        <br/>
        <div style="margin-top: 10px">
            <a href="admin-home.jsp">返回上一级</a>
            <a href="admin-book-add.jsp">新增图书</a>
        </div>

    </div>

    </div>
    <tr bgcolor="#5f9ea0" style="font-size: 20px;height:40px;text-align: center">
        <th style="width: 120px">编号</th>
        <th style="width: 120px">书名</th>
        <th style="width: 120px">价格</th>
        <th style="width: 120px">作者</th>
        <th style="width: 120px">出版社</th>
        <th style="width: 120px">类型编号</th>
        <th style="width: 120px">书籍链接</th>
        <th style="width: 120px">添加日期</th>
        <th style="width: 120px">操作图书</th>
    </tr>
    <%
        List<Book> list = (List<Book>) request.getAttribute("list");
        String bg = null;
        for (int i = 0; i < list.size(); i++) {
            Book b = list.get(i);
            if (i % 2 == 0) {
                bg = "#c6c1c1";
            } else {
                bg = "C6C1C1";
            }

    %>
    <tr bgcolor="<%=bg%>" style="width: 120px;height: 40px;text-align: center">
        <td><%=b.getBookid()%>
        </td>
        <td><a href="admin-book-info.jsp?bookid=<%=b.getBookid()%>"><%=b.getBookname()%>
        </a></td>
        <td><%=b.getPrice() %>
        </td>
        <td><%=b.getAuthor() %>
        </td>
        <td><%=b.getPublish() %>
        </td>
        <td><%=b.getCategoryid() %>
        </td>
        <td><%=b.getBooklink() %>
        </td>
        <td><%=b.getDeadline() %>
        </td>
        <td>
            <a href="admin-book-update.jsp?bookid=<%=b.getBookid()%>">修改</a>
            <a href="deleteBook?bookid=<%=b.getBookid()%>">删除</a>
        </td>
    </tr>
    <%
        }
    %>
</table>


</body>
</html>