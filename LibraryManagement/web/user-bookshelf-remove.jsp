<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ page import="com.rabbit.po.User" %>
<%@ page import="com.rabbit.service.BookShelfService" %>
<%@ page import="com.rabbit.service.impl.BookShelfServiceImpl" %>
<html>
<head>
    <title>移出书架</title>
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


    //引入数据交互层
    BookShelfService bookShelfService = new BookShelfServiceImpl();

    boolean flag = bookShelfService.removeBookShelf(userid,bookid);

    if (flag) {
        response.sendRedirect("bookShelf");
    } else {
        response.sendRedirect("error.jsp");
    }
%>
</body>
</html>
