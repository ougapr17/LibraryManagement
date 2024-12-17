package com.rabbit.servlet;

import com.rabbit.po.BookShelf;
import com.rabbit.po.Record;
import com.rabbit.po.User;
import com.rabbit.service.BookShelfService;
import com.rabbit.service.RecordService;
import com.rabbit.service.impl.BookShelfServiceImpl;
import com.rabbit.service.impl.RecordServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * @author
 * @date  23:56
 */
@WebServlet("/bookShelf")
public class UserShelfServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        // 获取userid
        User user =(User)session.getAttribute("user");
        Integer userid = user.getUserid();

        // 获取该用户的书单
        BookShelfService bookShelfService = new BookShelfServiceImpl();
        List<BookShelf> list = bookShelfService.selectBookShelf(userid);
        request.setAttribute("list", list);
        request.getRequestDispatcher("user-bookshelf.jsp").forward(request, response);
    }
}
