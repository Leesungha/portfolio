package com.myebook.homepage.book.db;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myebook.homapage.common.Search;

@Repository
public class ShopDAOImpl implements ShopDAO {
	
	@Inject
	private SqlSession sqlsession;
	
	//카테고리별 상품 리스트
	/*@Override
	public List<BookCateDTO> list(int cate_name) throws Exception{
		
		return sqlsession.selectList("shop.list",cate_name);
	}*/
	// 카테고리별 상품 리스트 : 1차 분류
	@Override
	public List<BookCateDTO> list(int level, int cate_name, Search search) throws Exception {
	 
	 HashMap<String, Object> map = new HashMap<String, Object>();
	 
	 map.put("level", level);
	 map.put("cate_name", cate_name);
	 map.put("search", search);
	 
	 if(cate_name%100==0) {
		 return sqlsession.selectList("shop.list_2", map);
		 
	 } else {
	 
	 return sqlsession.selectList("shop.list_1", map);
	 }
	}
	
//	// 카테고리별 상품 리스트 : 2차 분류
//	@Override
//	public List<BookCateDTO> list(int cate_name, Search search) throws Exception {
//		 
//		 HashMap<String, Object> map = new HashMap<String, Object>();
//		 map.put("cate_name", cate_name);
//		 map.put("search",search);
//		 
//	return sqlsession.selectList("shop.list_2", map);
//	}
	
	// 게시글 리스트 수 반환
	@Override
	public int getBookListCnt(int level, int cate_name, Search search) throws Exception {
	
		HashMap<String, Object> map = new HashMap<String, Object>();
		 
		 map.put("level", level);
		 map.put("cate_name", cate_name);
		 map.put("search", search);
		 
		 if(cate_name%100==0) {
			 return sqlsession.selectOne("shop.getBookListCnt_2", map);
			 
		 } else {
		 
		 return sqlsession.selectOne("shop.getBookListCnt_1", map);
		 }
	

	}	

	
	public BookCateDTO shopview(int bkid) throws Exception{
		
		return sqlsession.selectOne("shop.bookview", bkid);
	}
	

	public List<BookCateDTO> numberOfLike(int bkid) throws Exception{
		
		return sqlsession.selectList("shop.numberOfLike", bkid);
	}

	public void registReply(ReplyDTO reply) throws Exception{
		sqlsession.insert("bookreply.saveReply", reply);
	}
	
	//상품 소감(댓글) 리스트
	public List<ReplyDTO> replyList(int bkid) throws Exception{
		return sqlsession.selectList("bookreply.replyList",bkid);
	}
	
	//댓글 삭제
	public void deleteReply(ReplyDTO reply) throws Exception{
		sqlsession.delete("bookreply.userdeleteReply", reply);
	}
	
	//모든 소감(댓글)
	public List<ReplyDTO> allReply() throws Exception{
		return sqlsession.selectList("bookreply.allReply");
	}
		
	//(관리자 권한으로)소감 삭제
	public void deleteReply(int rid) throws Exception{
		sqlsession.delete("bookreply.deleteReply",rid);
	}
	
	//아이디 체크
	public String idCheck(int rid) throws Exception{
		return sqlsession.selectOne("bookreply.replyUserIdCheck",rid);
	}
	
	//상품 소감 수정
	public void modifyReply(ReplyDTO reply) throws Exception{
		sqlsession.update("bookreply.modifyReply", reply);
	}
	
	//카트 담기
	public void addCart(CartDTO cart) throws Exception{
		sqlsession.insert("shop.addCart", cart);
	}
	
	//카트 리스트
	public List<CartListDTO> cartList(String user_id) throws Exception{
		return sqlsession.selectList("shop.cartList",user_id);
	}
	
	//카트 삭제
	@Override
	public void deleteCart(CartDTO cart) throws Exception{
		sqlsession.delete("shop.deleteCart", cart);
	}
	
	//주문 정보
	public void orderInfo(OrderDTO order) throws Exception{
		sqlsession.insert("shop.orderInfo",order);
	}
	
	//주문 상세 정보
	public void orderInfo_Details(OrderDetailsDTO orderDetail) throws Exception{
		sqlsession.insert("shop.orderInfo_Details", orderDetail);
	}
	
	//카트 비우기
	public void cartAllDelete(String user_id) throws Exception{
	    sqlsession.delete("shop.cartAllDelete",user_id);		
	}
	

	//주문 목록
	public List<OrderDTO> orderList(OrderDTO order) throws Exception{
		return sqlsession.selectList("shop.orderList",order);
	}
	
	//특정 주문 목록
	public List<OrderListDTO> orderView(OrderDTO order) throws Exception{
		return sqlsession.selectList("book.orderView",order);
	}
	
	@Override
    public int getBookLike(BooklikeDTO booklike) throws Exception {
        return sqlsession.selectOne("book.getBoardLike", booklike);
    }

    @Override
    public void insertBookLike(BooklikeDTO booklike) throws Exception {
    	sqlsession.insert("book.createBoardLike", booklike);
    }

    @Override
    public void deleteBookLike(BooklikeDTO booklike) throws Exception {
    	sqlsession.delete("book.deleteBoardLike", booklike);
    }

    @Override
    public void updateBookLike(int bkid) throws Exception {
    	sqlsession.update("book.updateBoardLike",bkid);
    }
    
    //별점 평균
  	public void getBookStar(ReplyDTO reply) throws Exception{
  		sqlsession.update("bookreply.updateBoardStar",reply);
  	}
  	
  	//별점 중복 검사
    public int check_star(int bkid, int id) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
   	 
   	 	map.put("bkid", bkid);
   	 	map.put("id", id);
		return sqlsession.selectOne("bookreply.check_doublestar", map);
	}
    
    public float getStar(int bkid, int id) throws Exception{
    	HashMap<String, Object> map = new HashMap<String, Object>();
      	map.put("bkid", bkid);
   	 	map.put("id", id);
    	return sqlsession.selectOne("bookreply.getStar", map);
    }

	@Override
	public List<BookCateDTO> list(int cate_name) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
  	

}
