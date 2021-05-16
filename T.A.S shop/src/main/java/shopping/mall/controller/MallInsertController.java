package shopping.mall.controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.mall.model.MyCart;
import shopping.product.controller.ProductDetailViewController;

public class MallInsertController extends SuperClass {
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);

		if (super.session.getAttribute("loginfo") == null) { 
			String message = "로그인이 필요합니다." ;
			super.setErrorMessage(message);
			
			String gotopage = "/member/meLoginForm.jsp" ;
			super.GotoPage(gotopage);
		} else {
			int pnum = Integer.parseInt(request.getParameter("pnum")) ;
			int stock = Integer.parseInt(request.getParameter("stock")) ;
			int qty = Integer.parseInt(request.getParameter("qty")) ;
			System.out.println("stock 주문 수량: "+  stock);
			if (stock < qty) {
				String message = "재고 수량이 부족합니다." ;
				super.setErrorMessage(message);
				new ProductDetailViewController().doGet(request, response);
			} else {
				MyCart mycart = (MyCart)super.session.getAttribute("mycart") ;
				if (mycart == null) {
					mycart = new MyCart() ;
				}
				mycart.AddOrder(pnum, qty); // put into mycart
				super.session.setAttribute("mycart", mycart);
				new MallOrderController().doGet(request, response);
			}
		}
	}
}