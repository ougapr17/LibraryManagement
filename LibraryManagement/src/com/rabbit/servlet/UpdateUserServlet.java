package com.rabbit.servlet;

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
import java.io.IOException;
import java.util.List;

/**
 * @author
 * @date  22:34
 */
@WebServlet("/updateUser")
public class UpdateUserServlet extends HttpServlet {

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
        // 设置获取注册时的编码为UTF-8
        request.setCharacterEncoding("UTF-8");

        //获取admin-add-update.jsp页面提交的账号和密码
        Integer userid = Integer.parseInt(request.getParameter("userid"));
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String isadmin = request.getParameter("isadmin");

        User user = new User();
        user.setUserid(userid);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone(phone);
        user.setIsadmin(Integer.parseInt(isadmin));

        //引入数据交互层
        UserService userService = new UserServiceImpl();
        flag = userService.updateUser(user)?1:0;


        if (flag==1) {
            response.sendRedirect("userList");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
