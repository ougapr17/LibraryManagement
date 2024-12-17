package com.rabbit.servlet;

import com.rabbit.po.Book;
import com.rabbit.po.User;
import com.rabbit.service.UserService;
import com.rabbit.service.impl.BookServiceImpl;
import com.rabbit.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebListener;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * @author
 * @date  22:29
 */
@WebServlet("/userList")
public class UserListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置获取注册时的编码为UTF-8
        request.setCharacterEncoding("UTF-8");
        // 获取上一个页面传过来的值
        String username = request.getParameter("username");


        // 传入的空字符串处理,null不能使用equals
        if (username != null && username.equals("")) {
            username = null;
        }

        UserService userService = new UserServiceImpl();
        List<User> list = userService.selectUser(username);
        request.setAttribute("list", list);
        request.getRequestDispatcher("admin-user-list.jsp").forward(request, response);
    }
}