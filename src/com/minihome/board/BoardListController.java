package com.minihome.board;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.BoardDao;
import com.minihome.dao.FriendDao;
import com.minihome.vo.BoardVo;
@WebServlet("/board/list")
public class BoardListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String)req.getSession().getAttribute("id");
		String gid = (String) req.getSession().getAttribute("gid");
		
		String spageNum=req.getParameter("pageNum");
		int pageNum=1;
		if(spageNum!=null) {
			pageNum= Integer.parseInt(spageNum);
		}
		int startRow= (pageNum-1)*10+1;
		int endRow= startRow+9;
		ArrayList<BoardVo> boardlist = BoardDao.getInstance().boardList(id,startRow,endRow);
		int pageCount=(int)Math.ceil(BoardDao.getInstance().getCount(id)/10.0);
		int startPageNum= ((pageNum-1)/10*10)+1;
		int endPageNum= startPageNum+9;
		if(endPageNum>pageCount) {
			endPageNum=pageCount; 
			boolean friend = FriendDao.getInstance().friendOK(id, gid);
		req.setAttribute("friend", friend);
		req.setAttribute("boardlist", boardlist);
		req.setAttribute("pageCount", pageCount);
		req.setAttribute("startPageNum", startPageNum);
		req.setAttribute("endPageNum", endPageNum);
		req.setAttribute("pageNum", pageNum);
		req.getRequestDispatcher("/board/boardlist.jsp").forward(req, resp);
		

	}
	

	}
}
