package shopping.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.product.model.Product;
import shopping.product.model.ProductDao;

public class ProductDetailViewController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String pname = request.getParameter("pname");
		
		int pno = Integer.parseInt(request.getParameter("pno"));
		ProductDao dao = new ProductDao();
		
		Product bean = dao.SelectDataByPk(pno);
		
		System.out.println("pno : " + bean.getPno());
		System.out.println("alcohol : " + bean.getAlcohol());
		System.out.println("brand : " + bean.getBrand());
		System.out.println("category : " + bean.getCategory());
		System.out.println("content : " + bean.getContent());
		System.out.println("date : " + bean.getDate());
		System.out.println("image : " + bean.getImage());
		System.out.println("pname : " + bean.getPname());
		System.out.println("price : " + bean.getPrice());
		System.out.println("stock : " + bean.getStock());
		System.out.println("pvolume : " + bean.getVolume());
		
		if (bean == null) {
			new ProductListController().doGet(request, response);
			System.out.println("null 값 들어옴");
		} else {
			request.setAttribute("bean", bean);
			String gotopage = "/product/prDetailView.jsp" ;
			super.GotoPage(gotopage);
		}
	}
}