package com.login;
 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.MembersDao;
@WebServlet("/login/login")
public class LoginController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		Cookie[] cooks=req.getCookies();
		if(cooks!=null){
			for(Cookie c:cooks){
				if(c.getName().equals("minihomeid")) {
					req.setAttribute("id", c.getValue());
				}
			}
		}
		req.getRequestDispatcher("/login/login.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String box=req.getParameter("box");
		MembersDao dao=MembersDao.getIntstance();
		if(dao.login(id, pwd)) {
			req.getSession().setAttribute("id", id);
			if(box!=null) {
				Cookie idcook=new Cookie("minihomeid",id);
				idcook.setPath("/");
				idcook.setMaxAge(60*60*24*30);
				resp.addCookie(idcook);
			}else {
				Cookie idcook=new Cookie("minihomeid","");
				idcook.setPath("/");
				idcook.setMaxAge(0);
				resp.addCookie(idcook);
			}
			resp.sendRedirect("");
		}else {
			req.setAttribute("fail", "true");
			req.getRequestDispatcher("/login/login").forward(req, resp);
		}
	}
}
