package shopping.reply.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.reply.model.Reply;
import shopping.reply.model.ReplyDao;
@WebServlet(value = "/reply/insert")
public class ReplyIesertController extends SuperClass {
	private Reply bean01 = null ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String gotopage = "/reply/reply_Insert.jsp" ;
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		bean01 = new Reply() ;
		bean01.setComment(request.getParameter("comment")); 
		bean01.setDate(request.getParameter("date"));
		bean01.setGroupno(Integer.parseInt(request.getParameter("groupno")));
		bean01.setRno(Integer.parseInt(request.getParameter("rno")));
		bean01.setMid(request.getParameter("mid"));
		
		System.out.println("bean01 information");
		System.out.println(bean01.toString()); 
		
		if (this.validate(request) == true) {
			System.out.println("reply insert validation check success");
			ReplyDao dao = new ReplyDao();
			int cnt = - 999999 ;
			cnt = dao.InsertData(bean01) ;
			
			
		} else {
			System.out.println("reply insert validation check failure");
			
			request.setAttribute("bean01", bean01);
			String gotopage = "/reply/reply_Insert.jsp" ;
			super.GotoPage(gotopage);
		}
		
	}
	
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true ;		
		
		if (bean01.getComment().length() < 5 || bean01.getComment().length() > 30) {
			request.setAttribute(super.PREFIX + "content", "글 내용은 5자리 이상 30자리 이하이어야 합니다.");
			isCheck = false ;
		}
		return isCheck ;
	}
}
