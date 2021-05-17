package shopping.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import shopping.common.controller.SuperClass;
import shopping.member.model.Member;
import shopping.product.controller.ProductDetailViewController;
import shopping.product.controller.ProductListController;
import shopping.review.model.Review;
import shopping.review.model.ReviewDao;

public class ReviewMainController extends SuperClass{
	private Review bean = null ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		
		System.out.println("여기는 리뷰 메인컨트롤러!");
//		String id = request.getParameter("id") ;
//		int no = Integer.parseInt(request.getParameter("no")) ;
		System.out.println("pno는 : " + request.getParameter("pno"));
		int pno = Integer.parseInt(request.getParameter("pno")) ;
		
		
		bean = new Review();
		Member mem = new Member();
//		MultipartRequest multi = (MultipartRequest)request.getAttribute("multi") ;
		bean.setPno(pno);
		
		System.out.println("pno : " + bean.getPno());
//		System.out.println("mid : " + );
//		System.out.println("pno : " + Integer.parseInt(multi.getParameter("pno")));
		
		
//		ReviewDao dao = new ReviewDao();
//		int cnt = -999999 ;
//		cnt = dao.InsertData(bean) ;
//		
//		
		request.setAttribute("bean", bean);
//		
//		new ProductDetailViewController().doGet(request, response);
		
		String gotopage = "/review/prReview.jsp" ;
		super.GotoPage(gotopage);
		
	}
	
	
}
