package shopping.board.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.board.model.Board;
import shopping.board.model.BoardDao;
import shopping.common.controller.SuperClass;
@WebServlet(value = "/board/update")
public class BoardUpdateController extends SuperClass {	
	private Board bean = null ; 
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int no = Integer.parseInt(request.getParameter("no")) ;
		BoardDao dao = new BoardDao();

		Board bean = dao.SelectDataByPk(no) ; 
		
		request.setAttribute("bean", bean);
		
		String gotopage = "/board/boUpdateForm.jsp" ;
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		bean = new Board() ;
		bean.setBcontents(request.getParameter("bcontents")); 
		bean.setTitle(request.getParameter("title"));
		bean.setWriter(request.getParameter("writer"));
		bean.setBno(Integer.parseInt(request.getParameter("bno")));		
		bean.setDepth(Integer.parseInt(request.getParameter("depth")));
		
		System.out.println("bean information");
		System.out.println(bean.toString()); 
		
		if (this.validate(request) == true) {
			System.out.println("board update validation check success");
			BoardDao dao = new BoardDao();
			int cnt = - 999999 ;
			cnt = dao.UpdateData(bean) ;
			
			new BoardListController().doGet(request, response); 
			
		} else {
			System.out.println("board update validation check failure");
			
			request.setAttribute("bean", bean);
			String gotopage = "/board/boUpdateForm.jsp" ;
			super.GotoPage(gotopage);
		}
	}

	
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true ;		
		if (bean.getTitle().length() < 3 || bean.getTitle().length() > 10) {
			request.setAttribute(super.PREFIX + "subject", "제목은 3자리 이상 10자리 이하이어야 합니다.");
			isCheck = false ;
		}
		
		if (bean.getBcontents().length() < 5 || bean.getBcontents().length() > 30) {
			request.setAttribute(super.PREFIX + "content", "글 내용은 5자리 이상 30자리 이하이어야 합니다.");
			isCheck = false ;
		}
		return isCheck ;
	}
}