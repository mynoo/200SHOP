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
import shopping.member.controller.MemberLoginController;
import shopping.product.controller.ProductListController;
import shopping.product.model.Product;
import shopping.product.model.ProductDao;

public class MallListController extends SuperClass {
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		if (super.session.getAttribute("loginfo") == null) {
			new MemberLoginController().doGet(request, response);
		}
	}
}