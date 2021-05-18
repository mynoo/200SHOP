package shopping.reply.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.board.controller.BoardListController;
import shopping.board.model.BoardDao;
import shopping.common.controller.SuperClass;
import shopping.common.model.DatabaseDao;
import shopping.reply.model.Reply;

public class ReplyInsertController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String comment = request.getParameter("comment") ;
		String mid = request.getParameter("mid") ;
		
		Reply bean = null ;
		DatabaseDao dao = new DatabaseDao();
		String data = dao.toString() ; 
		
		request.setAttribute("bean", null);
		
		if (this.validate(request) == true) {
			System.out.println("reply insert validation check success");
			int cnt = - 999999 ;
			cnt = dao.InsertreplyData(bean) ;
			
			new BoardListController().doGet(request, response); 
			
		} else {
			System.out.println("reply insert validation check failure");
			
			request.setAttribute("bean", bean);
			String gotopage = "/board/board_detailexam.jsp" ;
			super.GotoPage(gotopage);
		}
		
		String gotopage = "/board/boDetailView.jsp" ;
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
}