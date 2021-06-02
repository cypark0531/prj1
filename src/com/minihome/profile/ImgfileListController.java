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
		ProfilesDao dao =  ProfilesDao.getInstance();
		ArrayList<ProfilesVo> list =   dao.list();
			req.setAttribute("list", list);
			req.getRequestDispatcher("/profile/list.jsp").forward(req, resp);
		
	}
}
