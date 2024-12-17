<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.rabbit.po.Book" %>
<%@ page import="com.rabbit.service.impl.BookServiceImpl" %>
<%@ page import="java.util.List" %>
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
<%

    // 获取上一个页面传过来的值
    String bookname = request.getParameter("bookname");

    System.out.println("书名:" + bookname);
    // 传入的空字符串处理,null不能使用equals
    if (bookname != null && bookname.equals("")) {
        bookname = null;
    }

    BookServiceImpl service = new BookServiceImpl();
    List<Book> list = service.select(bookname);
%>
<h1>图书列表</h1>
<hr>
<div id="before">
    <form action="userBookList" method="post">
        请输入书名：<input type="text" name="bookname" placeholder="输入图书名称搜索">
        <input type="submit" value="查询"/>
    </form>

</div>
<br>
<table align="center" cellspacing="0">
    <tr bgcolor="#5f9ea0" style="font-size: 20px;height:40px;text-align: center">
        <td style="width: 120px">编号</td>
        <td style="width: 120px">书名</td>
        <td style="width: 120px">价格</td>
        <td style="width: 120px">作者</td>
        <td style="width: 120px">出版社</td>
    </tr>
    <%
        String bg = null;
        for (int i = 0; i < list.size(); i++) {
            Book b = list.get(i);
            if (i % 2 == 0) {
                bg = "pink";
            } else {
                bg = "yellow";
            }

    %>
    <tr bgcolor="<%=bg%>" style="height:40px;text-align: center">
        <td><%=b.getBookid()%>
        </td>
        <td><a href="user-book-info.jsp?bookid=<%=b.getBookid()%>"><%=b.getBookname()%>
        </a></td>
        <td><%=b.getPrice() %>
        </td>
        <td><%=b.getAuthor() %>
        </td>
        <td><%=b.getPublish() %>
        </td>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
