package com.rabbit.servlet;

import com.rabbit.po.Book;
import com.rabbit.po.User;
import com.rabbit.service.BookService;
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

/**
 * @author
 * @date  22:32
 */
@WebServlet("/addUser")
public class UserAddServlet extends HttpServlet {

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
        User user = new User();
        //获取admin-user-add.jsp页面提交的账号和密码
        String userid = request.getParameter("userid");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String isadmin = request.getParameter("isadmin");

        //获取admin-user-add.jsp页面提交的账号和密码设置到实体类User中
        user.setUserid(Integer.valueOf(userid));
        user.setUsername(username);
        user.setPassword(password);
        user.setEmail(email);
        user.setPhone(phone);
        user.setIsadmin(Integer.parseInt(isadmin));




//        //引入数据交互层
//        UserService userService = new UserServiceImpl();
//        flag = userService.addUser(user)?1:0;
//
//
//        if (flag==1) {
//            response.sendRedirect("userList");
//        } else {
//            response.sendRedirect("userList");
////            response.sendRedirect("error.jsp");
//        }

        //引入数据交互层
        UserService userService = new UserServiceImpl();

//        //检查
//        User existingUser = userService.getUser(user.getUserid());
//        if (existingUser != null) {
//            request.setAttribute("message", "123");
//            request.getRequestDispatcher("admin-user-add.jsp").forward(request, response);
//            //  return;
//        }
////        else{
////            request.setAttribute("message", "456");
////            request.getRequestDispatcher("admin-user-add.jsp").forward(request, response);
////        }

        flag = userService.addUser(user)?1:0;


        if (flag==1) {
            response.sendRedirect("userList");
        } else {
            response.sendRedirect("userList");
//            response.sendRedirect("error.jsp");
        }
    }
}
