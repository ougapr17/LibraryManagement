package com.rabbit.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**

 *拦截用户未登录状态下的操作
 */
public class LoginFilter implements Filter {

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse rep,
			FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		HttpServletRequest request = (HttpServletRequest)req;
		HttpServletResponse response = (HttpServletResponse)rep;
		Object user = request.getSession().getAttribute("user");
		String path = request.getServletPath();
		if(user == null&&path.indexOf("register")<0&&path.indexOf("search")<0&&path.indexOf("login")<0&&path.indexOf("bootstrap")<0&&path.indexOf("images")<0) {
			response.sendRedirect("login.jsp");
		}else {
			chain.doFilter(request, response);
		}


	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}
