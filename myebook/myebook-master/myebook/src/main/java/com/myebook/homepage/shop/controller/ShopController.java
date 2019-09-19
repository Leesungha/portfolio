package com.myebook.homepage.shop.controller;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myebook.homapage.common.Pagination;
import com.myebook.homapage.common.Search;
import com.myebook.homepage.book.db.BookCateDTO;
import com.myebook.homepage.book.db.BooklikeDTO;
import com.myebook.homepage.book.db.CartDTO;
import com.myebook.homepage.book.db.CartListDTO;
import com.myebook.homepage.book.db.OrderDTO;
import com.myebook.homepage.book.db.OrderDetailsDTO;
import com.myebook.homepage.book.db.OrderListDTO;
import com.myebook.homepage.book.db.ReplyDTO;
import com.myebook.homepage.member.db.MemberDTO;
import com.myebook.homepage.shop.service.ShopServiceImpl;

@Controller
@RequestMapping("/")
public class ShopController {

	@Inject
	private ShopServiceImpl service;

	// 카테고리별 상품 리스트
	@RequestMapping(value = "list.do", method = RequestMethod.GET)
	public String getList(Model model
			, @RequestParam(required = false, defaultValue = "1") int page
			, @RequestParam(required = false, defaultValue = "1") int range
			, @RequestParam(required = false, defaultValue = "bookname") String searchType
			, @RequestParam(required = false) String keyword 
			, @RequestParam("cate_name") int cate_name 
			, @RequestParam("level") int level) throws Exception {
		
		System.out.println(cate_name);
		
		Search search = new Search();
		search.setSearchType(searchType);
		search.setKeyword(keyword);

		// 전체 게시글 개수
		int listCnt = service.getBookListCnt(level, cate_name, search);	
		search.pageInfo(page, range, listCnt);
		
		// Pagination 객체생성

		Pagination pagination = new Pagination();
		pagination.pageInfo(page, range, listCnt);		

				model.addAttribute("pagination", search);
				System.out.println(cate_name+"실종되신게 이쯤이십니까?");
				model.addAttribute("list", service.list(level, cate_name, search));
				model.addAttribute("cate_name",cate_name);
				model.addAttribute("level",level);
				model.addAttribute("listCnt",listCnt);
		
		return "include/shop/list";
	}

	// 상품 조회
	@RequestMapping(value = "/view.do", method = RequestMethod.GET,  produces = "application/json")
	public String getView(@RequestParam("n") int bkid, Model model, HttpServletRequest session) throws Exception {
	
	 BookCateDTO view = service.shopview(bkid);
	 model.addAttribute("view", view);
	 
	 int id = ((MemberDTO) session.getSession().getAttribute("member")).getId();
		
	 BooklikeDTO booklike = new BooklikeDTO();
	 booklike.setBkid(bkid);
	 booklike.setId(id);
	 
	 int loveorhate = service.getBoardLike(booklike);
	 System.out.println(loveorhate);
	 model.addAttribute("loveorhate",loveorhate);
	  
	 /*List<ReplyDTO> reply = service.reply*/
	 
	 return "include/shop/view";
	}
	
	@RequestMapping(value = "/numberOfLike", method = RequestMethod.POST,  produces = "application/json")
	@ResponseBody
	public List<BookCateDTO> numberOfLike(@RequestParam("n") int bkid, HttpServletRequest httpRequest) throws Exception {
	
	 return service.numberOfLike(bkid);
	}
	
	 @ResponseBody
	 @RequestMapping(value = "/heart", method = {RequestMethod.POST}, produces = "application/json")
	 public int heart(HttpServletRequest httpRequest) throws Exception {

	 int heart = Integer.parseInt(httpRequest.getParameter("heart"));
	 int bkid = Integer.parseInt(httpRequest.getParameter("bkid"));
	 int id = ((MemberDTO) httpRequest.getSession().getAttribute("member")).getId();

	 BooklikeDTO booklike = new BooklikeDTO();

	        booklike.setBkid(bkid);
	        booklike.setId(id);

	        System.out.println(heart);

	        if(heart >= 1) {
	            service.deleteBoardLike(booklike);
	            heart=0;
	        } else {
	            service.insertBoardLike(booklike);
	            heart=1;
	        }

	        return heart;

	    }
	
