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
import com.sun.jdi.Field;
@WebServlet("/board/list")
public class BoardListController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String)req.getSession().getAttribute("id");
		String gid = (String) req.getSession().getAttribute("gid");
		String searchContent = req.getParameter("searchContent");
		String spageNum=req.getParameter("pageNum");
		String field = req.getParameter("field");
		ArrayList<BoardVo> boardlist=null;
		int pageNum=1;
		if(spageNum!=null) {
			pageNum= Integer.parseInt(spageNum);
		}

		int pageCount=(int)Math.ceil(BoardDao.getInstance().getCount(id)/10.0);
		int startRow= (pageNum-1)*10+1;
		int endRow= startRow+9;
		if(searchContent==null||searchContent.equals("")) {
			boardlist = BoardDao.getInstance().boardList(id,startRow,endRow);
		}else {
			boardlist = BoardDao.getInstance().boardsearchList(gid, startRow, endRow, field, searchContent);
			pageCount= (int) ((int) Math.ceil(BoardDao.getInstance().searchgetCount(gid, field, searchContent))/10.0);
			System.out.println("pagecount" + pageCount);
		}
		
		int startPageNum= ((pageNum-1)/10*10)+1;
		int endPageNum= startPageNum+9;
		if(endPageNum>pageCount) {
			endPageNum=pageCount; 
			boolean friend = FriendDao.getInstance().friendOK(id, gid);
			req.setAttribute("field", field);
			req.setAttribute("searchContent", searchContent);
			req.setAttribute("pageCount", pageCount);
			req.setAttribute("startPageNum", startPageNum);
			req.setAttribute("endPageNum", endPageNum);
			req.setAttribute("pageNum", pageNum);
			req.setAttribute("boardlist", boardlist);
			req.setAttribute("friend", friend);
		req.getRequestDispatcher("/board/boardlist.jsp").forward(req, resp);
		}
		

	}
	

	}
