package com.myebook.homepage.book.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.myebook.homepage.book.db.BookDAO;
import com.myebook.homepage.book.db.BookDTO;
import com.myebook.homepage.book.db.BooklikeDTO;
import com.myebook.homepage.book.db.CategoryDTO;
import com.myebook.homepage.book.db.OrderDTO;
import com.myebook.homepage.book.db.OrderListDTO;
import com.myebook.homepage.book.db.ReplyDTO;

@Service
public class BookServiceImpl implements BookService {
	
	@Inject
	private BookDAO dao;	
	
	//카테고리
	@Override
	public List<CategoryDTO> category() throws Exception{
		return dao.category();
		
	}
	
	//상품등록
	@Override
	public void registerBook(BookDTO book) throws Exception{
		dao.registerBook(book);
		
	}
	
	//상품목록
	public List<BookDTO> booklist() throws Exception{
		System.out.println("서비스");
		return dao.booklist();
	}
	
	//상품조회
	public BookDTO bookview(int bkid) throws Exception{
		return dao.bookview(bkid);
	}
	

	public BookDTO bookjoinview(int bkid) throws Exception{
		return dao.bookjoinview(bkid);
		
	}
	
	//상품수정
	public void bookmodify(BookDTO book) throws Exception{
		dao.bookmodify(book);
	}
	
	//상품삭제
	public void bookdelete(int bkid) throws Exception{
		dao.bookdelete(bkid);
	}
	
	//주문 목록
	public List<OrderDTO> orderList() throws Exception{
		return dao.orderList();
	}
		
	//특정 주문 목록
	public List<OrderListDTO> orderView(OrderDTO order) throws Exception{
		return dao.orderView(order);
	}
		
	//배송 상태
	public void delivery(OrderDTO order) throws Exception{
		dao.delivery(order);
	}

	//상품 수량 조절
	public void changeStock(BookDTO book) throws Exception{
		dao.changeStock(book);
	}
	
	//모든 소감(댓글)
	public List<ReplyDTO> allReply() throws Exception{
		
		return dao.allReply();
	}
	
	//소감(댓글) 삭제
	public void deleteReply(int rid) throws Exception{
		dao.deleteReply(rid);
	}
	
	
	

}
