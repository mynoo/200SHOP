package shopping.member.controller;

import java.io.IOException;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import shopping.common.controller.SuperClass;
import shopping.member.model.Member;
import shopping.member.model.MemberDao;

public class MemberInsertController extends SuperClass {
private Member bean = null ;
	
	@Override
	public boolean validate(HttpServletRequest request) {
		boolean isCheck = true ;
		// 유효성 검사 수행 예정
		if (bean.getId().length() < 4 || bean.getId().length() > 10) {
			request.setAttribute(super.PREFIX + "id", "아이디는 4자리 이상 10자리 이하이어야 합니다.");
			isCheck = false ;
		}
		if (bean.getName().length() < 2 || bean.getName().length() > 10) {
			request.setAttribute(super.PREFIX + "name", "이름은(는) 2자리 이상 10자리 이하이어야 합니다.");
			isCheck = false ;
		}
		if (bean.getPassword().length() < 4 || bean.getPassword().length() > 10) {
			request.setAttribute(super.PREFIX + "password", "비밀 번호는 4자리 이상 10자리 이하이어야 합니다.");
			isCheck = false ;
		}
		if (bean.getGender() == null ) {
			request.setAttribute(super.PREFIX + "gender", "성별은 반드시 체크가 되어야 합니다.");
			isCheck = false ;
		}
		
		// 날짜 형식은 yyyy/mm/dd 또는 yyyy-mm-dd 
		String regex = "\\d{4}[-/]\\d{2}[-/]\\d{2}" ;
		
		if (bean.getBirth() == null) {
			bean.setBirth("");
		}
		
		boolean result = Pattern.matches(regex, bean.getBirth()) ;
		if (result == false) {
			request.setAttribute(super.PREFIX + "birth", "생일은 yyyy/mm/dd 또는 yyyy-mm-dd으로 입력해 주셔야 합니다.");
			isCheck = false ;
		}
		
		if (bean.getZipcode() == null || bean.getZipcode() == "" ) {
			request.setAttribute(super.PREFIX + "zipcode", "우편 번호는 필수 입력 사항입니다.");
			isCheck = false ;
		}
		
		return isCheck ;
	}
	
	@Override
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		bean = new Member(); 
		
		bean.setAddress1(request.getParameter("address1"));
		bean.setAddress2(request.getParameter("address2"));
		bean.setBirth(request.getParameter("birth"));
		bean.setGender(request.getParameter("gender"));
		bean.setId(request.getParameter("id"));
		bean.setEmail(request.getParameter("email"));
		bean.setZipcode(request.getParameter("zipcode"));
		bean.setName(request.getParameter("name"));
		bean.setPassword(request.getParameter("password"));
		
		if (request.getParameter("point") == null || request.getParameter("point").equals("")) {
			bean.setPoint(0);	
		}else {
			bean.setPoint(Integer.parseInt(request.getParameter("point")));
		}
		
		MemberDao dao = new MemberDao();
		
		if (this.validate(request) == true) { 
			System.out.println("member insert validation check success");
			int cnt = -99999 ; 
			
			System.out.println("id :" + bean.getId());
			System.out.println("name :" + bean.getName());
			System.out.println("password :" + bean.getPassword());
			System.out.println("birth :" + bean.getBirth());
			System.out.println("email :" + bean.getEmail());
			System.out.println("gender :" + bean.getGender());
			System.out.println("zipcode :" + bean.getZipcode());
			System.out.println("addr1 :" + bean.getAddress1());
			System.out.println("addr2 :" + bean.getAddress2());
			System.out.println("point :" + bean.getPoint());
			
			
			cnt = dao.InsertData(bean) ;
			
			new MemberLoginController().doGet(request, response);
			
		} else {
			System.out.println("member insert validation check failure");
			
			request.setAttribute("bean", bean);
			super.doPost(request, response);
			String gotopage = "/member/mInsert.jsp" ;
			super.GotoPage(gotopage);
		}		
	}
	
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		super.doGet(request, response);
		
		String gotopage = "/member/mInsert.jsp" ;
		super.GotoPage(gotopage);
	}
}

