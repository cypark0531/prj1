package com.login;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.MembersDao;
import com.minihome.vo.MembersVO;
@WebServlet("/login/findpwd")
public class FindPwdController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/login/findpwd.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		String question=req.getParameter("question");
		String answer=req.getParameter("answer");
		MembersVO vo=new MembersVO();
		vo.setId(id);
		vo.setName(name);
		vo.setQuestion(question);
		vo.setAnswer(answer);
		
		MembersDao dao=MembersDao.getIntstance();
		String pwd=dao.findPwd(vo);
		
		req.setAttribute("pwd", pwd);
		req.getRequestDispatcher("/login/findpwdresult.jsp").forward(req, resp);
	}
}
