package shopping.mall.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.common.model.ShoppingInfo;
import shopping.mall.model.Order;
import shopping.mall.model.OrderDao;
import shopping.mall.model.OrderDetail;
import shopping.mall.model.OrderDetailDao;
import shopping.member.model.Member;
import shopping.member.model.MemberDao;

public class MallDetailController extends SuperClass {
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String gotopage = "/orderdetail/orderinformation.jsp";
		super.GotoPage(gotopage);
		
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doPost(request, response);
		
		String id = (String)super.session.getAttribute("id");
		int oid = (Integer)request.getAttribute("oid");
		
		Member bean = null;
		MemberDao mdao = new MemberDao();
		
		bean = mdao.SelectDataByPk(id);
		
		OrderDetailDao odao = new OrderDetailDao();
		
		List<ShoppingInfo> lists = odao.showDetail(oid);

		request.setAttribute("bean", bean);
		request.setAttribute("lists", lists);
		
		super.doPost(request, response);
	
		String gotopage = "/orderdetail/orderdetail.jsp" ;
		super.GotoPage(gotopage);
	
	}
}