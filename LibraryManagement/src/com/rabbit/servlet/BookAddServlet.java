package com.rabbit.servlet;

import com.rabbit.po.Book;
import com.rabbit.po.User;
import com.rabbit.service.BookService;
import com.rabbit.service.UserService;
import com.rabbit.service.impl.BookServiceImpl;
import com.rabbit.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author
 * @date  22:01
 */
@WebServlet("/addBook")
public class BookAddServlet extends HttpServlet {

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
        Book book = new Book();
        //获取admin_addbook.jsp页面提交的账号和密码
        String bookid = request.getParameter("bookid");
        String bookname = request.getParameter("bookname");
        Double price = Double.parseDouble(request.getParameter("price"));
        String author = request.getParameter("author");
        String publish = request.getParameter("publish");
        Integer categoryid = Integer.parseInt(request.getParameter("categoryid"));
        String booklink = request.getParameter("booklink");

        //获取admin-add-book.jsp页面提交的账号和密码设置到实体类User中
        book.setBookid(Integer.parseInt(bookid));
        book.setBookname(bookname);
        book.setPrice(price);
        book.setAuthor(author);
        book.setPublish(publish);
        book.setCategoryid(categoryid);
        book.setBooklink(booklink);


        flag=0;
        //引入数据交互层
        BookService bookService = new BookServiceImpl();
        flag = bookService.addBook(book)?1:0;


        if (flag==1) {
            response.sendRedirect("bookList");
        } else {
            response.sendRedirect("bookList");
//            response.sendRedirect("error.jsp");
        }
    }
}
