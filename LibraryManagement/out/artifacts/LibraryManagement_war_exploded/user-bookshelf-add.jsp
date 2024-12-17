<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.rabbit.po.User" %>
<%@ page import="com.rabbit.service.BookShelfService" %>
<%@ page import="com.rabbit.service.impl.BookShelfServiceImpl" %>
<%@ page import="com.rabbit.po.BookShelf" %>
<%@ page import="com.rabbit.po.Book" %>
<%@ page import="com.rabbit.service.BookService" %>
<%@ page import="com.rabbit.service.impl.BookServiceImpl" %>
<%@ page import="com.rabbit.po.Record" %>
<%@ page import="com.rabbit.service.RecordService" %>
<%@ page import="com.rabbit.service.impl.RecordServiceImpl" %>
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
    // 获取userid
    User user =(User)session.getAttribute("user");
    Integer userid = user.getUserid();
    //获取bookid
    Integer bookid = Integer.parseInt(request.getParameter("bookid"));

    // 获取书籍名称
    BookService bookService = new BookServiceImpl();
    Book book = bookService.getBook(bookid);

    // 加入书架
    BookShelf bookShelf = new BookShelf();
    bookShelf.setUserid(userid);
    bookShelf.setBookid(bookid);
    bookShelf.setBookname(book.getBookname());
    bookShelf.setBooklink(null);


    // 新增借阅记录
    Record record = new Record();
    record.setUserid(userid);
    record.setBookid(bookid);
    record.setBookname(book.getBookname());
    record.setBooklink(book.getBooklink());


    // 新增书架记录
    BookShelfService bookShelfService = new BookShelfServiceImpl();
    boolean flag = bookShelfService.addBookShelf(bookShelf);

    // 新增借阅记录
    RecordService recordService = new RecordServiceImpl();
    boolean flag1  = recordService.addRecord(record);

    if (flag && flag1) {
        response.sendRedirect("bookShelf");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
