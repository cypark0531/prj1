package com.goods;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.GoodsDao;
import com.minihome.vo.GoodsVo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
@WebServlet("/goods/insert")
public class GoodsinsertController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String saveDir=getServletContext().getRealPath("/goodsimgfile");
		MultipartRequest mr=new MultipartRequest(
				req, 
				saveDir,
				1024*1024*5,
				"utf-8",
				new DefaultFileRenamePolicy()
				);
		System.out.println("업로드 경로:" + saveDir);
		String gcode=mr.getParameter("gcode");
		int gprice=Integer.parseInt(mr.getParameter("gprice"));
		String gname=mr.getParameter("gname");
		String gorgimg=mr.getOriginalFileName("gsaveimg");
		String gsaveimg=mr.getFilesystemName("gsaveimg");
		String gcategory=mr.getParameter("gcategory");
		GoodsDao dao=GoodsDao.getInstance();
		File f=new File(saveDir+"\\"+gsaveimg);
		GoodsVo vo=new GoodsVo(gcode, gprice, gname, gsaveimg, gorgimg, gcategory);
		int n=dao.goodsinsert(vo);
		if(n>0) {
			req.setAttribute("code","success");
		}else {
			req.setAttribute("code","fail");
		}
		System.out.println(gsaveimg);
		req.getRequestDispatcher("/goods/goodsresult.jsp").forward(req, resp);
	}
}
