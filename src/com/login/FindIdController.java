package com.login;
 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.minihome.dao.MembersDao;
import com.minihome.vo.MembersVO;
@WebServlet("/login/findid")
public class FindIdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/login/findid.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		MembersVO vo=new MembersVO();
		vo.setName(name);
		vo.setEmail(email);
		vo.setPhone(phone);
		
		MembersDao dao=MembersDao.getIntstance();
		String id=dao.findId(vo);		

		req.setAttribute("id", id);
		req.getRequestDispatcher("/login/findidresult.jsp").forward(req, resp);
		
			
	}
}
