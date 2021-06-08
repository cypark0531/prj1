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
		boolean flag=false;
		if(cooks!=null){
			for(Cookie c:cooks){
				if(c.getName().equals("minihomeid")) {
					flag=true;
					req.setAttribute("id", c.getValue());
					System.out.println("쿠키 찾음:"+c.getValue());
				}
			}
		}
		if(flag==false)req.setAttribute("id", null);
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
				System.out.println("쿠키 활성화");
				Cookie idcook=new Cookie("minihomeid",id);
				idcook.setPath("/");
				idcook.setMaxAge(60*60*24*30);
				resp.addCookie(idcook);
			}else {
				System.out.println("쿠키 비활성화");
				Cookie idcook=new Cookie("minihomeid","");
				idcook.setPath("/");
				idcook.setMaxAge(0);
				resp.addCookie(idcook);
			}
			resp.sendRedirect("../home");
		}else {
			req.setAttribute("fail", "true");
			req.getRequestDispatcher("/login/login.jsp").forward(req, resp);
		}
	}
}
