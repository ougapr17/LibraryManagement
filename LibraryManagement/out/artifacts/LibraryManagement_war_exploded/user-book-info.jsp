<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.rabbit.po.Book" %>
<%@ page import="com.rabbit.po.Comment" %>
<%@ page import="com.rabbit.service.BookService" %>
<%@ page import="com.rabbit.service.CommentService" %>
<%@ page import="com.rabbit.service.impl.BookServiceImpl" %>
<%@ page import="com.rabbit.service.impl.CommentServiceImpl" %>
<%@ page import="java.util.List" %>

<%
    // 获取绝对路径路径 ,开发项目一定要使用绝对路径，不然肯定出错
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":"
            + request.getServerPort() + path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath %>"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>图书详情</title>
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

        fieldset {
            width: 650px;
            margin: 0 auto;
            border: 1px solid #ddd;
            padding: 20px;
            margin-bottom: 20px;
        }

        legend {
            font-weight: bold;
        }
    </style>
</head>
<body>
<%-- 头部 --%>
<jsp:include page="user-top.jsp"/>


<h1>图书详情</h1>
<hr>
<div id="before">
    <a href="user-home.jsp">返回上一级</a>
</div>
<%
    // 获取bookid,添加评论之后跳转没有带参数
    Integer bookid = 0;
    if (request.getParameter("bookid") == null) {
        bookid = (Integer) session.getAttribute("bookid");
    } else {
        bookid = Integer.parseInt(request.getParameter("bookid"));
    }


    BookService bookService = new BookServiceImpl();
    Book book = bookService.getBook(bookid);

    // 获取留言
    CommentService commentService = new CommentServiceImpl();
    List<Comment> list = commentService.selectComment(bookid);

%>
<table align="center" cellpadding="20" cellspacing="20">
    <tr style="font-size: 20px">
        <td>图书编号</td>
        <td>图书名称</td>
        <td>图书价格</td>
        <td>图书作者</td>
        <td>图书出版社</td>
    </tr>
    <tr>
        <td><%=book.getBookid()%>
        </td>
        <td><%=book.getBookname()%>
        </td>
        <td><%=book.getPrice()%>
        </td>
        <td><%=book.getAuthor()%>
        </td>
        <td><%=book.getPublish()%>
        </td>
    </tr>
    <tr>
        <td colspan="3"></td>
        <td></td>
        <td colspan="2"></td>
    </tr>
</table>
<div style="text-align:center; font-size: 30px">
    <a href="user-bookshelf-add.jsp?bookid=<%=book.getBookid()%>">加入书架</a>
    <a href="userBookList">图书列表</a>
</div>
<br>

<div style="text-align:center;">

    <h1>留言板</h1>
    <%
        for (int i = 0; i < list.size(); i++) {
            Comment comment = list.get(i);
    %>

    <fieldset style="width:650px;margin: 0 auto;">
        <legend>留言<%=comment.getCommentid()%>
        </legend>
        <div style="left: 900px">
            用户：<%=comment.getUsername()%>    留言内容:<%=comment.getComment()%>    留言时间：<%=comment.getTime()%>
        </div>
    </fieldset>

    <%
        }
    %>

    <h4 id="content-title">留言板</h4>
    <form action="user-comment-add.jsp?bookid=<%=book.getBookid()%>" method="post" id="content">

        <textarea rows="10" cols="80" name="content"></textarea>
        <br>
        <br>
        <button type="submit">添加</button>
    </form>
</div>
</body>
</html>
