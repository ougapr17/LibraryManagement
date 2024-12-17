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

/**
 * @author
 * @date  22:23
 */
@WebServlet("/deleteUser")
public class DeleteUserServlet extends HttpServlet {

    public int flag = 0;

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

        //获取admin-user-manager.jsp页面的userid
        Integer userid = Integer.parseInt(request.getParameter("userid"));


        //引入数据交互层
        UserService userService = new UserServiceImpl();
        // 获取删除用户的信息
        User user = userService.getUser(userid);

        flag = userService.deleteUser(userid)?1:0;

        if (flag==1) {
            response.sendRedirect("userList");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
