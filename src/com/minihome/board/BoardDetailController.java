package com.minihome.board;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.BoardReplyDao;
import com.minihome.vo.BoardreplyVo;
@WebServlet("/board/detail")
public class BoardDetailController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		String btitle = req.getParameter("btitle");
		int rnum = Integer.parseInt(req.getParameter("rnum"));
		String bcontent = req.getParameter("bcontent");
		String regdate = req.getParameter("regdate");
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum= Integer.parseInt(spageNum);
		}
		
		int pageCount=(int)Math.ceil(BoardReplyDao.getInstance().getCount(bnum)/5.0);
		System.out.println(pageCount);
		int startPageNum= ((pageNum-1)/5*5)+1;
		int endPageNum= startPageNum+4;
		if(endPageNum>pageCount) {
			endPageNum=pageCount;
			//boolean friend = FriendDao.getInstance().friendOK(id, gid);
		
		}
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.getRequestDispatcher("/board/detail.jsp").forward(req, resp);
		
		
	}

	}
