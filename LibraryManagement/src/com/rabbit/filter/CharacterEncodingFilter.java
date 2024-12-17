package com.rabbit.filter;

import javax.servlet.*;

import java.io.IOException;

public class CharacterEncodingFilter implements Filter {


    // 对字符进行的何种编码
    protected String encodingName;


    // 默认构造函数
    public CharacterEncodingFilter() {
        encodingName = "UTF-8";

    }


    public void destroy() {
    }

    /**
     * filter的入口方法
     *
     * @param reqeust ServletRequest对象
     * @param resonse ServletResponse对象
     * @param chain FilterChain对象
     * @throws IOException      如果发生 IO 异常
     * @throws ServletException 如果发生 Servlet 异常
     */


    /**
     * 初始化Filter的时候，该方法被调用
     *
     * @param config FilterConfig对象
     * @throws ServletException 如果发生 Servlet 异常
     */
    public void init(FilterConfig config) throws ServletException {

    }
    /**
     * filter的入口方法
     *

     * @param chain FilterChain对象
     * @throws IOException      如果发生 IO 异常
     * @throws ServletException 如果发生 Servlet 异常
     */
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        request.setCharacterEncoding(encodingName);
        chain.doFilter(request, response);
    }


}