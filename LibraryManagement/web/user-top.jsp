<%@ page import="com.rabbit.po.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <style type="text/css">
        #head {
            /*background: #eeeeee;*/
            height: 80px;
        }



        #logout {
            position: absolute;
            font-size: 20px;
            top:40px;
            right: 20px;
        }

        #welcome {
            position: absolute;
            font-size: 20px;
            left: 900px;
            top:40px;
        }
        #sysname{
            position: absolute;
            text-decoration:none;
            font-size: 60px;
            align:left;
            left: 200px;
        }
    </style>
</head>
<body>

<%--头部信息--%>
<%
    User user =(User)session.getAttribute("user");
    String username="";
    if (user!=null){
        username=user.getUsername();
    }
%>
<div id="head">
    <table width="100%">
        <td style="border: 0px"><a href="userBookList" id="sysname">书店管理系统</a></td>
        <td id="welcome" style="border: 0px">欢迎您：<%=username%></td>
        <td id="logout" style="border: 0px">
            <a href="userRecordList">借阅记录</a>
            <a href="bookShelf">我的书架</a>
            <a href="logout.jsp">安全退出</a>
        </td>
    </table>
</div>


</body>
</html>
