package shopping.mall.controller;

import java.io.IOException;

import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.common.model.CompositeDao;
import shopping.common.model.ShoppingInfo;
import shopping.mall.model.MallDao;
import shopping.mall.model.Order;
import shopping.mall.model.OrderDao;
import shopping.member.controller.MemberLoginController;
import shopping.member.model.Member;

public class MallDetailController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		Member loginfo = (Member)super.session.getAttribute("loginfo") ;
		
		if (loginfo == null) {
			new MemberLoginController().doGet(request, response); 
			
		} else {
			int oid = Integer.parseInt(request.getParameter("oid")) ;
			
			MallDao mdao = new MallDao();			
			Order order = mdao.SelectDataByPk(oid) ;
			
			OrderDao odao = new OrderDao();
			List<Order> lists = odao.SelectDataList(oid) ;
			
			request.setAttribute("order", order); // order information
			request.setAttribute("lists", lists); // shopping information
			
			String gotopage = "/mall/mallDetail.jsp" ;
			super.GotoPage(gotopage);
		}
	}
}