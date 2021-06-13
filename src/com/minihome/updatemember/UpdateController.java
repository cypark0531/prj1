package com.minihome.updatemember;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.MembersDao;
import com.minihome.vo.MembersVO;
@WebServlet("/updatemember/update")
public class UpdateController extends HttpServlet{
	@Override
 	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 	String id=(String)req.getSession().getAttribute("gid");
		MembersDao dao =MembersDao.getIntstance();
	 	MembersVO vo=dao.getMember(id);
	 	req.setAttribute("vo", vo);
	 	req.getRequestDispatcher("/updatemember/update.jsp").forward(req, resp);	
 	}
 	@Override
 	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
 		String id=(String)req.getSession().getAttribute("gid");
 		String name=req.getParameter("name");
 		String email=req.getParameter("email");
 		String phone=req.getParameter("phone");
 		String question=req.getParameter("question");
 		String answer=req.getParameter("answer");
 		System.out.println(name+" "+email+" "+phone+" "+question+" "+answer);
 		MembersDao dao =MembersDao.getIntstance();
 		MembersVO vo=new MembersVO(id, null, name, email, phone, question, answer, 0, 0);
 		dao.update(vo);
 		resp.sendRedirect(req.getContextPath()+"/home");
 	}
}
