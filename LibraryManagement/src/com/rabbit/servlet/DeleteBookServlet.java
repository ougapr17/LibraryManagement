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
 * @date  22:23
 */
@WebServlet("/deleteBook")
public class DeleteBookServlet extends HttpServlet {

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

        //获取admin.jsp页面的bookid
        Integer bookid = Integer.parseInt(request.getParameter("bookid"));


        //引入数据交互层
        BookService bookService = new BookServiceImpl();

        flag=0;
        flag = bookService.deleteBook(bookid)?1:0;

        if (flag==1) {
            response.sendRedirect("bookList");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
