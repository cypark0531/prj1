package com.minihome.friendsay;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.FriendsayDao;
import com.minihome.vo.FriendsayVo;
@WebServlet("/friendsay/insert")
public class FriendsayInsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = (String) req.getSession().getAttribute("id");
		String gid = (String) req.getSession().getAttribute("gid");
		int fsgroup = Integer.parseInt(req.getParameter("fsgroup"));
		String fscontent = req.getParameter("inputContent");
		System.out.println(fscontent);
		FriendsayVo vo = new FriendsayVo(0, id, fscontent, 0, fsgroup, null, gid);
		
		int n = FriendsayDao.getInstance().insert(vo);
		
		if(n>0) {
			resp.sendRedirect(req.getContextPath()+"/home?id="+id+"&gid="+gid);
		}else {
			System.out.println("실패");
		}
		
	
	}
}
