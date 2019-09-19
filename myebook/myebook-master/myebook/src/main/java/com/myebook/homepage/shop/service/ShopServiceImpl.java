package com.myebook.homepage.shop.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myebook.homapage.common.Search;
import com.myebook.homepage.book.db.BookCateDTO;
import com.myebook.homepage.book.db.BooklikeDTO;
import com.myebook.homepage.book.db.CartDTO;
import com.myebook.homepage.book.db.CartListDTO;
import com.myebook.homepage.book.db.OrderDTO;
import com.myebook.homepage.book.db.OrderDetailsDTO;
import com.myebook.homepage.book.db.OrderListDTO;
import com.myebook.homepage.book.db.ReplyDTO;
import com.myebook.homepage.book.db.ShopDAO;

@Service
public class ShopServiceImpl implements ShopService{

	@Inject
	private ShopDAO dao;
		
	//카테고리별 상품 리스트
	//	@Override
	//	public List<BookCateDTO> list(int cate_name) throws Exception{
	//		return dao.list(cate_name);
	//		
	//	}
	
	// 카테고리별 상품 리스트
	@Override
	public List<BookCateDTO> list(int level, int cate_name, Search search) throws Exception {
	 
	// int cateCodeRef = 0; // 카테고리 참조 코드. 없어도 무관
		 return dao.list(level, cate_name, search);
	 
	}
	
	// 총 게시글 개수 확인
	@Override
	public int getBookListCnt(int level, int cate_name, Search search) throws Exception {
		
		
		return dao.getBookListCnt(level, cate_name, search);

	}
	
	
	public BookCateDTO shopview(int bkid) throws Exception{		
		return dao.shopview(bkid);
	}
	

	public List<BookCateDTO> numberOfLike(int bkid) throws Exception{
		return dao.numberOfLike(bkid);
	}
	
	//상품 댓글 작성
	@Override
	public void registReply(ReplyDTO reply) throws Exception{
		dao.registReply(reply);
	}
	
	//상품 댓글 리스트
	@Override
	public List<ReplyDTO> replyList(int bkid) throws Exception{
		return dao.replyList(bkid);
	}
	
	//소감 수정
	public void modifyReply(ReplyDTO reply) throws Exception{
		dao.modifyReply(reply);
	}
	
	//모든 소감(댓글)
	public List<ReplyDTO> allReply() throws Exception{
		return dao.allReply();
	}
			
	//(관리자 권한으로)소감 삭제
	public void deleteReply(int rid) throws Exception{
		dao.deleteReply(rid);
	}
	
	//상품 삭제
	public void deleteReply(ReplyDTO reply) throws Exception{
		dao.deleteReply(reply);
	}
	
	//아이디 체크
	@Override
	public String idCheck(int rid) throws Exception{
		return dao.idCheck(rid);
	}
	
	//카트 담기
	public void addCart(CartDTO cart) throws Exception{
		dao.addCart(cart);
	}
	
	//카트 리스트
	public List<CartListDTO> cartList(String user_id) throws Exception{
		return dao.cartList(user_id);
	}
	
	//카트 삭제
	public void deleteCart(CartDTO cart) throws Exception{
		dao.deleteCart(cart);
	}
	
	//주문 정보
	public void orderInfo(OrderDTO order) throws Exception{
		dao.orderInfo(order);
	}
		
	//주문 상세 정보
	public void orderInfo_Details(OrderDetailsDTO orderDetail) throws Exception{
		dao.orderInfo_Details(orderDetail);
	}
	
	//카트 비우기
	public void cartAllDelete(String user_id) throws Exception{
		dao.cartAllDelete(user_id);
	}
	

	//주문 목록
	public List<OrderDTO> orderList(OrderDTO order) throws Exception{
		return dao.orderList(order);
	}
	
	//특정 주문 목록
	public List<OrderListDTO> orderView(OrderDTO order) throws Exception{
		return dao.orderView(order);
	}
	
	public void insertBoardLike(BooklikeDTO booklike) throws Exception {
        dao.insertBookLike(booklike);
        dao.updateBookLike(booklike.getBkid());
    }

	public void deleteBoardLike(BooklikeDTO booklike) throws Exception {
        dao.deleteBookLike(booklike);
        dao.updateBookLike(booklike.getBkid());
    }
    
	public int getBoardLike(BooklikeDTO booklike) throws Exception {
        return dao.getBookLike(booklike);
    }

	public void getBookStar(ReplyDTO reply) throws Exception{
		dao.getBookStar(reply);
	}
	
	@Override
	public int check_star(int bkid, int id) throws Exception {
		return dao.check_star(bkid, id);
		
	}
	
	@Override
	public float getStar(int bkid, int id) throws Exception {
		return dao.getStar(bkid, id);
		
	}

}
