package com.minihome.profile;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.ProfilesDao;
import com.minihome.vo.ProfilesVo;
@WebServlet("/profile/update")
public class ImgfileUpdateController extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String id =  req.getParameter("id");
			ProfilesDao dao = ProfilesDao.getInstance();
			ProfilesVo vo = dao.getinfoVo(id);
			req.setAttribute("vo", vo);
			req.getRequestDispatcher("/profile/update.jsp").forward(req, resp);
	}
	

}
