package shopping.reply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.board.controller.BoardListController;
import shopping.common.controller.SuperClass;
import shopping.reply.model.ReplyDao;
@WebServlet(value = "/reply/delete")
public class ReplyDeleteController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int rno = Integer.parseInt(request.getParameter("rno")) ;
		
		ReplyDao dao = new ReplyDao();
		int cnt = -99999 ;
		cnt = dao.DeleteData(rno) ;
		
		new BoardListController().doGet(request, response);
		
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
}
