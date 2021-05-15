package shopping.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import shopping.board.controller.BoardDetailViewController;
import shopping.common.controller.SuperClass;
import shopping.product.controller.ProductDetailViewController;
import shopping.review.model.Review;
import shopping.review.model.ReviewDao;

public class ReviewUpdateController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int vnum = Integer.parseInt(request.getParameter("vnum")) ;
		ReviewDao dao = new ReviewDao();

		Review bean = dao.SelectDataByPk(vnum) ; 
		
		request.setAttribute("bean", bean);
		
		String gotopage = "/review/prReviewUpdate.jsp" ;
		super.GotoPage(gotopage);
		
		
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		int vnum = Integer.parseInt(request.getParameter("vnum")) ;
		System.out.println("vnum : " +  vnum);
		Review bean = new Review() ;
		MultipartRequest multi = (MultipartRequest)request.getAttribute("multi") ;
		bean.setVcomment(multi.getParameter("vcomment"));
//		bean.setVnum( Integer.parseInt(request.getParameter("vnum")) );
		bean.setPno(Integer.parseInt(request.getParameter("pno")));
		bean.setMid(request.getParameter("mid"));
		
		System.out.println("bean information");
		System.out.println(bean.toString()); 
		
			ReviewDao dao = new ReviewDao();
			int cnt = - 999999 ;
			cnt = dao.UpdateData(bean) ;
			
			if(cnt >= 0 )
			{
				System.out.println("board update validation check success");
				String gotopage = "/product/prDetailView.jsp" ;
				super.GotoPage(gotopage);
			}
			else
			{
			System.out.println("board update validation check failure");
			
			request.setAttribute("bean", bean);
			String gotopage = "/review/prReviewUpdate.jsp" ;
			super.GotoPage(gotopage);
			
		
			}
			}
}
