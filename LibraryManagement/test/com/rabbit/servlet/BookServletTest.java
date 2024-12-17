package com.rabbit.servlet;

import org.junit.Before;
import org.junit.Test;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import static org.junit.Assert.assertEquals;
import static org.mockito.Mockito.when;

public class BookServletTest {

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
        when(request.getParameter("bookid")).thenReturn("123");
        when(request.getParameter("bookname")).thenReturn("123");
        when(request.getParameter("price")).thenReturn("123");
        when(request.getParameter("author")).thenReturn("123");
        when(request.getParameter("publish")).thenReturn("123");
        when(request.getParameter("categoryid")).thenReturn("123");
        when(request.getParameter("booklink")).thenReturn("http://booklink.com");

        BookAddServlet bookAddServlet = new BookAddServlet();
        bookAddServlet.doPost(request, response);

        int flag = bookAddServlet.getFlag();
        assertEquals(1, flag);

    }


    @Test
    public void updateTest() throws Exception {
        when(request.getParameter("bookid")).thenReturn("123");
        when(request.getParameter("bookname")).thenReturn("1234");
        when(request.getParameter("price")).thenReturn("1234");
        when(request.getParameter("author")).thenReturn("1234");
        when(request.getParameter("publish")).thenReturn("1234");
        when(request.getParameter("categoryid")).thenReturn("1234");
        when(request.getParameter("booklink")).thenReturn("http://booklink.com");

        UpdateBookServlet updateBookServlet = new UpdateBookServlet();
        updateBookServlet.doPost(request, response);

        int flag = updateBookServlet.getFlag();
        assertEquals(1, flag);

    }

    @Test
    public void deleteTest() throws Exception {
        when(request.getParameter("bookid")).thenReturn("123");

        DeleteBookServlet deleteBookServlet = new DeleteBookServlet();
        deleteBookServlet.doPost(request, response);

        int flag = deleteBookServlet.getFlag();
        assertEquals(1, flag);

    }
}