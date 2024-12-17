package com.rabbit.servlet;

import com.rabbit.dao.UserDao;
import com.rabbit.dao.impl.UserDaoImpl;
import com.rabbit.po.Book;
import com.rabbit.po.User;
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
 * @date  21:21
 */
@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置获取注册时的编码为UTF-8
        request.setCharacterEncoding("UTF-8");
        User user=new User();
        //获取register.jsp页面提交的账号和密码
        String name=request.getParameter("name");
        String password=request.getParameter("password");
        String email=request.getParameter("email");
        String phone=request.getParameter("phone");

        //获取register.jsp页面提交的账号和密码设置到实体类User中
        user.setUsername(name);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone(phone);

        //引入数据交互层
        UserDao dao=new UserDaoImpl();
        boolean flag=dao.register(user);

        if(flag){
            response.sendRedirect("login.jsp");
        }else{
            response.sendRedirect("register.jsp");
        }
    }
}
