package shopping.board.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.board.model.Board;
import shopping.board.model.BoardDao;
import shopping.common.controller.SuperClass;
import shopping.member.model.Member;

public class BoardDetailViewController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int no = Integer.parseInt(request.getParameter("no")) ;
		
		BoardDao dao = new BoardDao();
		Board bean = dao.SelectDataByPk(no) ;

		
		Member loginfo = (Member)super.session.getAttribute("loginfo") ;
		
		
		if (loginfo.getId().equals(bean.getWriter()) == false
				|| bean.getWriter() == null) {
			dao.UpdateReadhit(no) ;
			bean.setDepth( bean.getDepth() + 1 ); 
		}	
		request.setAttribute("bean", bean);
		
		String gotopage = "/board/boDetailView.jsp" ;
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	
	}
}






