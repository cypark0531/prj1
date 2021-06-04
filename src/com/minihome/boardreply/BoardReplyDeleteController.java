package com.minihome.boardreply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.BoardReplyDao;
@WebServlet("/boardreply/delete")
public class BoardReplyDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String hid = req.getParameter("id");
		String gid = req.getParameter("gid");
		String bcontent = req.getParameter("bcontent");
		int rnum = Integer.parseInt(req.getParameter("rnum"));
		String btitle= req.getParameter("btitle");
		String regdate = req.getParameter("regdate");
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		
		int bgroup = Integer.parseInt(req.getParameter("bgroup"));
		int n =BoardReplyDao.getInstance().boardreplyDelete(bgroup);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/board/detail?b="+bgroup+"&id="+hid+"&gid="+gid+
					"&regdate="+regdate+"&btitle="+btitle+"&rnum="+rnum+"&b="+bgroup+"&bnum="+bnum);
		}else {
			System.out.println("실패");
		}
	}
}
