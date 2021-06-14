package com.login;
 
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.minihome.dao.GoodsDao;
import com.minihome.dao.MembersDao;
import com.minihome.dao.ProfilesDao;
import com.minihome.dao.StorageboxDao;
import com.minihome.vo.GoodsVo;
import com.minihome.vo.MembersVO;
import com.minihome.vo.ProfilesVo;
import com.minihome.vo.StorageboxVo;
@WebServlet("/login/regist")
public class RegistController extends HttpServlet{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.sendRedirect(req.getContextPath()+"/login/regist.jsp");
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id=req.getParameter("id");
		String pwd=req.getParameter("pwd");
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String question=req.getParameter("question");
		String answer=req.getParameter("answer");
		int anum=Integer.parseInt(req.getParameter("anum"));
		String gcode=req.getParameter("gcode");
		String glink=req.getParameter("glink");
		String gsaveimg=req.getParameter("gsaveimg");
		String gorgimg=req.getParameter("gorgimg");
		String gname=req.getParameter("gname");
		int purnum=Integer.parseInt(req.getParameter("purnum"));
		String  gcategory=req.getParameter("gcategory");
		String basicsetting=req.getParameter("basicsetting");
		
		gname="";
		StorageboxVo vo1=new StorageboxVo(anum, id, gcode, glink, gsaveimg, gorgimg, gname, purnum, gcategory, 0);
		int dao1=StorageboxDao.getInstance().storageinsert(vo1);
		
		
		MembersVO vo= new MembersVO(id, pwd, name, email, phone, question, answer, 0, 0);
		ProfilesDao pdao= ProfilesDao.getInstance();
		MembersDao dao=MembersDao.getIntstance();
		int n=dao.insert(vo);
		
		
		
		ProfilesVo provo  = new ProfilesVo(id,"none1.jpg", "none1.jpg","Profile Dosen't Not Exist.", "Plz Register!", "PlzRegister",0);
		ProfilesDao prodao = ProfilesDao.getInstance();
		int  pro =  prodao.insert(provo);
		
		ArrayList<ProfilesVo> list = new ArrayList<>();
		list =prodao.list(id);

		if(n>0 ) {
			resp.sendRedirect(req.getContextPath()+"/login/login.jsp");
			req.setAttribute("list", list);
		}else {
			resp.sendRedirect(req.getContextPath()+"/login/fail.jsp");
		}
	}
}
