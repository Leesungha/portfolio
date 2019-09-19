package com.myebook.homepage.board.db;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.myebook.homapage.common.Pagination;
import com.myebook.homapage.common.Search;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Inject
	SqlSession sqlsession = null;

	// 게시글 리스트 가져오기
	@Override
	public List<BoardDTO> getBoardList(String cate_cd, Search search) throws Exception {
		System.out.println("daoimpl에서 cate_cd값은"+cate_cd);
		if(cate_cd.equals("자유")) {
			System.out.println("자유다아아아아");
			return sqlsession.selectList("board.getBoardList", search);
		} else if(cate_cd.equals("공지")){
			return sqlsession.selectList("board.getNoticeList", search);
		} else {
			return sqlsession.selectList("board.getInquiryList", search);
		}
	}		
	
	// 게시글 조회
	@Override
	public BoardDTO getBoardContent(int bid) throws Exception {
		return sqlsession.selectOne("board.getBoardContent", bid);

	}

	// 게시글 입력
	@Override
	public void insertBoard(BoardDTO board) throws Exception {
		System.out.println("DAO" + board);
		sqlsession.insert("board.insertBoard", board);
	}

	// 게시글 수정
	@Override
	public int updateBoard(BoardDTO board) throws Exception {
		return sqlsession.update("board.updateBoard", board);

	}

	// 게시글 삭제
	@Override
	public int deleteBoard(int bid) throws Exception {
		return sqlsession.insert("board.deleteBoard", bid);

	}

	// 게시글 조회수 반환
	@Override
	public int updateViewCnt(int bid) throws Exception {
		return sqlsession.update("board.updateViewCnt", bid);

	}

	// 게시글 리스트 수 반환
	@Override
	public int getBoardListCnt(Search search, String cate_cd) throws Exception {
		 HashMap<String, Object> map = new HashMap<String, Object>();
		 
		 map.put("cate_cd", cate_cd);
		 map.put("search", search);
		return sqlsession.selectOne("board.getBoardListCnt", map);

	}

	// 게시글 댓글 리스트 가져오기
	@Override
	public List<ReplyDTO> getReplyList(int bid) throws Exception {
		return sqlsession.selectList("reply.getReplyList", bid);

	}

	// 게시글 댓글 저장
	@Override
	public int saveReply(ReplyDTO reply) throws Exception {
		return sqlsession.insert("reply.saveReply", reply);

	}

	// 게시글 댓글 수정
	@Override
	public int updateReply(ReplyDTO reply) throws Exception {
		return sqlsession.update("reply.updateReply", reply);

	}

	// 게시글 댓글 삭제
	@Override
	public int deleteReply(int rid) throws Exception {
		return sqlsession.delete("reply.deleteReply", rid);

	}
	
	// 게시글 리스트 가져오기
	@Override
	public List<BoardDTO> getNoticeList(Search search) throws Exception {
		return sqlsession.selectList("board.getNoticeList", search);

	}


	
	
}
