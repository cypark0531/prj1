package com.minihome.profile;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.ProfilesDao;
import com.minihome.vo.ProfilesVo;
@WebServlet("/profile/delete")
public class imgfileDeleteController extends HttpServlet {
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				String id = req.getParameter("id");
				System.out.println("delte아이디넘아왔음"+id);
				String uploadPath = getServletContext().getRealPath("/homepageframe/img");
				ProfilesDao dao = ProfilesDao.getInstance();
				ProfilesVo vo = dao.getinfoVo(id);
				String filename = vo.getPsavegimg();

				try {
					File f = new File(uploadPath+"\\"+filename);
					boolean  n = f.delete();
					
					//int n1 = dao.delete(id);
					int n1 = dao.fileupdate(id);
					resp.sendRedirect(req.getContextPath()+"/profile/list?code=1&id="+id);
				}catch(Exception se) {
						se.printStackTrace();
						req.getRequestDispatcher("/profile/profilelist(update).jsp").forward(req, resp);
						
				}
					
		
		
		
		}
	
}
