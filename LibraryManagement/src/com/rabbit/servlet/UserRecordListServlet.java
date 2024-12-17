package com.rabbit.servlet;

import com.rabbit.po.Record;
import com.rabbit.po.User;
import com.rabbit.service.RecordService;
import com.rabbit.service.UserService;
import com.rabbit.service.impl.RecordServiceImpl;
import com.rabbit.service.impl.UserServiceImpl;

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
 * @date  23:51
 */
@WebServlet("/userRecordList")
public class UserRecordListServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // 设置获取注册时的编码为UTF-8
        // 获取userid
        HttpSession session = request.getSession();
        User user =(User)session.getAttribute("user");
        Integer userid = user.getUserid();

        // 获取该用户的书单
        RecordService recordService = new RecordServiceImpl();
        List<Record> list = recordService.selectRecord(userid);
        request.setAttribute("list", list);
        request.getRequestDispatcher("user-record.jsp").forward(request, response);
    }
}
