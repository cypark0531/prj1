package com.minihome.search;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.FriendDao;
import com.minihome.dao.MembersDao;
import com.minihome.vo.MembersVO;

@WebServlet("/search/search")
public class SearchController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=(String)req.getSession().getAttribute("gid");
		String str=req.getParameter("str");

		System.out.println(str);
		MembersDao mdao=MembersDao.getIntstance();
		FriendDao fdao=FriendDao.getInstance();
		ArrayList<MembersVO> mlist=mdao.getMembers(str);
		System.out.println(mlist);
		ArrayList<SearchList> slist=new ArrayList<>();
		for(MembersVO vo:mlist) {
			System.out.println(vo.getId());
			SearchList s=new SearchList(vo.getId(), vo.getName(), fdao.getFriendState(id, vo.getId()));
			slist.add(s);
		}
		req.setAttribute("str",str);
		req.setAttribute("list",slist);
		req.getRequestDispatcher("/search/search.jsp").forward(req, resp);
	}
}
