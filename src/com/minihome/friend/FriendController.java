package com.minihome.friend;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.minihome.dao.FriendDao;
import com.minihome.dao.MembersDao;
import com.minihome.vo.FriendVo;
@WebServlet("/friend/friend")
public class FriendController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//String host=req.getParameter("host");
		String host="test11";
		int page=1;
		if(req.getParameter("page")!=null)page=Integer.parseInt(req.getParameter("page"));
		FriendDao dao=FriendDao.getInstance();
		MembersDao mdao=MembersDao.getIntstance();
		ArrayList<FriendCk> flist= new ArrayList<FriendCk>();
		ArrayList<FriendVo> list=dao.getFriend(host, page);
		System.out.println(host+" "+page);
		for(FriendVo vo:list) {
			int fnum=vo.getFriendnum();
			String id=vo.getHid();
			String name=mdao.getName(id);
			int state=Integer.parseInt(vo.getFriendstate());
			FriendCk ck=new FriendCk(fnum, id, name, state);
			flist.add(ck);
		}
		int lastpage = dao.lastPage(host);
		req.setAttribute("list", flist);
		req.setAttribute("page", page);
		req.setAttribute("lastpage", lastpage);
		req.getRequestDispatcher("/friend/friend.jsp").forward(req, resp);
	}
}
