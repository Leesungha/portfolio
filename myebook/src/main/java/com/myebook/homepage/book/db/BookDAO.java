package com.myebook.homepage.book.db;

import java.util.List;

public interface BookDAO {

	// 카테고리
	public List<CategoryDTO> category() throws Exception;

	// 상품등록
	public void registerBook(BookDTO book) throws Exception;

	// 상품목록
	public List<BookDTO> booklist() throws Exception;

	// 상품조회
	public BookDTO bookview(int bkid) throws Exception;

	// 상품조회 + 카테고리 조인
	public BookDTO bookjoinview(int bkid) throws Exception;

	// 상품수정
	public void bookmodify(BookDTO book) throws Exception;

	// 상품삭제
	public void bookdelete(int bkid) throws Exception;

	// 주문 목록
	public List<OrderDTO> orderList() throws Exception;

	// 특정 주문 목록
	public List<OrderListDTO> orderView(OrderDTO order) throws Exception;

	// 배송 상태
	public void delivery(OrderDTO order) throws Exception;

	// 상품 수량 조절
	public void changeStock(BookDTO book) throws Exception;

	// 모든 소감(댓글)
	public List<ReplyDTO> allReply() throws Exception;

	// 소감(댓글) 삭제
	public void deleteReply(int rid) throws Exception;

}
