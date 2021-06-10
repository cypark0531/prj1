package com.minihome.profile;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.ProfilesDao;
import com.minihome.vo.ProfilesVo;

@WebServlet("/profile/list")
public class ImgfileListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ProfilesDao dao = ProfilesDao.getInstance();
		ArrayList<ProfilesVo> list = dao.list();
		String id = req.getParameter("id");
		
	//	req.setAttribute("list", list);
		for(ProfilesVo vo :  list) {
			if(id.equals(vo.getId())) {
				req.setAttribute("vo", vo);
			}
		}
	
		if (id != null) {
			req.getRequestDispatcher("/profile/profilelist(update).jsp").forward(req, resp);
			
		} else {
			req.getRequestDispatcher("/profile/insert.jsp").forward(req, resp);
		}
	}
}
