package com.minihome.gallery;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.GalleryDao;
import com.minihome.dao.ProfilesDao;
import com.minihome.vo.GalleryVo;
import com.minihome.vo.ProfilesVo;
@WebServlet("/gallery/delete")
public class galleryDeleteController extends HttpServlet {
		@Override
		protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				int galnum = Integer.parseInt(req.getParameter("galnum"));
				System.out.println("galnum(delete컨트롤러):"+galnum);
				String uploadPath = getServletContext().getRealPath("/homepageframe/img");
				GalleryDao dao = GalleryDao.getInstance();
				GalleryVo vo = dao.getinfoVo(galnum);
				String filename = vo.getGalsavename();

				try {
					File f = new File(uploadPath+"\\"+filename);
					boolean  n = f.delete();
					
			
					int n1 = dao.delete(galnum);
					int n2 = dao.fileupdate(galnum);
					resp.sendRedirect(req.getContextPath()+"/gallery/list.jsp?code=1&galnum="+galnum);
				}catch(Exception se) {
						se.printStackTrace();
						req.getRequestDispatcher("/gallery/update2.jsp").forward(req, resp);
						
				}
					
		
		 
		
		}
	
}
