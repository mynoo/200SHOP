package shopping.reply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import shopping.common.controller.SuperClass;
import shopping.common.model.DatabaseDao;
import shopping.reply.model.Reply;

public class ReplyDeleteController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String id = request.getParameter("id") ;
		int rno = Integer.parseInt(request.getParameter("rno")) ;
		
		Reply bean = null ;
		DatabaseDao dao = new DatabaseDao();
		String data = dao.toString() ; 
		
		request.setAttribute("bean", null);
		
		int cnt = -99999 ;
		cnt = dao.DeletereplyData(rno) ;
		
		String gotopage = "/board/board_detailexam.jsp" ;
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
}