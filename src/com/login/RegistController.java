package com.login;
 
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.MembersDao;
import com.minihome.vo.MembersVO;
@WebServlet("/login/regist")
public class RegistController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/login/regist.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String question=req.getParameter("question");
		String answer=req.getParameter("answer");
		
		MembersVO vo= new MembersVO(id, pwd, name, email, phone, question, answer, 0, 0);
		MembersDao dao=MembersDao.getIntstance();
		int n=dao.insert(vo);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/login/login.jsp");
		}else {
			resp.sendRedirect(req.getContextPath()+"/login/fail.jsp");
		}
	}
}
