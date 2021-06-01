package com.minihome.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.BoardDao;
import com.minihome.vo.BoardVo;
@WebServlet("/board/update")
public class BoardUpdateController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		;
		req.setAttribute("vo", BoardDao.getInstance().getBoard(bnum));
		req.getRequestDispatcher("/board/update.jsp").forward(req, resp);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String btitle= req.getParameter("btitle");
		String bcontent= req.getParameter("bcontent");
		int bopen = Integer.parseInt(req.getParameter("bopen"));
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		
		BoardVo vo = new BoardVo(bnum, id, btitle, bcontent, bopen, null);
		int n =BoardDao.getInstance().boardUpdate(vo);
		System.out.println("n :" +n);
		if(n>0) {
			req.getRequestDispatcher("/board/list").forward(req, resp);
		}else {
			System.out.println("실패");
	}
	}
}
