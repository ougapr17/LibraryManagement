<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.rabbit.po.User" %>
<%@ page import="com.rabbit.service.BookShelfService" %>
<%@ page import="com.rabbit.service.impl.BookShelfServiceImpl" %>
<%@ page import="com.rabbit.po.BookShelf" %>
<%@ page import="com.rabbit.po.Book" %>
<%@ page import="com.rabbit.service.BookService" %>
<%@ page import="com.rabbit.service.impl.BookServiceImpl" %>
<%@ page import="com.rabbit.service.CommentService" %>
<%@ page import="com.rabbit.service.impl.CommentServiceImpl" %>
<%@ page import="com.rabbit.po.Comment" %>
<html>
<head>
    <title>加入书架</title>
    <style type="text/css">

        body {
            background-color: antiquewhite;
        }


    </style>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<%
    // 设置获取注册时的编码为UTF-8
    request.setCharacterEncoding("UTF-8");

    // 获取user信息
    User user =(User)session.getAttribute("user");
    Integer userid = user.getUserid();
    String username = user.getUsername();

    //获取book信息
    Integer bookid = Integer.parseInt(request.getParameter("bookid"));
    BookService bookService = new BookServiceImpl();
    Book book = bookService.getBook(bookid);
    String bookname = book.getBookname();


    String content = request.getParameter("content");

    Comment comment = new Comment();
    comment.setUserid(userid);
    comment.setUsername(username);
    comment.setBookid(bookid);
    comment.setBookname(bookname);
    comment.setComment(content);

    session.setAttribute("bookid",bookid);


    //引入数据交互层
    CommentService commentService = new CommentServiceImpl();

    boolean flag = commentService.addComment(comment);

    if (flag) {
        response.sendRedirect("user-book-info.jsp");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
