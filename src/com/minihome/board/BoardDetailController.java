package com.minihome.board;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.vo.BoardreplyVo;
@WebServlet("/board/detail")
public class BoardDetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		String btitle = req.getParameter("btitle");
		int rnum = Integer.parseInt(req.getParameter("rnum"));
		String bcontent = req.getParameter("bcontent");
		int b = Integer.parseInt(req.getParameter("b"));
		req.getRequestDispatcher("/board/detail.jsp").forward(req, resp);
		
		
	}

	}
