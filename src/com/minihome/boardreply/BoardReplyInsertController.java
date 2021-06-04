package com.minihome.boardreply;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.minihome.dao.BoardReplyDao;
import com.minihome.vo.BoardreplyVo;
@WebServlet("/boardreply/insert")
public class BoardReplyInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int bnum = Integer.parseInt(req.getParameter("bnum"));
		String hid = req.getParameter("id");
		String bcontent = req.getParameter("bcontent");
		int rnum = Integer.parseInt(req.getParameter("rnum"));
		String btitle= req.getParameter("btitle");
		String regdate = req.getParameter("regdate");
		
		
		String brcontent = req.getParameter("brcontent");
		int bgroup = Integer.parseInt(req.getParameter("bgroup"));
		int brlevel = 0;
		if(bgroup!=0)brlevel=1;
		String gid = req.getParameter("gid");
		
		
		
		BoardreplyVo vo = new BoardreplyVo(0, bnum, hid, brcontent, bgroup, brlevel, 0, gid, null);
		int n = BoardReplyDao.getInstance().reinsert(vo);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/board/detail?b="+bgroup+"&id="+hid+"&gid="+gid+
					"&brcontent="+brcontent+"&regdate="+
					regdate+"&btitle="+btitle+"&rnum="+rnum+"&b="+bgroup+"&bnum="+bnum);
		}else {
			System.out.println("실패");
		}
		
	}
}
