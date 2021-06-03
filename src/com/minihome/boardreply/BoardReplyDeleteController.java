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
		int bgroup = Integer.parseInt(req.getParameter("bgroup"));
		int n =BoardReplyDao.getInstance().boardreplyDelete(bgroup);
		if(n>1) {
			req.getRequestDispatcher("/board/detail.jsp").forward(req, resp);
		}else {
			System.out.println("실패");
		}
	}
}
