package com.minihome.diary;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.DiaryDao;

@WebServlet("/diary/delete")
public class DiaryDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String gid = req.getParameter("gid");
		int dnum = Integer.parseInt(req.getParameter("dnum"));
		
		int n = DiaryDao.getInstance().delete(dnum);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/home?id="+id+"&gid="+gid);
		}else {
			System.out.println("실패");
		}
	}
}
