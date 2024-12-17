package com.rabbit.servlet;

import com.rabbit.po.User;
import com.rabbit.service.UserService;
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
 * @date  22:49
 */
@WebServlet("/searchPassword")
public class SearchPasswordServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user=new User();
        //获取searchPassword.jsp页面提交的账号和密码
        String name=request.getParameter("name");
        //
        if (name == null || name.trim().isEmpty()) {
            request.setAttribute("errorMessage", "请输入正确的用户名");
            request.getRequestDispatcher("search-password.jsp").forward(request, response);
            return;
        }
        user.setUsername(name);

        UserServiceImpl service=new UserServiceImpl();
        List<User> list=service.selectUser(name);
        //
        if (list.isEmpty()) {
            request.setAttribute("errorMessage", "用户编号存在，请输入正确的用户编号");
            request.getRequestDispatcher("search-password.jsp").forward(request, response);
            return;
        }

        request.setAttribute("list", list);
        for(User u:list){
            request.setAttribute("user", u);

        }
        if(user!=null){
            request.getRequestDispatcher("search-password-info.jsp").forward(request, response);
        }
    }
}
