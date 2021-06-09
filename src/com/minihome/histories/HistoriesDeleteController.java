package com.minihome.histories;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.HistoriesDao;

@WebServlet("/histories/delete")
public class HistoriesDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String gid = req.getParameter("gid");
		int hnum = Integer.parseInt(req.getParameter("hnum"));
		int n =HistoriesDao.getInstance().delete(hnum);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/histories/list?id="+id+"&gid="+gid);
		}else {
			System.out.println("실패");
		}
	
	}
}
