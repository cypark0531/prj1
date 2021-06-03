package com.minihome.home;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.minihome.vo.ProfilesVo;
@WebServlet("/home")
public class HomeController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//		String header = (String) req.getAttribute("header");
		String content = (String) req.getAttribute("content");
//		if(header==null) {
//			header="/header.jsp";
//		}
		//<a href= "${pageContext.request.contextPath }/profile/list?id=${requestScope.id}">test</a>
	
		  		
		if(content==null)	{
			content ="/profile/profilelist(update).jsp";	
			
	}
		
	String cp = req.getContextPath();
	ServletContext application = getServletContext();
	application.setAttribute("cp", cp);
//	req.setAttribute("header", header);
	req.setAttribute("id", "test");
	req.setAttribute("content", content);
	req.getRequestDispatcher("/homepageframe/homeindex.jsp").forward(req, resp);
	//req.getRequestDispatcher("/profile/profilelist(update).jsp").forward(req, resp);
	
	
	}
}
