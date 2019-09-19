package com.myebook.homepage.shop.service;

import java.util.List;

import com.myebook.homapage.common.Search;
import com.myebook.homepage.book.db.BookCateDTO;
import com.myebook.homepage.book.db.BooklikeDTO;
import com.myebook.homepage.book.db.CartDTO;
import com.myebook.homepage.book.db.CartListDTO;
import com.myebook.homepage.book.db.OrderDTO;
import com.myebook.homepage.book.db.OrderDetailsDTO;
import com.myebook.homepage.book.db.OrderListDTO;
import com.myebook.homepage.book.db.ReplyDTO;

public interface ShopService {

	// public List<BookCateDTO> list(int cate_name) throws Exception;
	public List<BookCateDTO> list(int cate_name, int level, Search search) throws Exception;

	public int getBookListCnt(int level, int cate_name, Search search) throws Exception;

	public BookCateDTO shopview(int bkid) throws Exception;

	public List<BookCateDTO> numberOfLike(int bkid) throws Exception;

	// 상품 댓글 작성
	public void registReply(ReplyDTO reply) throws Exception;

	// 상품 소감 리스트
	public List<ReplyDTO> replyList(int bkid) throws Exception;

	// 상품 소감 수정
	public void modifyReply(ReplyDTO reply) throws Exception;

	// 모든 소감(댓글)
	public List<ReplyDTO> allReply() throws Exception;

	// (관리자 권한으로)소감 삭제
	public void deleteReply(int rid) throws Exception;

	// 상품 삭제
	public void deleteReply(ReplyDTO reply) throws Exception;

	// 아이디 체크
	public String idCheck(int rid) throws Exception;

	// 카트 담기
	public void addCart(CartDTO cart) throws Exception;

	// 카트 리스트
	public List<CartListDTO> cartList(String user_id) throws Exception;

	// 카트 삭제
	public void deleteCart(CartDTO cart) throws Exception;

	// 주문 정보
	public void orderInfo(OrderDTO order) throws Exception;

	// 주문 상세 정보
	public void orderInfo_Details(OrderDetailsDTO orderDetail) throws Exception;

	// 카트 비우기
	public void cartAllDelete(String user_id) throws Exception;

	// 주문 목록
	public List<OrderDTO> orderList(OrderDTO order) throws Exception;

	// 특정 주문 목록
	public List<OrderListDTO> orderView(OrderDTO order) throws Exception;

	public void insertBoardLike(BooklikeDTO booklike) throws Exception;

	public void deleteBoardLike(BooklikeDTO booklike) throws Exception;

	public void getBookStar(ReplyDTO reply) throws Exception;

	public int check_star(int bkid, int id) throws Exception;

	public float getStar(int bkid, int id) throws Exception;

}
