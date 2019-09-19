package com.myebook.homepage.book.db;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class BookDAOImpl implements BookDAO{
	
	@Inject
	private SqlSession sqlsession;
	
	//카테고리
	@Override
	public List<CategoryDTO> category() throws Exception{		
		 return sqlsession.selectList("category.category");
		
	}
	
	//상품등록
	@Override
	public void registerBook(BookDTO book) throws Exception{
		System.out.println("register이당~");
		System.out.println(book.getBookname());
		System.out.println(book.getLevel());
		System.out.println(book.getCate_cdRef());
		sqlsession.insert("book.insert", book);
			
	}
	
	//상품목록
	public List<BookDTO> booklist() throws Exception{
		return sqlsession.selectList("book.booklist");
	}
	
	//상품조회
	public BookDTO bookview(int bkid) throws Exception{
		return sqlsession.selectOne("book.bookview", bkid);
	}
	
	public BookDTO bookjoinview(int bkid) throws Exception{
		return sqlsession.selectOne("book.bookjoinview", bkid);
		
	}
	
	//상품수정
	public void bookmodify(BookDTO book) throws Exception{
		sqlsession.update("book.bookmodify",book);
	}
	
	//상품삭제
	public void bookdelete(int bkid) throws Exception{
		sqlsession.delete("book.bookdelete",bkid);
	}
	
	//주문 목록
	public List<OrderDTO> orderList() throws Exception{
		return sqlsession.selectList("book.orderList");
	}
		
	//특정 주문 목록
	public List<OrderListDTO> orderView(OrderDTO order) throws Exception{
		return sqlsession.selectList("book.orderView",order);
	}
		
	//배송 상태
	public void delivery(OrderDTO order) throws Exception{
		sqlsession.update("book.delivery",order);
	}

	//상품 수량 조절
	public void changeStock(BookDTO book) throws Exception{
		sqlsession.update("book.changeStock", book);
	}
	
	//모든 소감(댓글)
	public List<ReplyDTO> allReply() throws Exception{
	return sqlsession.selectList("bookreply.allReply");
		
	}
	
	//소감(댓글) 삭제
	public void deleteReply(int rid) throws Exception{
		sqlsession.delete("bookreply.deleteReply",rid);
		
	}
	


}
