package com.rabbit.servlet;

import com.rabbit.po.Record;
import com.rabbit.po.User;
import com.rabbit.service.RecordService;
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
 * @date  23:09
 */
@WebServlet("/deleteRecord")
public class RecordDeleteServlet extends HttpServlet {

    int flag = 0;

    public int getFlag(){
        return flag;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 设置获取注册时的编码为UTF-8
        request.setCharacterEncoding("UTF-8");

        //获取admin-user-manager.jsp页面的userid
        Integer borrowid = Integer.parseInt(request.getParameter("borrowid"));


        //引入数据交互层
        RecordService recordService = new RecordServiceImpl();
        flag = recordService.deleteRecord(borrowid)?1:0;

        if (flag==1) {
            response.sendRedirect("recordList");
        } else {
            response.sendRedirect("error.jsp");
        }
    }
}
