package com.rabbit.servlet;

import com.rabbit.dao.UserDao;
import com.rabbit.dao.impl.UserDaoImpl;
import com.rabbit.po.User;
import com.rabbit.service.UserService;
import com.rabbit.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    public int flag = 0;

    public int getFlag() {
        return flag;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置接收的编码为UTF-8
        response.setContentType("text/html; charset=UTF-8");
        response.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        User user = new User();
        UserDao dao = new UserDaoImpl();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
//        System.out.println(username+"\n\n");

        user.setUsername(username);
        user.setPassword(password);

        // 获取用户登录信息
        User us = dao.login(user);

        // 把数据库里面的User获取出来
        UserService service = new UserServiceImpl();
        List<User> list = service.selectUser(username);
        for (int i = 0; i < list.size(); i++) {
            user = list.get(i);
        }

        // 设置会话
        session.setAttribute("user", user);
        flag = 0;
        // 这里要对us判空处理，1是管理者，0是学生，此处的isadmin必须填写不能为空。
        if (us != null && us.getIsadmin().equals(1)) {
            flag=1;
            response.sendRedirect("admin-home.jsp");
        } else if (us != null && us.getIsadmin().equals(0)) {
            flag=2;
            response.sendRedirect("userBookList");
        } else {
//            response.sendRedirect("login-fail.jsp");
            request.setAttribute("errorMessage", "123");
            request.getRequestDispatcher("login.jsp").forward(request, response);
        }
    }
}