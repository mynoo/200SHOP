package shopping.mall.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.common.model.ShoppingInfo;
import shopping.mall.model.MallDao;
import shopping.mall.model.MyCart;
import shopping.member.controller.MemberLoginController;
import shopping.member.model.Member;
import shopping.product.controller.ProductPrListController;
import shopping.product.model.Product;
import shopping.product.model.ProductDao;

public class MallOrderController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);

		Member loginfo = (Member) super.session.getAttribute("loginfo");

		if (loginfo == null) {
			new MemberLoginController().doGet(request, response);

		} else {
			MallDao dao = new MallDao();

			String id = request.getParameter("id");
			System.out.println("id : " + id);
			
			List<MyCart> lists = dao.OrderMall(id);
			System.out.println(lists.get(0));
			if (lists.size() == 0) {
				String message = "이전 쇼핑 내역이 존재하지 않습니다.";
				super.setErrorMessage(message);
				new ProductPrListController().doGet(request, response);
			} else {
				request.setAttribute("lists", lists);
				String gotopage = "/order/order.jsp";
				super.GotoPage(gotopage);
			} 
			MyCart mycart = (MyCart)super.session.getAttribute("mycart") ;
			if(mycart != null){
				Map<Integer, Integer> maplists = mycart.GetAllOrderList();
				System.out.println("cart item size : " + maplists.size());

				Set<Integer> keylist = maplists.keySet();

				List<ShoppingInfo> shoplists = new ArrayList<ShoppingInfo>();

				int totalAmount = 0; // 총 금액
				int totalPoint = 0; // 총 누적 포인트

				for (Integer pnum : keylist) {
					// pnum는 상품 번호

					int qty = maplists.get(pnum);

					ProductDao pdao = new ProductDao();
					Product bean = pdao.SelectDataByPk(pnum);

					// shopInfo : 상품 1개에 대한 정보를 저장하기 위한 클래스
					ShoppingInfo shopInfo = new ShoppingInfo();

					int price = bean.getPrice();

					totalAmount += qty * price;

					shopInfo.setImage(bean.getImage());
					shopInfo.setPname(bean.getPname());
					shopInfo.setPnum(pnum);
					shopInfo.setPrice(price);
					shopInfo.setQty(qty);

					shoplists.add(shopInfo);
				}

				super.session.setAttribute("totalAmount", totalAmount);
				super.session.setAttribute("totalPoint", totalPoint);
				super.session.setAttribute("shoplists", shoplists);

				String gotopage = "/mall/mallList.jsp";
				super.GotoPage(gotopage);
			}
		}
	}
}

//String id = request.getParameter("id") ;
//int no = Integer.parseInt(request.getParameter("no")) ;
//
//MyCartList mycart = new MyCartList(); 
//
//