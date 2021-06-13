package com.minihome.updatemember;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.MembersDao;
@WebServlet("/updatemember/updatepwd")
public class UpdatePwdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=(String)req.getSession().getAttribute("gid");
		MembersDao dao=MembersDao.getIntstance();
		String pwd=dao.getMember(id).getPwd();
		req.setAttribute("pwd", pwd);
		req.getRequestDispatcher("/updatemember/updatepwd.jsp").forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=(String)req.getSession().getAttribute("gid");
		String pwd=(String)req.getParameter("changepwd");
		MembersDao dao=MembersDao.getIntstance();
		int n=dao.updatePwd(id,pwd);
		if(n>0)req.getRequestDispatcher("/updatemember/update").forward(req, resp);
		
	}
}
