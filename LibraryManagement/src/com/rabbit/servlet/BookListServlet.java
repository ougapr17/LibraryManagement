package com.rabbit.servlet;

import com.rabbit.dao.UserDao;
import com.rabbit.dao.impl.UserDaoImpl;
import com.rabbit.po.Book;
import com.rabbit.po.User;
import com.rabbit.service.UserService;
import com.rabbit.service.impl.BookServiceImpl;
import com.rabbit.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/bookList")
public class BookListServlet extends HttpServlet {

    int flag = 1;

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
        request.getRequestDispatcher("admin-book-list.jsp").forward(request, response);
    }
}