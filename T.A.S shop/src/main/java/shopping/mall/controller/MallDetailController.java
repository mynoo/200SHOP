package shopping.mall.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
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
		
		Member bean = null;
		MemberDao dao = new MemberDao();
		
		bean = dao.SelectDataByPk(id);

		request.setAttribute("bean", bean);
		super.doPost(request, response);
	
		String gotopage = "/orderdetail/orderdetail.jsp" ;
		super.GotoPage(gotopage);
	
	}
}