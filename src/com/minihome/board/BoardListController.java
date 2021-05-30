package com.minihome.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.BoardDao;
import com.minihome.vo.BoardVo;
@WebServlet("/board/list")
public class BoardListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		System.out.println(id);
		ArrayList<BoardVo> boardlist = BoardDao.getInstance().boardList(id);
		for(BoardVo vo : boardlist) {
			System.out.println("d");
			System.out.println(vo.getBtitle());
		}
		req.setAttribute("boardlist", boardlist);
		req.getRequestDispatcher("/board/boardlist.jsp").forward(req, resp);
		

	}

}
