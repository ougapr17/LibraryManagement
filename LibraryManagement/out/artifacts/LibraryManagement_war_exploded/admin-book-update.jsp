<%@ page import="com.rabbit.dao.BookDao" %>
<%@ page import="com.rabbit.dao.impl.BookDaoImpl" %>
<%@ page import="com.rabbit.po.Book" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>修改图书</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f9fa;
        }

        h1, h2, h3, h4, h5, h6 {
            margin: 0;
            padding: 0;
            text-align: center;
        }

        #before {
            display: flex;
            justify-content: space-between;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
        }

        #before a {
            color: #fff;
            text-decoration: none;
        }

        form {
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
        }

        form div {
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 5px;
            border: 1px solid #ddd;
            border-radius: 3px;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 8px 16px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #0069d9;
        }

    </style>
</head>
<body>

<%-- 头部 --%>
<jsp:include page="top.jsp"/>

<h1>修改图书</h1>
<hr/>
<div id="before">
    <a href="bookList">返回上一级</a>
</div>
<%
    //获取admin-home.jsp页面的bookid
    Integer bookid = Integer.parseInt(request.getParameter("bookid"));
    BookDao dao = new BookDaoImpl();
    Book book = new Book();
    book = dao.getBook(bookid);
%>
<form action="updateBook" method="post" name="registerForm">
    <div>
        <tr>
            <input type="hidden" name="bookid" id="bookid" value="<%=book.getBookid()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>图书名称：</label>
            <input type="text" name="bookname" id="bookname" value="<%=book.getBookname()%>" autofocus="autofocus">
        </tr>
    </div>
    <div>
        <tr>
            <label>图书价格：</label></td>
            <input type="text" name="price" id="price" value="<%=book.getPrice()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>图书作者：</label>
            <input type="text" name="author" id="author" value="<%=book.getAuthor()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>出版公司：</label>
            <input type="text" name="publish" id="publish" value="<%=book.getPublish()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>类型编号：</label>
            <input type="text" name="categoryid" id="categoryid" value="<%=book.getCategoryid()%>">
        </tr>
    </div>
    <div>
        <tr>
            <label>书籍链接：</label>
            <input type="text" name="booklink" id="booklink" value="<%=book.getBooklink()%>">
        </tr>
    </div>

    <div>
        <tr>
            <button type="submit" onclick="return checkForm()">修改</button>
            <button type="reset">重置</button>
        </tr>
    </div>
</form>

<script type="text/javascript">
    function checkForm() {
        var bookname = registerForm.bookname.value;
        var price = registerForm.price.value;
        var categoryid = registerForm.categoryid.value;
        if (bookname == "" || bookname == null) {
            alert("请输入图书名称");
            registerForm.bookname.focus();
            return false;
        } else if (!( /^\d+$/.test(price))&&!(/^\d+\.\d+$/.test(price))) {
            alert("价格应为数字");
            registerForm.price.focus();
            return false;
        }else if( !( /^\d+$/.test(categoryid))){
            alert("类型编号应为整数");
            registerForm.bookname.focus();
            return false;
        }
        alert('添加成功！');
        return true;
    }
</script>
</body>
</html>