	/*// 상품 조회 - 소감(댓글) 작성
	@RequestMapping(value = "/save.do", method = RequestMethod.POST)
	public String registReply(@RequestParam("bkid") int bkid, ReplyDTO reply, HttpSession session) throws Exception {
	  
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 reply.setUser_id(member.getUser_id());
	 reply.setId(member.getId());
	 System.out.println("겟 유저 아이디"+member.getId());
	 reply.setNickname(member.getNickname());
	 System.out.println("겟 유저 아이디"+member.getNickname());
	 reply.setBkid(bkid);
		
	 service.registReply(reply);
	 
	 return "redirect:/view.do?n=" + reply.getBkid();
	}*/
	
	@InitBinder
	 public void allowEmptyDateBinding(WebDataBinder binder, HttpServletRequest request) {
	  // 빈문자열(empty string) 대신 NULL로 전송값을 대체 합니다..
	  binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
	  //이전 페이지 기억
	  String referrer = request.getHeader("Referer");
	     request.getSession().setAttribute("prevPage", referrer);
	 }
	
	
	// 상품 소감(댓글) 목록
	@ResponseBody
	@RequestMapping(value = "/view/replyList", method = RequestMethod.GET)
	public List<ReplyDTO> getReplyList(@RequestParam("n") int bkid) throws Exception {
	    
	 List<ReplyDTO> reply = service.replyList(bkid);
	 
	 return reply;
	} 
	
	// 상품 소감(댓글) 작성   
	@ResponseBody
	@RequestMapping(value = "/view/save.do", method = RequestMethod.POST)
	public boolean registReply(ReplyDTO reply, HttpSession session,
			 @RequestParam("bkid") int bkid) throws Exception {
	 
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 
	 
	 reply.setNickname(member.getNickname());  
	 reply.setUser_id(member.getUser_id());
	 reply.setId(member.getId());
	 
	 if(service.check_star(bkid, member.getId())>=1) {
		 System.out.println("별점 중복");
		 return false;
		
	 } else {
		 
		 service.registReply(reply);
		 service.getBookStar(reply);
		 System.out.println("별점, 댓글 등록 완료");
		 // service.(reply);	
		 return true;
	 }
	} 
	
	
	
	// 상품 소감(댓글) 삭제
	@ResponseBody
	@RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
	public int getReplyList(ReplyDTO reply, HttpSession session) throws Exception {
	 
	 int result = 0;
	 
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 String userId = service.idCheck(reply.getRid());
	   
	 if(member.getUser_id().equals(userId)) {
		 
		 System.out.println("멤버 이름"+member.getUser_id());
		 System.out.println("작성자와 아이디 일치");
	  
	  reply.setUser_id(member.getUser_id());
	  System.out.println("댓글 아이디 세팅"+reply.getUser_id());
	  service.deleteReply(reply);
	  service.getBookStar(reply);
	  
	  result = 1;
	 }
	 
	 return result; 
	}
	
	// 상품 소감(댓글) 수정
	@ResponseBody
	@RequestMapping(value = "/view/modifyReply", method = RequestMethod.POST)
	public int modifyReply(ReplyDTO reply, HttpSession session) throws Exception {
	 
	 int result = 0;
	 
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 String userId = service.idCheck(reply.getRid());
	 
	 if(member.getUser_id().equals(userId)) {
	  
	  reply.setUser_id(member.getUser_id());
	  service.modifyReply(reply);
	  service.getBookStar(reply);
	  
	  result = 1;
	 }
	 return result;
	} 
	
