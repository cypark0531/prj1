package com.minihome.gallery;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.GalleryDao;
import com.minihome.vo.GalleryVo;
@WebServlet("/gallery/list")
public class GalleryListController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			String id = req.getParameter("id");
			ArrayList<GalleryVo> list = GalleryDao.getInstance().galleryList(id);
			resp.setContentType("text/xml;charset=utf-8");
			PrintWriter pw = resp.getWriter();
			pw.print("<?xml version=\"1.0\" encoding=\"utf-8\"?>");
			pw.print("<result>");
			for(GalleryVo vo : list) {
				pw.print("<gallery>");
				pw.print("<galnum>"+vo.getGalnum()+"</galnum>");
				pw.print("<id>"+vo.getId()+"</id>" );
				pw.print("<galtitle>"+vo.getGaltitle()+"</galtitle>");
				pw.print("<galcontent>"+vo.getGalcontent()+"</galcontent>");
				pw.print("<galorgname>"+vo.getGalorgname()+"</galorgname>" );
				pw.print("<galsavename>"+vo.getGalsavename()+"</galsavename>");
				pw.print("<galopen>"+vo.getGalopen()+"</galopen>");
				pw.print("<regdate>"+vo.getRegdate()+"</regdate>");
				pw.print("</gallery>");
			}
			pw.print("</result>");
	}
	
}
