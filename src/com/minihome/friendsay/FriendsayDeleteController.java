package com.minihome.friendsay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.FriendsayDao;
@WebServlet("/friendsay/delete")
public class FriendsayDeleteController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id= req.getParameter("id");
		String gid = req.getParameter("gid");
		String fsnum1 = req.getParameter("fsnum");
		int fsnum = 0;
		int fsgroup = 0;
		if(fsnum1!=null) {
			fsnum = Integer.parseInt(fsnum1);
			
		}else {
			fsgroup = Integer.parseInt(req.getParameter("fsgroup"));
		}
		
		int n =FriendsayDao.getInstance().delete(fsgroup, fsnum);
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/friendsay/friendsaylist.jsp?id="+id+"&gid="+gid);
		}else {
			System.out.println("실패");
		}
		
	}
}
