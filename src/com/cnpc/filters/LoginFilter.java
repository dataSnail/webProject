package com.cnpc.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LoginFilter extends HttpServlet implements Filter{
    
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public void destory(){
		
	}
	
	@Override
	public void doFilter(ServletRequest sRequest, ServletResponse sResponse,
			FilterChain sFilterChain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpServletRequest request = (HttpServletRequest) sRequest;
		HttpServletResponse response = (HttpServletResponse) sResponse;
		HttpSession session = request.getSession();
		String url = request.getServletPath();
		String contextPath = request.getContextPath();
		if(url.equals("")) url += "/";
		if((url.startsWith("/") && !url.startsWith("/login")))
		{
			String user = (String) session.getAttribute("username");
			if (user == null)
			{
				response.sendRedirect(contextPath + "/login.jsp");
			}
		}
		sFilterChain.doFilter(sRequest,sResponse);
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub
		
	}
	

}
