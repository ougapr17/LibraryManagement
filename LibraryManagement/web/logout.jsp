<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>退出登录</title>
</head>
<body>
    <%
        // 杀掉会话
        session.invalidate();
        // 重定向，地址栏的链接会发生改变
        response.sendRedirect("login.jsp");
    %>
</body>
</html>