	// 별 수정 시
	@ResponseBody
	@RequestMapping(value = "/getStar", method = RequestMethod.GET)
	public float getStar(ReplyDTO reply, HttpSession session, Model model,
			@RequestParam("n") int bkid) throws Exception {		
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 int id = member.getId();
	 float star = service.getStar(bkid, id);
	 System.out.println(star);	
	 model.addAttribute("star", star);	
		
	 return star;
	}
	
	// 모든 소감(댓글)
	@RequestMapping(value = "/allReply", method = RequestMethod.GET)
	public void getAllReply(Model model) throws Exception {
	   
	 List<ReplyDTO> reply = service.allReply();
	 
	 model.addAttribute("reply", reply);
	}
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
	public int addCart(CartDTO cart, HttpSession session) throws Exception {
	 
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 
	 int result = 0;
	 
	 if(member != null) {
	 cart.setUser_id(member.getUser_id());
	 service.addCart(cart);
	 result = 1;
	}
	  return result;
	}
	
	// 카트 목록
	@RequestMapping(value = "/cartList.do", method = RequestMethod.GET)
	public String getCartList(HttpSession session, Model model) throws Exception {
	 
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 String userId = member.getUser_id();
	 System.out.println("들어왔음"+member.getUser_id());
	 
	 List<CartListDTO> cartList = service.cartList(userId);
	 
	 model.addAttribute("cartList", cartList);
	 
	 return "include/shop/cartList";
	 
	}
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "/deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") List<String> chArr, CartDTO cart) throws Exception {
	 
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 String userId = member.getUser_id();
	 
	 int result = 0;
	 int cartNum = 0;
	 
	 
	 if(member != null) {
	  cart.setUser_id(userId);
	  
	  for(String i : chArr) {   
	   cartNum = Integer.parseInt(i);
	   cart.setCartNum(cartNum);
	   service.deleteCart(cart);
	  }   
	  result = 1;
	 }  
	 return result;  
	}
	
	// 주문
	@RequestMapping(value = "orderList.do", method = RequestMethod.POST)
	public String order(HttpSession session, OrderDTO order, OrderDetailsDTO orderDetail) throws Exception {
	  
	 MemberDTO member = (MemberDTO)session.getAttribute("member");  
	 int userId = member.getId();
	 String user_id = member.getUser_id();
	 
	 Calendar cal = Calendar.getInstance();
	 int year = cal.get(Calendar.YEAR);
	 String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
	 String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
	 String subNum = "";
	 
	 for(int i = 1; i <= 6; i ++) {
	  subNum += (int)(Math.random() * 10);
	 }
	 
	 String orderId = ymd + "_" + subNum;
	 
	 order.setOdid(orderId);
	 order.setId(userId);
	 
	 System.out.println("test : " + order.getUserAddr2());
	  
	 service.orderInfo(order);
	 
	 orderDetail.setOdid(orderId);  
	 orderDetail.setUser_id(user_id);
	 service.orderInfo_Details(orderDetail);
	 
	 service.cartAllDelete(user_id);
	 
	 return "redirect:/shop/orderList";  
	 
	}
	
	// 주문 목록
	@RequestMapping(value = "/myorder.do", method = RequestMethod.GET)
	public String getOrderList(HttpSession session, OrderDTO order, Model model) throws Exception {
	 
	 MemberDTO member = (MemberDTO)session.getAttribute("member");
	 int userId = member.getId();
	 
	 order.setId(userId);
	 
	 List<OrderDTO> orderList = service.orderList(order);
	 
	 model.addAttribute("orderList", orderList);
	 
	 return "include/shop/orderList";
	}
	
	// 주문 상세 목록
	@RequestMapping(value = "/shoporderView", method = RequestMethod.GET)
	public String getOrderList(@RequestParam("n") String orderId,
	      OrderDTO order, Model model) throws Exception {
		order.setOdid(orderId);  
	 List<OrderListDTO> orderView = service.orderView(order);
	 model.addAttribute("orderView", orderView);
	 return "include/shop/orderView";
	
	}
	
	
		
}