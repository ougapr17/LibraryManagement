package com.rabbit.servlet;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

public class UserServletTest {

    @Mock
    private HttpServletRequest request;

    @Mock
    private HttpServletResponse response;

    @Before
    public void setUp() throws Exception {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    public void addTest() throws Exception {
        when(request.getParameter("userid")).thenReturn("123");
        when(request.getParameter("username")).thenReturn("123");
        when(request.getParameter("password")).thenReturn("123");
        when(request.getParameter("email")).thenReturn("123");
        when(request.getParameter("phone")).thenReturn("123");
        when(request.getParameter("isadmin")).thenReturn("1");

        UserAddServlet userAddServlet = new UserAddServlet();

        userAddServlet.doPost(request, response);
        int flag = userAddServlet.getFlag();
        assertEquals(1, flag);

    }

    @Test
    public void addWrongTest() throws Exception {
        when(request.getParameter("userid")).thenReturn("123");
        when(request.getParameter("username")).thenReturn("123");
        when(request.getParameter("password")).thenReturn("123");
        when(request.getParameter("email")).thenReturn("123");
        when(request.getParameter("phone")).thenReturn("123");
        when(request.getParameter("isadmin")).thenReturn("1");

        UserAddServlet userAddServlet = new UserAddServlet();

        userAddServlet.doPost(request, response);
        int flag = userAddServlet.getFlag();
        assertEquals(0, flag);

    }

    @Test
    public void updateTest() throws Exception {
        when(request.getParameter("userid")).thenReturn("123");
        when(request.getParameter("username")).thenReturn("123");
        when(request.getParameter("password")).thenReturn("1234");
        when(request.getParameter("email")).thenReturn("1234");
        when(request.getParameter("phone")).thenReturn("1234");
        when(request.getParameter("isadmin")).thenReturn("0");


        UpdateUserServlet updateUserServlet = new UpdateUserServlet();
        updateUserServlet.doPost(request, response);

        int flag = updateUserServlet.getFlag();
        assertEquals(1, flag);

    }

    @Test
    public void deleteTest() throws Exception {
        when(request.getParameter("userid")).thenReturn("123");

        DeleteUserServlet deleteUserServlet = new DeleteUserServlet();
        deleteUserServlet.doPost(request, response);

        int flag = deleteUserServlet.getFlag();
        assertEquals(1, flag);

    }

}