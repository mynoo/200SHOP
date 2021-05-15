package shopping.review.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.product.model.Product;
import shopping.product.model.ProductDao;
import shopping.review.model.Review;
import shopping.review.model.ReviewDao;
import shopping.utility.FlowParameters;
import shopping.utility.Paging;

public class ReviewListController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		int pno = Integer.parseInt(request.getParameter("pno")) ;
		
		
//		FlowParameters parameters 
//			= new FlowParameters(
//					request.getParameter("pageNumber"), 
//					request.getParameter("mode"), 
//					request.getParameter("keyword")); 
//		
//		System.out.println("parameter list ");
//		System.out.println(parameters.toString());
			
//		String contextPath = request.getContextPath() ;
//		String url = contextPath + "/Shopping?command=prList" ;
		
		ReviewDao dao = new ReviewDao();
		
		// 행(row) 총 개수
//		int totalCount = dao.SelectTotalCount(parameters.getMode(), parameters.getKeyword()) ; 
//		System.out.println("total data size : " + totalCount); 
//		
//		Paging pageInfo = new Paging(
//								parameters.getPageNumber(), 
//								totalCount, 
//								url, 
//								parameters.getMode(), 
//								parameters.getKeyword()) ;	 	

		List<Review> lists = dao.SelectDataList(pno) ;
		
//		System.out.println("product list count : " + lists.size()); 
		
		request.setAttribute("lists", lists);
//		request.setAttribute("pageInfo", pageInfo);
		
		// 자주 사용되는 파라미터를 속성으로 정의합니다. 
//		request.setAttribute("parameters", parameters.toString());
		
		
		String gotopage = "/product/prReviewList.jsp" ;
		super.GotoPage(gotopage);
	}	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
	}
}