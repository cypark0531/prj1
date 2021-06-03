package com.minihome.board;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.PageContext;

import com.minihome.dao.BoardDao;
import com.minihome.vo.BoardVo;
@WebServlet("/board/insert")
public class BoardInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String btitle= req.getParameter("btitle");
		String bcontent= req.getParameter("bcontent");
		int bopen = Integer.parseInt(req.getParameter("bopen"));
		BoardVo vo = new BoardVo(0, id, btitle, bcontent, bopen, null);
		int n =BoardDao.getInstance().boardInsert(vo);
		if(n>0) {
			String path = "/board/insert.jsp";
			req.setAttribute("path", path);
			req.getRequestDispatcher("/home").forward(req, resp);
		}else {
			System.out.println("실패");
		}
	}
}
