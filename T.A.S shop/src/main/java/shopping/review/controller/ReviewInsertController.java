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

public class ReviewInsertController extends SuperClass{
	private Review bean = null ;
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}

	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
//		String id = request.getParameter("id") ;
//		int no = Integer.parseInt(request.getParameter("no")) ;
		
		bean = new Review();
		MultipartRequest multi = (MultipartRequest)request.getAttribute("multi") ;
		bean.setPno(Integer.parseInt(multi.getParameter("pno")));
		bean.setMid(multi.getParameter("mid"));
		bean.setVcomment(multi.getParameter("vcomment")); 
		
		System.out.println("mid : " + multi.getParameter("mid"));
		System.out.println("vcomment : " + multi.getParameter("vcomment"));
		System.out.println("pno : " + Integer.parseInt(multi.getParameter("pno")));
		
		
		ReviewDao dao = new ReviewDao();
		int cnt = -999999 ;
		cnt = dao.InsertData(bean) ;
		
		
		request.setAttribute("bean", bean);
		
		new ProductDetailViewController().doGet(request, response);
		
		
		
	}
	
	
}
