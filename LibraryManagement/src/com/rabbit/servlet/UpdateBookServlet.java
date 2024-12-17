package com.rabbit.servlet;

import com.rabbit.po.Book;
import com.rabbit.service.BookService;
import com.rabbit.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author
 * @date  22:07
 */
@WebServlet("/updateBook")
public class UpdateBookServlet extends HttpServlet {

    public int flag ;

    public int getFlag() {
        return flag;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置获取注册时的编码为UTF-8
        request.setCharacterEncoding("UTF-8");

        //获取admin-add-book.jsp页面提交的账号和密码
        Integer bookid = Integer.parseInt(request.getParameter("bookid"));

        String bookname = request.getParameter("bookname");
        Double price = Double.parseDouble(request.getParameter("price"));
        String author = request.getParameter("author");
        String publish = request.getParameter("publish");
        Integer categoryid = Integer.parseInt(request.getParameter("categoryid"));
        String booklink = request.getParameter("booklink");

        //引入数据交互层
        BookService bookService = new BookServiceImpl();
        Book book = new Book();
        book = bookService.getBook(bookid);

        book.setBookname(bookname);
        book.setPrice(price);
        book.setAuthor(author);
        book.setPublish(publish);
        book.setCategoryid(categoryid);
        book.setBooklink(booklink);


        flag=0;
        flag = bookService.updateBook(book)?1:0;


        if (flag==1) {
            response.sendRedirect("bookList");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
