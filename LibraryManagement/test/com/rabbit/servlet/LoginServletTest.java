package com.rabbit.servlet;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.*;

public class LoginServletTest {

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Mock
    private HttpSession session;

    @Mock
    private RequestDispatcher requestDispatcher;

    private LoginServlet loginServlet;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
        loginServlet = new LoginServlet();
        when(request.getSession()).thenReturn(session);
        when(request.getRequestDispatcher(anyString())).thenReturn(requestDispatcher);
    }

    @Test
    public void testDoPost_Admin() throws ServletException, IOException {
        when(request.getParameter("username")).thenReturn("admin"); // 直接返回参数值
        when(request.getParameter("password")).thenReturn("admin"); // 直接返回参数值
        loginServlet.doPost(request, response);

        int flag = loginServlet.getFlag();
        assertEquals(1, flag);
    }

    @Test
    public void testDoPost_User() throws ServletException, IOException {
        when(request.getParameter("username")).thenReturn("123456"); // 直接返回参数值
        when(request.getParameter("password")).thenReturn("123456"); // 直接返回参数值
        loginServlet.doPost(request, response);

        int flag = loginServlet.getFlag();
        assertEquals(2, flag);
    }

    @Test
    public void testDoPost_Failure() throws ServletException, IOException {
        when(request.getParameter("username")).thenReturn(""); // 直接返回参数值
        when(request.getParameter("password")).thenReturn(""); // 直接返回参数值
        loginServlet.doPost(request, response);

        int flag = loginServlet.getFlag();
        assertEquals(0, flag);
    }

}