package shopping.mall.controller;

import java.io.IOException;



import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.mall.model.MyCart;
import shopping.mall.model.OrderDao;

public class MallDeleteController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);		
		String id = request.getParameter("id");
		System.out.println("id 확인 : " + id);
		if (super.session.getAttribute("loginfo") == null) {
			String gotopage = "/member/meLoginForm.jsp" ;
			super.GotoPage(gotopage);
			
		} else {
			MyCart mycart = (MyCart)super.session.getAttribute("mycart") ;
			if (mycart == null) {
				mycart = new MyCart();				
			}
			
			int pnum = Integer.parseInt(request.getParameter("pnum")) ;
			OrderDao mdao = new OrderDao();
			int cnt = -99999;
			cnt = mdao.DeleteOrder(pnum);
			super.session.setAttribute("mycart", mycart);
			new MallOrderController().doGet(request, response);
		}		
	}
}