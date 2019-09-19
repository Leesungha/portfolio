package com.myebook.homepage.book.db;

import java.util.List;

import com.myebook.homapage.common.Search;
import com.myebook.homepage.board.db.BoardDTO;

public interface ShopDAO {
	
	//카테고리별 상품 리스트
	//public List<BookCateDTO> list(int cate_name) throws Exception;

	public List<BookCateDTO> list(int level, int cate_name, Search search) throws Exception;
	
	public int getBookListCnt(int level, int cate_name, Search search) throws Exception;
	
	public List<BookCateDTO> list(int cate_name) throws Exception;

	//상품조회
	public BookCateDTO shopview(int bkid) throws Exception;

	public List<BookCateDTO> numberOfLike(int bkid) throws Exception;

	//상품 소감(댓글) 작성
	public void registReply(ReplyDTO reply) throws Exception;

	//상품 소감(댓글) 리스트
	public List<ReplyDTO> replyList(int bkid) throws Exception;

	//댓글 삭제
	public void deleteReply(ReplyDTO reply)throws Exception;
	
	//아이디 체크
	public String idCheck(int rid) throws Exception;

	//상품 소감 수정
	public void modifyReply(ReplyDTO reply) throws Exception;

	//모든 소감(댓글)
	public List<ReplyDTO> allReply() throws Exception;
	
	//(관리자 권한으로)소감 삭제
	public void deleteReply(int rid) throws Exception;
	
	//카트 담기
	public void addCart(CartDTO cart) throws Exception;

	//카트 리스트 출력
	public List<CartListDTO> cartList(String user_id) throws Exception;
	
	//카트 삭제
	public void deleteCart(CartDTO cart) throws Exception;

	//주문 정보
	public void orderInfo(OrderDTO order) throws Exception;
	
	//주문 상세 정보
	public void orderInfo_Details(OrderDetailsDTO orderDetail) throws Exception;

	//카트 비우기
	public void cartAllDelete(String user_id) throws Exception;
	
	//주문 목록
	public List<OrderDTO> orderList(OrderDTO order) throws Exception;
	
	public int getBookLike(BooklikeDTO booklike) throws Exception;

    public void insertBookLike(BooklikeDTO booklike) throws Exception;

    public void deleteBookLike(BooklikeDTO booklike) throws Exception;
    
    public void updateBookLike(int bkid) throws Exception;
	
	//특정 주문 목록
	public List<OrderListDTO> orderView(OrderDTO order) throws Exception;
	
	//별점 평균
    public void getBookStar(ReplyDTO reply) throws Exception;
    
    //별점 중복 검사
    public int check_star(int bkid, int id) throws Exception;
    
    public float getStar(int bkid, int id) throws Exception;


		
}
