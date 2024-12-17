package com.rabbit.servlet;

import com.rabbit.po.Book;
import com.rabbit.service.impl.BookServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/userBookList")
public class UserHomeBookListServlet extends HttpServlet {

    public int flag =0;

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
        request.setCharacterEncoding("UTF-8");
        String bookname = request.getParameter("bookname");
        BookServiceImpl service = new BookServiceImpl();
        List<Book> list = service.select(bookname);
        request.setAttribute("list", list);

        flag=0;
        if( list!=null && list.size()>0){
            flag = 1;
        }

        request.getRequestDispatcher("user-home.jsp").forward(request, response);
    }
}