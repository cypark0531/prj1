package com.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
@WebFilter("/*")
public class EncodingFilter implements Filter{
	String encoding;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {

		encoding=filterConfig.getInitParameter("encoding");
	}
	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {		
		if(encoding!=null) {
			request.setCharacterEncoding(encoding);
		}else {
			request.setCharacterEncoding("utf-8");
		}
		chain.doFilter(request, response);
		
	}
}
